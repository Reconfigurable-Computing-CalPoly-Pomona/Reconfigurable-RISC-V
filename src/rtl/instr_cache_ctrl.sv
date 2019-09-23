`timescale 1ns / 1ps
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
import axi_defines::*;

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

  // The output address to the least recently used RAM
  output logic [$clog2(CACHE_DEPTH) - 1:0] o_lru_addr,

  // The output to the fetch stage
  output logic o_instr_valid,

  // Indicates that the controller is ready for the next request
  output logic o_req_ready,

  // The output instruction to the fetch stage
  output logic [INST_SIZE - 1:0] o_instruction,

  // The Pseudo-LRU bits indicating a pointer to a least recently used way
  input logic [BLK_PER_SET - 1:0] i_rlru,

  // The new Pseudo-LRU updated value after a hit or miss
  output logic [BLK_PER_SET - 1:0] o_wlru,

  // The LRU cache write enable
  output logic o_we_lru
);

  // AXI master
  // States
  // FLUSH - Sets the valid bits to zero after reset
  // IDLE - Waits for an incoming request from the instruction fetch
  // CHK_TAG - Compares the tag from each way in parallel to move to the appropriate state
  // Memory access states (miss only):
  // MISS_AR - Waits for the ARready signal from the AXI slave after a miss
  // MISS_R - Reads an entire block from memory and writes to a particular way cache
  enum logic [2:0] {
    FLUSH = 0,
    IDLE = 1,
    CHK_TAG = 2,
    MISS_AR = 3,
    MISS_R = 4
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

  // The selected line
  inst_blk_t line_sel;

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
          if (address == '1) address <= i_addr[$clog2(CACHE_DEPTH) + WORD_BITS + OFFSET - 1:WORD_BITS + OFFSET];
        end
        IDLE: begin
          // Wait for request
          address <= i_addr[$clog2(CACHE_DEPTH) + WORD_BITS + OFFSET - 1:WORD_BITS + OFFSET];
          tag <= i_addr[TAG_BITS + INDEX_BITS + WORD_BITS + OFFSET - 1:INDEX_BITS + WORD_BITS + OFFSET];
          index <= i_addr[INDEX_BITS + WORD_BITS + OFFSET - 1:WORD_BITS + OFFSET];
          word <= i_addr[WORD_BITS + OFFSET - 1:OFFSET];
        end
        CHK_TAG: begin
          // Reset the block index to zero in order to perform a read if a miss occurs
          if (miss) begin
            address[WORD_BITS + OFFSET - 1:0] <= 0;
          end else begin
            address <= i_addr[$clog2(CACHE_DEPTH) + WORD_BITS + OFFSET - 1:WORD_BITS + OFFSET];
            tag <= i_addr[TAG_BITS + INDEX_BITS + WORD_BITS + OFFSET - 1:INDEX_BITS + WORD_BITS + OFFSET];
            index <= i_addr[INDEX_BITS + WORD_BITS + OFFSET - 1:WORD_BITS + OFFSET];
            word <= i_addr[WORD_BITS + OFFSET - 1:OFFSET];
          end
        end
        MISS_AR: ;
        MISS_R: begin
          // As the lines come in, increment the index to rewrite the cache
          // On the final line, send the old cache address to re-check the tag
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
        // If a hit has occured and a request is available, stay in the check tag state
        // Otherwise, go back to idle.
        if (~miss && ~i_req) next_state = IDLE;
        else if (~miss) next_state = CHK_TAG;
        else if (axi.arready) next_state = MISS_R;
        else next_state = MISS_AR;
      MISS_AR: if (axi.arready) next_state = MISS_R;
      MISS_R:
        // Accept reads until finished
        if (axi.r.valid && axi.r.last) next_state = CHK_TAG;
      default:;
    endcase
  
  end : proc_state

  // Combinatoral outputs

  // If no hit occurs on any of the ways, set the miss bit
  assign miss = ~|hit;

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
    o_req_ready = 0;
    o_instruction = 'x;
    cache_wline = 'x;
    // Default AXI
    axi.aw = 'x;
    axi.w = 'x;
    // Set the appropriate index
    o_addr = i_addr[$clog2(CACHE_DEPTH) + WORD_BITS + OFFSET - 1:WORD_BITS + OFFSET];
    o_lru_addr = index;

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
        cache_wline.valid = 0;
        // Reset the LRU bits
        o_wlru = 0;
        o_addr = address;
        o_lru_addr = address;
      end
      IDLE: begin
        // Enable each of the way caches
        o_req_ready = 1;
      end
      CHK_TAG: begin
        // Check the TAG bits in parallel for each way
        // Verify the Tag and valid bit
        for(int r=0; r < BLK_PER_SET; r++) begin
          // Compare the valid bit and the cache tag, compare to address tag
          if (cache_rline[r].valid && cache_rline[r].tag == tag) begin
            hit[r] = 1;
            line_sel = cache_rline[r];
            o_instruction = line_sel.data[word];
            o_instr_valid = 1;
            // Reset the PLRU table if it is full
            if (i_rlru == '1) o_wlru = 0;
            // Mark the bit as recently used
            o_wlru[r] = 1;
            o_we_lru = 1;
          end
        end
        o_req_ready = o_instr_valid;
        axi.ar.valid = ~|hit;
      end
      MISS_AR: begin
        // Wait for AR to be ready
        axi.ar.valid = 1;
      end

      MISS_R: begin
        // The write enable to the way that has been selected based on LRU
        o_we[lru] = 1;

        cache_wline.valid = 1;
        // Default the cache line to be equal to its current value
        cache_wline.data = cache_rline[lru].data;
        cache_wline.data[address[WORD_BITS - 1:0]] = axi.r.data;
        cache_wline.tag = tag;
        o_addr = index;
        // Accept reads in this state
        axi.rready = 1;
      end
      default:;
    endcase
  
  end : proc_comb

  // Determines the Pseudo-LRU way for replacement
  always_comb begin : proc_lru
    // Default the least recently used to zero in case the recently used table is all 1s
    lru = BLK_PER_SET - 1;
    for(int unsigned w=0; w < BLK_PER_SET; w++) if (~i_rlru[w]) lru = w;
  end : proc_lru

endmodule
