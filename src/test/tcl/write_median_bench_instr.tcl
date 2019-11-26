# Contains the script for writing the instruction memory to load a program

set IMEM [expr 0x0000]
set memory_file "median_bench.txt"

proc write_burst {address value len} {
  create_hw_axi_txn -quiet -force wr_tx [get_hw_axis hw_axi_1] -address $address -data $value -len $len -type write
  run_hw_axi -quiet wr_tx
  delete_hw_axi_txn [get_hw_axi_txns *]
}

set heximem [format 0x%x $IMEM];
set working_dir [pwd]
set vivado_dir [get_property DIRECTORY [current_project]]
cd $vivado_dir
cd "../test/asm/median_bench"

puts "Writing instructions from input file to instruction memory location : $heximem"
puts $argv
set a [open $memory_file]
set lines [split [read $a] "\n"]
close $a;

set i $IMEM

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