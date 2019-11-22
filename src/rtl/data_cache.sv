`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler 
// 
// Create Date: 03/03/2019 03:53:28 PM
// Design Name: 
// Module Name: data_cache
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Top level for the data cache blocks. Contains the data cache
// controller, the data caches for each way, and the LRU table
// Dependencies:
// ram
// data_cache_ctrl
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;
import axi_defines::*;

module data_cache #(
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

  // Request to access data cache by memory access stage
  input logic i_req,

  // Indicates the request is a write (1) or read
  input logic i_req_write,

  // When high, indicates the request will start processing if i_req is high
  output logic o_req_ready,

  // Address for the data store or load
  input logic [ADDR_SIZE - 1:0] i_addr,

  // The data to store in the cache during a write
  input logic [DATA_SIZE - 1:0] i_store_data,

  // The size of the data to write
  input t_sop i_sop,

  // The size and sign of the data to read
  input t_ldop i_ldop,

  // Indicates that o_data is valid
  output logic o_data_valid,

  // The data to return to the memory access stage
  output logic [DATA_SIZE - 1:0] o_data

);

  /////////////////////////////////////////////////////////////////
  // Local parameters for data cache
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
  localparam CACHE_DEPTH = WAY_SIZE / (WORDS_PER_LINE * DATA_SIZE / 8);

  // The width used for the block RAM including datas, tags, valid, and dirty
  localparam CACHE_WIDTH = 1 + 1 + TAG_BITS + DATA_SIZE * WORDS_PER_LINE;

  typedef struct packed {
  	logic dirty;
    logic valid;
    logic [TAG_BITS - 1:0] tag;
    logic [WORDS_PER_LINE - 1:0] [DATA_SIZE - 1:0] data;
  } data_blk_t;

  /////////////////////////////////////////////////////////////////
  // Signal list
  /////////////////////////////////////////////////////////////////

  // The write enable for each way in case a miss occurs
  logic [BLK_PER_SET - 1:0] cache_we;

  // The enable for each way
  logic [BLK_PER_SET - 1:0] cache_en;

  // The address to look up into each way for a particular TAG
  // As associativity increases, this address will fanout to more WAYs
  logic [$clog2(CACHE_DEPTH) - 1:0] cache_raddr;

  // The address to look up into each way for a particular TAG
  // As associativity increases, this address will fanout to more WAYs
  logic [$clog2(CACHE_DEPTH) - 1:0] cache_waddr;

  // The address to read and store least recently used bits
  logic [$clog2(CACHE_DEPTH) - 1:0] lru_addr;

  // The data that may be written to one way at a time
  data_blk_t wline;

  // The data(s), valid, and tag returned from the way
  data_blk_t [BLK_PER_SET - 1:0] rline;

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
      ) data_cache_set (
      /*
        .i_clk(i_aclk),
        .i_addr_a(cache_raddr),
        .i_data_a('0),
        .i_we_a('0),
        .o_data_a(rline[g]),
        .i_addr_b(cache_waddr),
        .i_data_b(wline),
        .i_we_b(we[g]),
        .o_data_b()
      */
        .i_clk(i_aclk),
        .i_en(cache_en[g]),
        .i_we(cache_we[g]),
        .i_addr(cache_raddr),
        .i_data(wline),
        .o_data(rline[g])
      );
    end
  endgenerate

  // Instantiates a cache controlller
  // Which handles each of the cache ways and compares the TAG bits
  // Carries out memory reads in the case of misses, or data outputs in cases of hits
  data_cache_ctrl #(
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

    // Request for memory access
    .i_addr(i_addr),
    .i_store_data(i_store_data),
    .i_sop(i_sop),
    .i_ldop(i_ldop),
    .i_req(i_req),
    .i_req_write(i_req_write),
    .o_req_ready(o_req_ready),
    
    // Read from caches
    .i_line(rline),
    .o_raddr(cache_raddr),

    // Write to caches
    .o_we_cache(cache_we),
    .o_re_cache(cache_en),
    .o_line(wline),
    .o_waddr(cache_waddr),
    .o_lru_addr(lru_addr),

    // The data is valid in the cache, and if this was read request, the data is retrieved
    .o_data_valid(o_data_valid),
    .o_data(o_data),

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
/*
        .i_clk(i_aclk),
        .i_addr_a(cache_raddr),
        .i_data_a('0),
        .i_we_a('0),
        .o_data_a(rlru),
        .i_addr_b(lru_addr),
        .i_data_b(wlru),
        .i_we_b(we_lru),
        .o_data_b()
*/
        .i_clk(i_aclk),
        .i_en(1),
        .i_we(we_lru),
        .i_addr(cache_raddr),
        .i_data(wlru),
        .o_data(rlru)
      );
    end
  end
  endgenerate

endmodule

