`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 03/03/2019 04:12:00 PM
// Design Name: 
// Module Name: data_cache_ctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:
// The controller for the data cache. Checks for hits within cache, reads memory
// over AXI during misses, and writes back any dirty blocks before replacement
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

module data_cache_ctrl #(
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

  // Address from memory access stage
  input logic [ADDR_SIZE - 1:0] i_addr,

  // Data to be written to the cache in the case of a write
  input logic [DATA_SIZE - 1:0] i_store_data,

  // The size of the data to write
  input t_sop i_sop,

  // The size and sign of the data to read
  input t_ldop i_ldop,

  // Request from memory access stage
  input logic i_req,

  // Determines if the request was a read or write request
  input logic i_req_write,

  // Valid + Tag + Payload from cache
  input [BLK_PER_SET - 1:0][CACHE_WIDTH - 1:0] i_line,

  // Write to each individual way
  output logic [BLK_PER_SET - 1:0] o_we_cache,

  // Read from each individual way
  output logic [BLK_PER_SET - 1:0] o_re_cache,

  // The output valid + tag + payload for cache
  output [CACHE_WIDTH - 1:0] o_line,

  // The output address to read from the ways
  output logic [$clog2(CACHE_DEPTH) - 1:0] o_raddr,

  // The output address to write to each of the ways
  output logic [$clog2(CACHE_DEPTH) - 1:0] o_waddr,

  // The output address to the least recently used RAM
  output logic [$clog2(CACHE_DEPTH) - 1:0] o_lru_addr,

  // The output to the memory access stage
  output logic o_data_valid,

  // Indicates that the controller is ready for the next request
  output logic o_req_ready,

  // The output data to the memory access stage
  output logic [INST_SIZE - 1:0] o_data,

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
  // WB_AW - After a miss with a dirty block replacement, the write is sent to the AXI slave
  // WB_W - Carry out the memory write back before replacing the block
  // MISS_AR - Waits for the ARready to be received from a slave
  // MISS_R - Reads an entire block from memory and writes to a particular way cache
  enum logic [2:0] {
    FLUSH = 0,
    IDLE = 1,
    CHK_TAG = 2,
    CHK_DIRTY = 3,
    WB_W = 4,
    WB_B = 5,
    MISS_AR = 6,
    MISS_R = 7
  } curr_state, next_state;

  typedef struct packed {
    logic dirty;
    logic valid;
    logic [TAG_BITS - 1:0] tag;
    logic [WORDS_PER_LINE - 1:0] [DATA_SIZE - 1:0] data;
  } data_blk_t;

  // Most signficant bits of address, which are compared for a hit or miss
  logic [TAG_BITS - 1:0] tag;

  // The index which determines which index of the cache RAM will contain the value
  logic [INDEX_BITS - 1:0] index;

  // Most signficant bits of address within the tag. Used for writing to memory
  logic [TAG_BITS - 1:0] cached_tag;

  // The index that determines the particular word within the line that is sent as the instruction
  logic [WORD_BITS - 1:0] word;

  // The byte offset
  logic [OFFSET - 1:0] offset;

  // Determines the least recently used way
  logic [$clog2(BLK_PER_SET) - 1:0] lru;

  // The each of the individual lines from the different ways
  data_blk_t [BLK_PER_SET - 1:0] cache_rline;

  // The selected line
  data_blk_t line_sel;

  // The lines to write to the cache
  data_blk_t cache_wline;

  // The size (byte, half, word) to store in the cache
  t_sop store_size;

  // The size and sign to load from the cache
  t_ldop load_operation;

  // The address flip flop to determine where to write to
  logic [$clog2(CACHE_DEPTH) - 1:0] address;

  // A vector representing the output of the tag comparison. One hot
  logic [BLK_PER_SET - 1:0] hit;

  // When high, none of the way caches have received a tag hit
  logic miss;

  // Registers if the transaction is a store or not
  logic write;

  // The registered data during the request, which will be written to the cache during a store
  logic [DATA_SIZE - 1:0] store_data;

  // The data accessed from the cache
  logic [INST_SIZE - 1:0] data;

  // Indicates the combinatoral data is valid
  logic data_valid;

  // The index bits, which is used  
  always_ff @(posedge i_clk or negedge i_areset_n) begin : proc_seq_ff
    if(~i_areset_n) begin
      curr_state <= FLUSH;
      address <= 0;
      o_data_valid <= 0;
      o_data <= 0;
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
          offset <= i_addr[OFFSET - 1:0];
          store_data <= i_store_data;
          store_size <= i_sop;
          load_operation <= i_ldop;
          write <= i_req_write;
          if (i_req) o_data_valid <= 0;
        end
        CHK_TAG: begin
          // Reset the block index to zero in order to perform a read if a miss occurs
          o_data <= data;

          // Register the value of the tag to write to memory in case it is dirty
          cached_tag <= cache_rline[lru].tag;

          if (miss) begin
            address <= 0;
          end else begin
            o_data_valid <= data_valid;
          end
        end
        WB_W: begin
          address <= address + axi.wready;
        end
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
        // During a hit, return to idle. If a miss occurs, the cache has to transition to check the dirty bits.
        if (~miss) next_state = IDLE;
        else next_state = CHK_DIRTY;
      WB_W: if (axi.w.last && axi.wready) next_state = WB_B;
      WB_B: if (axi.b.valid) next_state = MISS_AR;
      MISS_AR: if (axi.arready) next_state = MISS_R;
      CHK_DIRTY: begin
        if (cache_rline[lru].dirty && axi.awready) next_state = WB_W;
        else if (~cache_rline[lru].dirty && axi.arready) next_state = MISS_R;
      end
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
    // By default, don't enable writes or read from the cache
    o_we_cache = 0;
    o_re_cache = 0;
    hit = 0;
    o_we_lru = 0;
    o_wlru = i_rlru;
    data_valid = 0;
    o_req_ready = 0;
    cache_wline = 'x;
    // Default AXI
    axi.aw = 'x;
    axi.w = 'x;

    o_raddr = index;
    o_waddr = index;
    o_lru_addr = index;

    // Control signals for AXI lines is held zero by default
    {axi.ar.valid, axi.rready, axi.aw.valid, axi.w.valid, axi.w.last, axi.bready} = 0;

    // The AXI address always takes the tag, with the LSB set to zero
    // This is the first address in the block to read from memory
    axi.ar.addr = 0;
    axi.ar.addr[$size(axi.ar.addr) - 1:WORD_BITS + OFFSET] = {tag, index};
    axi.aw.addr = 0;
    axi.aw.addr[$size(axi.aw.addr) - 1:WORD_BITS + OFFSET] = {cached_tag, index};
    // The length of the burst will be equal to the size of the block
    axi.ar.len = WORDS_PER_LINE - 1;
    axi.aw.len = WORDS_PER_LINE - 1;
    // Send 32 bit data at incrementing addresses
    axi.ar.size = 2;
    axi.aw.size = 2;
    axi.ar.burst = INCR;
    axi.aw.burst = INCR;
    axi.w.strb = '1;

    unique case(curr_state)
      FLUSH: begin
        // Set all of the way caches to be not valid
        o_we_cache = '1;
        o_we_lru = 1;
        o_re_cache = '1;
        cache_wline.dirty = 0;
        cache_wline.valid = 0;
        // Reset the LRU bits
        o_wlru = 0;
        o_raddr = address;
        o_waddr = address;
        o_lru_addr = address;
      end
      IDLE: begin
        // Enable each of the way caches
        o_req_ready = 1;
        o_raddr = i_addr[INDEX_BITS + WORD_BITS + OFFSET - 1:WORD_BITS + OFFSET];
        o_re_cache = '1;
      end
      CHK_TAG: begin
        // Check the TAG bits in parallel for each way
        // Verify the Tag and valid bit
        for(int r=0; r < BLK_PER_SET; r++) begin
          // Compare the valid bit and the cache tag, compare to address tag
          o_re_cache[r] = 1;
          if (cache_rline[r].valid && cache_rline[r].tag == tag) begin
            hit[r] = 1;
            line_sel = cache_rline[r];
            data_valid = 1;
            // Reset the PLRU table if it is full
            if (i_rlru == '1) o_wlru = 0;
            // Mark the bit as recently used
            o_wlru[r] = 1;
            o_we_lru = 1;

            // Choose the data to load from the cache (Word, Half, or Byte) and sign
            unique case(load_operation)
              // Sign extend 8 bit assignment
              LB: data = $signed(line_sel.data[word][8*offset +: 8]);
              // Sign extend 16 bit assignmnet
              LH: data = $signed(line_sel.data[word][8*offset +: 16]);
              // Whole word assignment
              LW: data = line_sel.data[word];
              // Extend with zeros
              LBU: data = line_sel.data[word][8*offset +: 8];
              // Extend with zeros
              LHU: data = line_sel.data[word][16*offset +: 16];
              default: data = line_sel.data[word];
            endcase;

            // If this is a hit, and it's a write command last cycle, write
            // to the cache and make it dirty
            if (write) begin
              o_we_cache[r] = 1;
              cache_wline.dirty = 1;
              cache_wline.valid = 1;
              // Default the cache line to be equal to its current value
              cache_wline.data = cache_rline[r].data;
              cache_wline.tag = tag;

              // Choose the data to store to the cache (Word, Half, or Byte)
              unique case(store_size)
                SB: cache_wline.data[word][8*offset +: 8] = store_data[7:0];
                SH: cache_wline.data[word][8*offset +: 16] = store_data[15:0];
                SW: cache_wline.data[word] = store_data;
                default: cache_wline.data[word] = store_data;
              endcase;

            end

          end
        end

      end
      CHK_DIRTY: begin
        axi.aw.valid = cache_rline[lru].dirty;
        axi.ar.valid = ~cache_rline[lru].dirty;
        o_re_cache = '1;
      end
      WB_W: begin
        // Perform the write back of the block that will be replaced
        axi.w.valid = 1;
        axi.w.data = cache_rline[lru].data[address[WORD_BITS - 1:0]];
        if (address == WORDS_PER_LINE - 1) axi.w.last = 1;
        o_raddr = index;
        o_re_cache = '1;
      end
      WB_B: begin
        // Receive the write response
        axi.bready = 1;
        o_re_cache = '1;
      end
      MISS_AR: begin
        // Wait for AR to be ready
        axi.ar.valid = 1;
        o_re_cache = '1;
      end

      MISS_R: begin
        // The write enable to the way that has been selected based on LRU
        o_we_cache[lru] = 1;

        cache_wline.dirty = 0;
        cache_wline.valid = 1;
        // Default the cache line to be equal to its current value
        cache_wline.data = cache_rline[lru].data;
        cache_wline.data[address[WORD_BITS - 1:0]] = axi.r.data;
        cache_wline.tag = tag;
        o_waddr = index;
        // Accept reads in this state
        axi.rready = 1;
        o_re_cache = '1;
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
