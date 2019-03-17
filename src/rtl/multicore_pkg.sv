`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2019 03:48:47 PM
// Design Name: 
// Module Name: multicore_pkg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Keeps the type and structures used in the multicore processor
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


package multicore_pkg;

  // The size of the instructions
  localparam INST_SIZE = 32;

  // The size of the data in the processor
  localparam DATA_SIZE = 32;

  // The number of registers in the register file
  localparam NUM_REGS = 32;

  // The size of the cache sets in # of lines
  localparam WORDS_PER_LINE = 8;

  // The size in bytes of each line
  localparam LINE_SIZE = WORDS_PER_LINE * INST_SIZE / 8;

  // The byte offset per each word, given minimum size
  localparam OFFSET = $clog2(INST_SIZE / 8);

  // The bits required for each word within each line
  localparam WORD_BITS = $clog2(LINE_SIZE) - OFFSET;

  localparam logic [6:0] NOOP_CODE = 'b0010011; 

  // Defines the opcode types for RISC V
  typedef enum logic [6:0] {
    LOADS      = 'b0000011,
    STORES     = 'b0100011,

    // Arithmetic, logical, and compare immediate/register
    ALC_I      = 'b0010011,
    ALC_R      = 'b0110011,

    BRANCHES   = 'b1100011,
    LUI        = 'b0110111,
    AUIPC      = 'b0010111,
    JAL        = 'b1101111,
    JALR       = 'b1100111,

    SYNCH      = 'b0001111,
    SYSTEM     = 'b1110011
  } t_opcode;

endpackage : multicore_pkg
