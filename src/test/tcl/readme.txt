1) Load the latest version of the processor.
2) Run write_*.tcl pointed to the desired program to load into memory.
3) Reset the processor at base program counter
4) Run the verify_*.tcl corresponding to the test


Loading TCL via vivado:

Use vivado command line with the following command:
source -notrace /your/path/to/script.tcl