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
  localparam LINES_PER_BLK = 256;

  // The size (bits) of each line per set
  localparam LINE_SIZE = 32;

  // The byte offset, given minimum size
  localparam OFFSET = $clog2(LINE_SIZE / 8);

  // The size of the set in bytes
  localparam BLOCK_SIZE = LINES_PER_BLK * LINE_SIZE / 8;

endpackage : multicore_pkg
