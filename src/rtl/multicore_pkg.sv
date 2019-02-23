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

  // The size of the cache sets in # of lines
  localparam WORDS_PER_LINE = 8;

  // The size in bytes of each line
  localparam LINE_SIZE = WORDS_PER_LINE * INST_SIZE / 8;

  // The byte offset per each word, given minimum size
  localparam OFFSET = $clog2(INST_SIZE / 8);

  // The bits required for each word within each line
  localparam WORD_BITS = $clog2(LINE_SIZE) - OFFSET;

endpackage : multicore_pkg
