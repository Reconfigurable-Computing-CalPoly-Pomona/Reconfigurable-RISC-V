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


module instr_cache_ctrl #(
  parameter ADDR_SIZE = 32,
  parameter BLK_PER_SET = 2,
  parameter TAG BITS,
  parameter INDEX_BITS,
  parameter CACHE_DEPTH
  )(
  // System Clock and Reset
  input logic i_clk,
  input logic i_areset_n,

  // AXI types for read memory access
  input axi_slave_t i_axi,
  output axi_master_t o_axi,

  // Address from fetch stage
  input logic [ADDR_SIZE - 1:0] i_addr,

  // Request from fetch stage
  input logic i_req,

  // Valid + Tag + Payload from cache
  input logic [TAG_BITS + INDEX_BITS:0] i_data [0:BLK_PER_SET - 1],

  // Write to each individual way
  output logic [BLK_PER_SET - 1:0] o_we,

  // The output valid + tag + payload for cache
  output logic [TAG_BITS + INDEX_BITS:0] o_data,

  // The output address to each of the ways
  output logic [$clog2(CACHE_DEPTH) - 1:0] o_addr,

  // The output to the fetch stage
  output logic o_instr_valid,

  // The output instruction to the fetch stage
  output logic [INST_SIZE - 1:0] o_instruction
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



  // Most signficant bits of address, which are compared for a hit or miss
  logic [TAG_BITS - 1:0] tag;

  // The index which determines which index of the cache RAM will contain the value
  logic [INDEX_BITS - 1:$clog2(ADDR_SIZE / 8)] index;

  // Indicates that the memory location is valid can be compared
  logic [BLK_PER_SET - 1:0] cache_valid;

  // Most signficant bits of address, which are compared for a hit or miss
  logic [TAG_BITS - 1:0] cache_tag [0:BLK_PER_SET - 1];

  // The way that contains the hit at the output of the multiplexer
  logic [$clog2(BLK_PER_SET) - 1:0] sel_way;

  // The address flip flop to determine where to write to
  logic [$clog2(CACHE_DEPTH) - 1:0] address;

  // A vector representing the output of the tag comparison. One hot
  logic [BLK_PER_SET - 1:0] hit;

  // When high, none of the way caches have received a tag hit
  logic miss;

  // The index bits, which is used  
  always_ff @(posedge i_clk or negedge i_areset_n) begin : proc_seq_ff
    if(~i_areset_n) begin
      curr_state = FLUSH;
      address <= 0;
    end else begin
      curr_state = next_state;
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
          address <= address + i_axi.r.valid;
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
        // If at the last address
        if (o_addr == '1) next_state = IDLE;
      IDLE:
        // Wait for a request 
        if (i_req) next_state = CHK_TAG;
      CHK_TAG:
        // Determine if a hit has occured by reading the BRAM
        if (~miss) next_state = IDLE;
        else if (i_arready) next_state = MISS_R;
      MISS_R:
        // Accept reads until finished
        if (i_axi.r.valid && address == LINES_PER_BLK - 1) next_state = IDLE;
      default:;
    endcase
  
  end : proc_state

  // Combinatoral outputs

  // If no hit occurs on any of the ways, set the miss bit
  assign miss = ~|hit;
  //assign valid = i_data[TAG_BITS + INDEX_BITS];
  assign tag = i_addr[TAG_BITS + INDEX_BITS - 1:INDEX_BITS];
  assign index = i_addr[INDEX_BITS - 1:$clog2(ADDR_SIZE / 8)];

  // Assign the instruction to be the data payload
  assign o_instruction = i_data[sel_way][TAG_BITS + INDEX_BITS - 1:0];
  

  always_comb begin : proc_state
    // By default, don't write to the cache
    o_we = 0;
    o_instr_valid = 0;
    o_data = 'x;

    // Default AXI
    o_axi = 'x;
    o_addr = 'x;
    sel_way = 'x;
    // Control signals for AXI lines is held zero by default
    {o_axi.ar.valid, o_axi.rready, o_axi.aw.valid, o_axi.w.valid} = 0;

    // The AXI address always takes the tag, with the LSB set to zero
    // This is the first address in the block to read from memory
    o_axi.ar.addr = '{tag, default:0};
    // The length of the burst will be equal to the size of the block
    o_axi.ar.len = LINES_PER_BLK - 1;

    unique case(curr_state)
      FLUSH: begin
        // Set all of the way caches to be not valid
        o_we = '1;
        o_addr = address;
        for (int unsigned w; w < BLK_PER_SET; W++) o_data[w][$size(o_data) - 1] = 0;
      end
      IDLE: begin
        // Enable each of the way caches
        o_addr = i_addr[$clog2(CACHE_DEPTH) - 1:$clog2(ADDR_SIZE / 8)];
      end
      CHK_TAG: begin
        // Check the TAG bits in parallel for each way
        // Verify the Tag and valid bit
        for(int unsigned w=0; w < BLK_PER_SET; w++) begin
          // Compare the valid bit and the cache tag, compare to address tag
          if (cache_valid[w] && cache_tag[w] == tag) begin
            hit[w] = 1;
            o_instr_valid = 1;
            // Sel_way contains the output of the multiplexer
            // It contains the way that has the hit, if a hit exists
            sel_way = w;
          end
        end
        o_axi.ar.valid = ~|hit;
        o_addr = i_addr[$clog2(CACHE_DEPTH) - 1:$clog2(ADDR_SIZE / 8)];
      end

      MISS_R: begin
        o_we[sel_way] = 1;
        o_axi.rready = 1;
        o_addr = address;
      end
      default:;
    endcase
  
  end : proc_state

endmodule
