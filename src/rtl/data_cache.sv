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

  // Request for data store/load by memory access stage
  input logic i_req,
  // Address for the data from the PC
  input logic [ADDR_SIZE - 1:0] i_addr,

  // Indicates that the data has been stored or loaded
  output logic o_dvalid,

  // The data loaded, to be returned to the memory access stage
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

  // The width used for the block RAM including data, tags, valid, and dirty bit
  localparam CACHE_WIDTH = 1 + 1 + TAG_BITS + DATA_SIZE * WORDS_PER_LINE;

  typedef struct packed {
    logic valid;
    logic [TAG_BITS - 1:0] tag;
    logic [WORDS_PER_LINE - 1:0] [DATA_SIZE - 1:0] data;
  } data_blk_t;

  /////////////////////////////////////////////////////////////////
  // Signal list
  /////////////////////////////////////////////////////////////////

  // The write enable for each way in case a miss occurs
  logic [BLK_PER_SET - 1:0] we;

  // The address to look up into each way for a particular TAG
  // As associativity increases, this address will fanout to more WAYs
  logic [$clog2(CACHE_DEPTH) - 1:0] cache_addr;

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

    // Request from memory access
    .i_addr(i_addr),
    .i_req(i_req),

    // Read from caches
    .i_line(rline),

    // Write to caches
    .o_we(we),
    .o_line(wline),
    .o_addr(cache_addr),

    // Return data to memory access
    .o_dvalid(o_dvalid),
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
        .i_clk(i_aclk),
        .i_addr(cache_addr),
        .i_data(wlru),
        .i_we(we_lru),
        .o_data(rlru)
      );
    end
  end
  endgenerate

endmodule

