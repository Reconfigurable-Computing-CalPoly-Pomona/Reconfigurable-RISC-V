//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 02/17/2019 02:42:52 PM
// Design Name: 
// Module Name: instr_cache_ctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:
// Controller which handles the instruction caches made using RAM. Calculates
// Miss/Hit. In the case of hit, returns the payload of the cache. In the case
// of miss, uses AXI4 to carry out a memory read in order to repopulate the cache
//
// Uses least recently used in order to determine which cache WAY to overwrite
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;

module instr_cache_ctrl #(
  parameter ADDR_SIZE = 32,
  parameter BLK_PER_SET = 2,
  parameter TAG_BITS = 0,
  parameter INDEX_BITS = 0,
  parameter CACHE_WIDTH = 0,
  parameter CACHE_DEPTH = 0
  )(
  // System Clock and Reset
  input logic i_clk,
  input logic i_areset_n,

  // AXI interface for read memory access
  axi_inf.master axi,

  // Address from fetch stage
  input logic [ADDR_SIZE - 1:0] i_addr,

  // Request from fetch stage
  input logic i_req,

  // Valid + Tag + Payload from cache
  input [BLK_PER_SET - 1:0][CACHE_WIDTH - 1:0] i_line,

  // Write to each individual way
  output logic [BLK_PER_SET - 1:0] o_we,

  // The output valid + tag + payload for cache
  output [CACHE_WIDTH - 1:0] o_line,

  // The output address to each of the ways
  output logic [$clog2(CACHE_DEPTH) - 1:0] o_addr,

  // The output to the fetch stage
  output logic o_instr_valid,

  // The output instruction to the fetch stage
  output logic [INST_SIZE - 1:0] o_instruction,

  // The Pseudo-LRU bits indicating a pointer to a least recently used way
  input logic [BLK_PER_SET - 1:0] i_rlru,

  // The new Pseudo-LRU updated value after a hit or miss
  output logic [BLK_PER_SET - 1:0] o_wlru,

  // The LRU cache write enable
  output logic [BLK_PER_SET - 1:0] o_we_lru
);

  // AXI master
  // States
  // FLUSH - Sets the valid bits to zero after reset
  // IDLE - Waits for an incoming request from the instruction fetch
  // CHK_TAG - Compares the tag from each way in parallel to move to the appropriate state
  // Memory access states (miss only):
  // MISS_R - Reads an entire block from memory and writes to a particular way cache
  enum logic [1:0] {
    FLUSH = 0,
    IDLE = 1,
    CHK_TAG = 2,
    MISS_R = 3
  } curr_state, next_state;

  typedef struct packed {
    logic valid;
    logic [TAG_BITS - 1:0] tag;
    logic [WORDS_PER_LINE - 1:0] [INST_SIZE - 1:0] data;
  } inst_blk_t;

  // Most signficant bits of address, which are compared for a hit or miss
  logic [TAG_BITS - 1:0] tag;

  // The index which determines which index of the cache RAM will contain the value
  logic [INDEX_BITS - 1:0] index;

  // The index that determines the particular word within the line that is sent as the instruction
  logic [WORD_BITS - 1:0] word;

  // Determines the least recently used way
  logic [$clog2(BLK_PER_SET) - 1:0] lru;

  // The each of the individual lines from the different ways
  inst_blk_t [BLK_PER_SET - 1:0] cache_rline;

  // The lines to write to the cache
  inst_blk_t cache_wline;

  // The address flip flop to determine where to write to
  logic [$clog2(CACHE_DEPTH) - 1:0] address;

  // A vector representing the output of the tag comparison. One hot
  logic [BLK_PER_SET - 1:0] hit;

  // When high, none of the way caches have received a tag hit
  logic miss;

  // The index bits, which is used  
  always_ff @(posedge i_clk or negedge i_areset_n) begin : proc_seq_ff
    if(~i_areset_n) begin
      curr_state <= FLUSH;
      address <= 0;
    end else begin
      curr_state <= next_state;
      unique case(curr_state)
        FLUSH: begin
          // During flush, the valid bits are cleared one index every cycle
          address <= address + 1;
        end
        IDLE: begin
          // Wait for request
        end
        CHK_TAG: begin
          // Reset the block index to zero
          address <= 0;
        end
        MISS_R: begin
          // As the lines come in, increment the index
          address <= address + axi.r.valid;
        end
        default:;
      endcase
    end
  end : proc_seq_ff

  // Next state logic
  always_comb begin : proc_state
    // By default, the next state is equal to the current state
    next_state = curr_state;

    unique case(curr_state)
      FLUSH:
        // If at the last address, exit the flush state
        if (address == '1) next_state = IDLE;
      IDLE:
        // Wait for a request 
        if (i_req) next_state = CHK_TAG;
      CHK_TAG:
        // Determine if a hit has occured by reading the BRAM
        if (~miss) next_state = IDLE;
        else if (axi.arready) next_state = MISS_R;
      MISS_R:
        // Accept reads until finished
        if (axi.r.valid && axi.r.last) next_state = IDLE;
      default:;
    endcase
  
  end : proc_state

  // Combinatoral outputs

  // If no hit occurs on any of the ways, set the miss bit
  assign miss = ~|hit;
  //assign valid = i_data[TAG_BITS + INDEX_BITS];
  assign tag = i_addr[TAG_BITS + INDEX_BITS + WORD_BITS + OFFSET - 1:INDEX_BITS + WORD_BITS + OFFSET];
  assign index = i_addr[INDEX_BITS + WORD_BITS + OFFSET - 1:WORD_BITS + OFFSET];
  assign word = i_addr[WORD_BITS + OFFSET - 1:OFFSET];

  // Assign the line data structure to be equal to the input data
  assign cache_rline = i_line;
  assign o_line = cache_wline;

  always_comb begin : proc_comb
    // By default, don't write to the cache
    o_we = 0;
    hit = 0;
    o_we_lru = 0;
    o_wlru = i_rlru;
    o_instr_valid = 0;
    o_instruction = 'x;
    cache_wline = 'x;

    // Default AXI
    axi.aw = 'x;
    axi.w = 'x;
    // Set the appropriate index
    o_addr = i_addr[$clog2(CACHE_DEPTH) + WORD_BITS + OFFSET - 1:WORD_BITS + OFFSET];

    // Control signals for AXI lines is held zero by default
    {axi.ar.valid, axi.rready, axi.aw.valid, axi.w.valid, axi.bready} = 0;

    // The AXI address always takes the tag, with the LSB set to zero
    // This is the first address in the block to read from memory
    axi.ar.addr = 0;
    axi.ar.addr[$size(axi.ar.addr) - 1:WORD_BITS + OFFSET] = {tag, index};
    // The length of the burst will be equal to the size of the block
    axi.ar.len = WORDS_PER_LINE - 1;
    // Send 32 bit data at incrementing addresses
    axi.ar.size = 2;
    axi.ar.burst = INCR;

    unique case(curr_state)
      FLUSH: begin
        // Set all of the way caches to be not valid
        o_we = '1;
        o_we_lru = 1;
        o_addr = address;
        cache_wline.valid = 0;
        // Reset the LRU bits
        o_wlru = 0;
      end
      IDLE: begin
        // Enable each of the way caches
      end
      CHK_TAG: begin
        // Check the TAG bits in parallel for each way
        // Verify the Tag and valid bit
        for(int unsigned w=0; w < BLK_PER_SET; w++) begin
          // Compare the valid bit and the cache tag, compare to address tag
          if (cache_rline[w].valid && cache_rline[w].tag == tag) begin
            hit[w] = 1;
            o_instruction = cache_rline[w].data[word];
            o_instr_valid = 1;
            // Reset the PLRU table if it is full
            if (i_rlru == '1) o_wlru = 0;
            // Mark the bit as recently used
            o_wlru[w] = 1;
            o_we_lru = 1;
          end
        end
        axi.ar.valid = ~|hit;
      end

      MISS_R: begin
        // The write enable to the way that has been selected based on LRU
        o_we[lru] = 1;

        cache_wline.valid = 1;
        // Default the cache line to be equal to its current value
        cache_wline.data = cache_rline[lru].data;
        cache_wline.data[address[WORD_BITS - 1:0]] = axi.r.data;
        cache_wline.tag = tag;

        axi.rready = 1;
        // If on the last transaction, mark the least recently used bit as recently used
        if (axi.r.valid && axi.r.last) begin
          // Reset the PLRU table if it is full
          if (i_rlru == '1) o_wlru = 0;
          o_wlru[lru] = 1;
          o_we_lru = 1;
        end
      end
      default:;
    endcase
  
  end : proc_comb

  // Determines the Pseudo-LRU way for replacement
  always_comb begin : proc_lru
    // Default the least recently used to zero in case the recently used table is all 1s
    lru = BLK_PER_SET - 1;
    for(int unsigned w=0; w < BLK_PER_SET; w++) if (~i_rlru[w]) lru = w;
  end

/* Tree LRU
  generate


    if (BLK_PER_SET == 1) begin
      lru = 0;
      invalid = 0;
    end else if (BLK_PER_SET == 2) begin
      assign invalid = {cache_rline[1].valid, cache_rline[0].valid};
      if (~&invalid) begin
        case (invalid)
          00: lru = 0;
          01: lru = 1;
          10: lru = 0;
        endcase
      end else begin
        lru = i_lru[0];
      end
    end else if (BLK_PER_SET == 4) begin
      always_comb begin : proc_lru
        for(int unsigned w=0; w < BLK_PER_SET; w++) begin
          if (cache_rline[w].valid == 0) begin
            invalid = 1;
            lru = w;
          end
        end
        if (!invalid) begin
          lru = i_lru[2] ? (i_lru[0] ? 3:2) : (i_lru[1] ? 1:0);
        end
        o_wlru = ref_line
          unique case(ref_line)
            00: o_wlru = {2'b11, lru[0]};
            01: o_wlru = {2'b10, lru[0]};
            10: o_wlru = {1'b0, lru[1], 1'b1};
            default: o_wlru = {1'b0, lru[1], 1'b0};
          endcase
      end
      //end else begin
      //  case (i_lru)
      //    000: lru = 0;
      //    001: lru = 0;
      //    010: lru = 1;
      //    011: lru = 1;
      //    100: lru = 2;
      //    101: lru = 3;
      //    110: lru = 2;
      //    111: lru = 3;
      //  endcase
      //end
    end else if (BLK_PER_SET == 8) begin
      assign invalid = {cache_rline[7].valid, cache_rline[6].valid, cache_rline[5].valid,
                        cache_rline[4].valid, cache_rline[3].valid, cache_rline[2].valid,
                        cache_rline[1].valid, cache_rline[0].valid};
    end */

endmodule
