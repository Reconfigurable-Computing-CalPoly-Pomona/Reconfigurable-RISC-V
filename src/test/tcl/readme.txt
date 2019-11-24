1) Load the latest version of the processor.
2) Run write_memory.tcl pointed to the desired program to load into memory.
3) Reset the processor at base program counter
4) Run the verify compliance tcl


Loading TCL via vivado:

Use vivado command line with the following command:
source -notrace /your/path/to/script.tcl