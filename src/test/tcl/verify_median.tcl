# Contains the script for verifying the rv32i_compliance program

# Set the status memory location and the time memory location
set STATUS [expr 0x100000]
set TIME_ADDR [expr 0x100004]
set CLOCK_SPEED [expr {1.0 / (75 * 10 ** 6)}]

# Number of milliseconds per second
set MS [expr 1000]

proc read_mem {address} {
    set address [string range $address 2 [expr {[string length $address]-1}]]
    create_hw_axi_txn -quiet -force rd_tx [get_hw_axis hw_axi_1] -address $address -len 1 -size 32 -type read
    run_hw_axi -quiet rd_tx
    return 0x[get_property DATA [get_hw_axi_txn rd_tx]]
    delete_hw_axi_txn [get_hw_axi_txns *]
}

puts "Waiting for RISC V Median Filter (16 samples, self-verified) Test to complete..."

set x "NOREAD"
while {$x != "0xda550002" && $x != "0xfa110002"} {
  set x [read_mem [format 0x%x $STATUS]]
}

# Get the lower 32 bits of the cycle count
set cycles [read_mem [format 0x%x $TIME_ADDR]]

# Get the upper 32 bits of the cycle count
set cyclesh [read_mem [format 0x%x [expr {$TIME_ADDR + 4}]]]

# Find the total number of cycles
set cycles [expr $cycles + ($cyclesh << 32)]

# Find the time in seconds, based on the clock speed
set time [expr $cycles * $CLOCK_SPEED * $MS]

if {$x == "0xda550002"} {
  puts "Passed test!"
  puts "Number of processor cycles was $cycles."
  puts "Total time of execution was $time ms."
} else {
  puts "Failed test! An error state was entered."
}