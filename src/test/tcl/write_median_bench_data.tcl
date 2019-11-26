# Contains the script for writing the instruction memory to load a program

set DMEM [expr 0x200100]
set memory_file "median_bench_data.txt"

proc write_burst {address value len} {
  set formatted_addr [expr 0x$address]
  # Check for a 4kB AXI boundary, if there is a boundary, then break the task into multiple bursts
  if {$formatted_addr % 4096 + $len * 4 > 4096} {

    set modified_len [expr ((4096 - $formatted_addr % 4096) / 4)]

    set li [expr (9 * ($len + $modified_len - 1) - 2)]
    set ui [expr (9 * ($len - $modified_len))]
    set line [string range $value $ui $li]

    create_hw_axi_txn -quiet -force wr_tx [get_hw_axis hw_axi_1] -address $address -data $line -len $modified_len -type write
    run_hw_axi -quiet wr_tx
    delete_hw_axi_txn [get_hw_axi_txns *]

    # Perform the remaining burst
    set modified_address [expr ($formatted_addr + $modified_len * 4)]
    set modified_len [expr ($len - $modified_len)]
    set li [expr $ui - 2]
    set ui [expr 0]
    set line [string range $value $ui $li]
    create_hw_axi_txn -quiet -force wr_tx [get_hw_axis hw_axi_1] -address [format %x $modified_address] -data $line -len $modified_len -type write
    run_hw_axi -quiet wr_tx

  } else {
    create_hw_axi_txn -quiet -force wr_tx [get_hw_axis hw_axi_1] -address $address -data $value -len $len -type write
    run_hw_axi -quiet wr_tx
  }

  delete_hw_axi_txn [get_hw_axi_txns *]
}

set hexdmem [format 0x%x $DMEM];
set working_dir [pwd]
set vivado_dir [get_property DIRECTORY [current_project]]
cd $vivado_dir
cd "../test/asm/median_bench"

puts "Writing signal data from input file to data memory location : $hexdmem"
puts $argv
set a [open $memory_file]
set lines [split [read $a] "\n"]
close $a;

set i $DMEM

# Number of beats to write
set beats [expr 0]

# String which contains the data for each beat
set d ""

foreach line $lines {

  if {[string length $line] == 8} {

    if {$beats == 0} {
      set d "$line"
    } else {
      set d "${line}_${d}"
    }

    set beats [expr {$beats + 1}]
  }

  # If at the maximum allowable amount of beats, then write the data
  if {$beats == 256} {
    write_burst [format %x $i] $d $beats
    set i [expr {$i + 4 * $beats}]
    set beats [expr 0]
  }

}

# Write the remaining beats
if {$beats != 0} {
  write_burst [format %x $i] $d $beats
}

cd $working_dir