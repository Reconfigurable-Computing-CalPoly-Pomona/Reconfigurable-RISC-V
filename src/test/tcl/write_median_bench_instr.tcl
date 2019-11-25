# Contains the script for writing the instruction memory to load a program

set IMEM [expr 0x0000]
set memory_file "median_bench.txt"

proc write_mem {address value} {
    set address [string range $address 2 [expr {[string length $address]-1}]]
    create_hw_axi_txn -quiet -force wr_tx [get_hw_axis hw_axi_1] -address $address -data $value -len 1 -size 32 -type write
    run_hw_axi -quiet wr_tx
    delete_hw_axi_txn [get_hw_axi_txns *]
}
 
proc read_mem {address} {
    set address [string range $address 2 [expr {[string length $address]-1}]]
    create_hw_axi_txn -quiet -force rd_tx [get_hw_axis hw_axi_1] -address $address -len 1 -size 32 -type read
    run_hw_axi -quiet rd_tx
    return 0x[get_property DATA [get_hw_axi_txn rd_tx]]
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
foreach line $lines {
  
  # For every line, write a 32-bit instruction
  if {[string length $line] == 8} {
    write_mem [format 0x%x $i] $line
    set i [expr {$i + 4}]
  }

}

cd $working_dir

##create_hw_axi_txn we [get_hw_axis hw_axi_1] -address 00001000 -len 2 -type write -data {deadbeef cafebabe}
#create_hw_axi_txn get_status [get_hw_axis hw_axi_1] -address 00000000 -len 8 -type read
#create_hw_axi_txn get_time [get_hw_axis hw_axi_1] -address 00001ff8 -len 2 -type read
##run_hw_axi we
#run_hw_axi get_status
#run_hw_axi get_time

#delete_hw_axi_txn [get_hw_axi_txns *]