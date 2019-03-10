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
import axi_defines::*;

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

  // When high, indicates the request will start processing if i_req is high
  output logic o_req_ready,

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

  // Index for the block # that the address is referring to
  localparam INDEX_BITS = $clog2(WAY_SIZE) - WORD_BITS - OFFSET;

  // The bits dedicated to storing the tag
  // ADDR_SIZE minus the other bits represents the tag, the MSbits of the address
  localparam TAG_BITS = ADDR_SIZE - INDEX_BITS - WORD_BITS - OFFSET;

  // The number of elements in the cache
  localparam CACHE_DEPTH = WAY_SIZE / (WORDS_PER_LINE * INST_SIZE / 8);

  // The width used for the block RAM including instructions, tags, and valids
  localparam CACHE_WIDTH = 1 + TAG_BITS + INST_SIZE * WORDS_PER_LINE;

  typedef struct packed {
    logic valid;
    logic [TAG_BITS - 1:0] tag;
    logic [WORDS_PER_LINE - 1:0] [INST_SIZE - 1:0] data;
  } inst_blk_t;

  /////////////////////////////////////////////////////////////////
  // Signal list
  /////////////////////////////////////////////////////////////////

  // The write enable for each way in case a miss occurs
  logic [BLK_PER_SET - 1:0] we;

  // The address to look up into each way for a particular TAG
  // As associativity increases, this address will fanout to more WAYs
  logic [$clog2(CACHE_DEPTH) - 1:0] cache_addr;

  // The address to read and store least recently used bits
  logic [$clog2(CACHE_DEPTH) - 1:0] lru_addr;

  // The data that may be written to one way at a time
  inst_blk_t wline;

  // The instruction(s), valid, and tag returned from the way
  inst_blk_t [BLK_PER_SET - 1:0] rline;

  // The Pseudo-LRU bits, one hot encoded indicates usage
  logic [BLK_PER_SET - 1:0] rlru;

  // The new Pseudo-LRU, one hot encoded indicates usage
  logic [BLK_PER_SET - 1:0] wlru;

  // The LRU cache write enable
  logic we_lru;


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
        .i_addr_a(cache_addr),
        .i_data_a(wline),
        .i_we_a(we[g]),
        .o_data_a(rline[g]),
        .i_addr_b('0),
        .i_data_b('0),
        .i_we_b('0),
        .o_data_b()
      );
    end : way_gen
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
    .o_req_ready(o_req_ready),
    
    // Read from caches
    .i_line(rline),

    // Write to caches
    .o_we(we),
    .o_line(wline),
    .o_addr(cache_addr),
    .o_lru_addr(lru_addr),

    // Return instruction to fetch
    .o_instr_valid(o_instr_valid),
    .o_instruction(o_instruction),

    // LRU block RAM I/O
    .i_rlru(rlru),
    .o_we_lru(we_lru),
    .o_wlru(wlru)
  );


  // Generate a RAM to store only the Pseudo-LRU bits
  generate begin : plru_ram
    if (BLK_PER_SET > 1) begin
      ram #(
        // Each element of the cache contains a word
        .DEPTH(CACHE_DEPTH),
        // Valid + Tag + Data payload
        .DATA_WIDTH(BLK_PER_SET)
      ) plru_cache (
        .i_clk(i_aclk),
        .i_addr_a(cache_addr),
        .i_data_a('0),
        .i_we_a('0),
        .o_data_a(rlru),
        .i_addr_b(lru_addr),
        .i_data_b(wlru),
        .i_we_b(we_lru),
        .o_data_b()
      );
    end
  end : plru_ram
  endgenerate

endmodule
