# Contains the script for verifying the rv32i_compliance program

# Set the status memory location and the time memory location
set STATUS [expr 0x100000]
set TIME_ADDR [expr 0x100004]
set CLOCK_SPEED [expr {1.0 / (75 * 10 ** 6)}]

# Number of milliseconds per second
set MS [expr 1000]

# Memory location of output
set OMEM [expr 0x100100]

# Number of samples
set SAMPLES 15000

# The file with the read data from the results of the median filter
set memory_file "median_bench_output.txt"
 
proc read_burst {address len} {
  set formatted_addr [expr 0x$address]
  # Check for a 4kB AXI boundary, if there is a boundary, then break the task into multiple bursts
  if {$formatted_addr % 4096 + $len * 4 > 4096} {
    set modified_len [expr ((4096 - $formatted_addr % 4096) / 4)]
    create_hw_axi_txn -quiet -force rd_tx [get_hw_axis hw_axi_1] -address $address -len $modified_len -type read
    run_hw_axi -quiet rd_tx
    set results [get_property DATA [get_hw_axi_txn rd_tx]]
    delete_hw_axi_txn [get_hw_axi_txns *]

    # Perform the remaining burst
    set modified_address [expr ($formatted_addr + $modified_len * 4)]
    set modified_len [expr ($len - $modified_len)]
    create_hw_axi_txn -quiet -force rd_tx [get_hw_axis hw_axi_1] -address [format %x $modified_address] -len $modified_len -type read
    run_hw_axi -quiet rd_tx

    set results "[get_property DATA [get_hw_axi_txn rd_tx]]${results}"
  } else {
    create_hw_axi_txn -quiet -force rd_tx [get_hw_axis hw_axi_1] -address $address -len $len -type read
    run_hw_axi -quiet rd_tx
    set results [get_property DATA [get_hw_axi_txn rd_tx]]
  }

  return $results
  delete_hw_axi_txn [get_hw_axi_txns *]
}

set working_dir [pwd]
set vivado_dir [get_property DIRECTORY [current_project]]
cd $vivado_dir
cd "../test/asm/median_bench"

puts "Waiting for RISC V Median Filter (15k Samples) Test to complete..."

set x "NOREAD"
while {$x != "da550002" && $x != "fa110002"} {
  set x [read_burst [format %x $STATUS] 1]
}

# Get the lower 32 bits of the cycle count
set cycles "0x[read_burst [format %x $TIME_ADDR] 1]"

# Get the upper 32 bits of the cycle count
set cyclesh "0x[read_burst [format %x [expr {$TIME_ADDR + 4}]] 1]"

# Find the total number of cycles
set cycles [expr $cycles + ($cyclesh << 32)]

# Find the time in seconds, based on the clock speed
set time [expr $cycles * $CLOCK_SPEED * $MS]

if {$x == "da550002"} {
  puts "Passed test!"
  puts "Number of processor cycles was $cycles."
  puts "Total time of execution was $time ms."
} else {
  puts "Failed test! An error state was entered."
}

set i $OMEM

# String which contains the data for each beat
set d "deadbeefcafebabe"

set outfile [open $memory_file w]

# For each max length burst
for {set b 0} {$b < ($SAMPLES / 256)} {incr b} {

  set d [read_burst [format %x $i] 256]
  
  for {set w 256} {$w > 0} {incr w -1} {
    set li [expr (8 * ($w - 1))]
    set ui [expr (8 * $w - 1)]
    set line [string range $d $li $ui]
    puts $outfile $line
  }
  incr i 1024

}

# Number of remaining beats in a burst
set beats [expr ($SAMPLES % 256)]

# Write the remaining beats
if {$beats != 0} {
  set d [read_burst [format %x $i] $beats]
  
  for {set w $beats} {$w > 0} {incr w -1} {
    set li [expr (8 * ($w - 1))]
    set ui [expr (8 * $w - 1)]
    set line [string range $d $li $ui]
    puts $outfile $line
  }
}

close $outfile
cd $working_dir