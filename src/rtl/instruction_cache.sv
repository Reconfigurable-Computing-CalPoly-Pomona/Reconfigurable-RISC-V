//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 02/10/2019 03:19:49 PM
// Design Name: 
// Module Name: instruction_cache
// Project Name: multicore_fpga
// Target Devices: Spartan 7
// Tool Versions: 
// Description: 
// Top level for the instruction cache blocks. Contains the instruction cache
// controller, the instruction caches for each way, and the LRU table
// 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;

module instruction_cache #(
  // The size of the accessible address space
  parameter ADDR_SIZE = 32,
  // The size of the cache desired in bytes
  parameter CACHE_SIZE = 2**14,
  // Associativity factor (1- Direct Mapped, N - N way set associative)
  parameter BLK_PER_SET = 2
)
(
  // System clock and reset
  input logic i_aclk,
  input logic i_areset_n,

  // AXI Master
  axi_inf.master axi,

  // Request for instruction by instruction fetch stage
  input logic i_req,
  // Address for the instruction from the PC
  input logic [ADDR_SIZE - 1:0] i_addr,

  // Indicates that o_instruction is valid
  output logic o_instr_valid,

  // The instruction to return to the instruction fetch stage
  output logic [INST_SIZE - 1:0] o_instruction

);

  /////////////////////////////////////////////////////////////////
  // Local parameters for instruction cache
  /////////////////////////////////////////////////////////////////

  // The number of blocks in the cache, given constant block size 
  localparam NUM_BLOCKS = CACHE_SIZE / LINE_SIZE;

  // The block RAM size to represent the particular way of each set
  localparam WAY_SIZE = CACHE_SIZE / BLK_PER_SET;

  // The bits devoted to se
  // 0 - Direct
  // 1 - 2 way set associative
  // ...
  //localparam WAY_SEL= $clog2(BLK_PER_SET);

  // Index for the block # that the address is referring to
  localparam INDEX_BITS = $clog2(WAY_SIZE) - WORD_BITS - OFFSET;

  // The bits dedicated to storing the tag
  // ADDR_SIZE minus the other bits represents the tag, the MSbits of the address
  localparam TAG_BITS = ADDR_SIZE - INDEX_BITS - WORD_BITS - OFFSET;

  // The number of elements in the cache
  localparam CACHE_DEPTH = WAY_SIZE / (WORDS_PER_LINE * INST_SIZE / 8);

  // The width used for the block RAM including instructions, tags, and valids
  localparam CACHE_WIDTH = 1 + TAG_BITS + INST_SIZE * WORDS_PER_LINE;

  /////////////////////////////////////////////////////////////////
  // Signal list
  /////////////////////////////////////////////////////////////////

  // The write enable for each way in case a miss occurs
  logic [BLK_PER_SET - 1:0] we;

  // The address to look up into each way for a particular TAG
  // As associativity increases, this address will fanout to more WAYs
  logic [$clog2(CACHE_DEPTH) - 1:0] cache_addr;

  // The data that may be written to one way at a time
  logic [CACHE_WIDTH - 1:0] wline;

  // The instruction(s), valid, and tag returned from the way
  logic [BLK_PER_SET - 1:0][CACHE_WIDTH - 1:0] rline;


  // Generate each of the ways
  generate
    for (genvar g = 0; g < BLK_PER_SET; g++) begin : way_gen
      ram #(
        // Each element of the cache contains a word
        .DEPTH(CACHE_DEPTH),
        // Valid + Tag + Data payload
        .DATA_WIDTH(CACHE_WIDTH)
      ) instr_cache_set (
        .i_clk(i_aclk),
        .i_addr(cache_addr),
        .i_data(wline),
        .i_we(we[g]),
        .o_data(rline[g])
      );
    end
  endgenerate

  // Instantiates a cache controlller
  // Which handles each of the cache ways and compares the TAG bits
  // Carries out memory reads in the case of misses, or data outputs in cases of hits
  instr_cache_ctrl #(
    .ADDR_SIZE(ADDR_SIZE),
    .BLK_PER_SET(BLK_PER_SET),
    .TAG_BITS(TAG_BITS),
    .INDEX_BITS(INDEX_BITS),
    .CACHE_WIDTH(CACHE_WIDTH),
    .CACHE_DEPTH(CACHE_DEPTH)
  ) cache_controller(
  
    .i_clk(i_aclk),
    .i_areset_n(i_areset_n),
    .axi(axi),

    // Request from fetch
    .i_addr(i_addr),
    .i_req(i_req),

    // Read from caches
    .i_line(rline),

    // Write to caches
    .o_we(we),
    .o_line(wline),
    .o_addr(cache_addr),

    // Return instruction to fetch
    .o_instr_valid(o_instr_valid),
    .o_instruction(o_instruction)
  );


  // TODO : Add least recently used RAM


endmodule
