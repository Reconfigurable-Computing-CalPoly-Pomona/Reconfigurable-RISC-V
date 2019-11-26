//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 03/16/2019 10:39:58 PM
// Design Name: 
// Module Name: instr_fetch
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// The instruction fetch stage of the pipeline. Accesses the instruction cache
// and delivers instruction to decode stage. Takes in a branch or jump address
// that may occur in later stages
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

module instr_fetch #(
  // The starting address for the program counter
  parameter logic [ADDR_SIZE - 1:0] PC_BASE_ADDR,
  // The size of the accessible address space
  parameter ADDR_SIZE = 32,
  // The size of the cache desired in bytes
  parameter CACHE_SIZE = 2**14,
  // Associativity factor (1- Direct Mapped, N - N way set associative)
  parameter BLK_PER_SET = 2
)(
  // System clock
  input logic i_aclk,

  // Asynchronous reset
  input logic i_areset_n,

  // AXI Master Passthrough from cache
  axi_inf.master axi,

  // If the branch/jump is valid, then this address will become the new address to fetch
  input logic [ADDR_SIZE - 1:0] i_branch_addr,

  // Denotes if the branch address from the decode stage is valid (branch taken/jump)
  input logic i_branch_valid,

  // Controls when the fetch stage will grab another instruction, controlled by hazard unit
  input logic i_en,

  // The instruction to return to the instruction fetch stage
  output logic [INST_SIZE - 1:0] o_instruction,

  // Enables the registers between the fetch and decode stage
  // This can be not-valid if the cache is missing or if a branch has occured
  output logic o_instr_valid,

  // The address of the program counter + 4, to be used in calculations in decode stage
  output logic [ADDR_SIZE - 1:0] o_pcplus4,

  // The address of the program counter corresponding to the instruction
  output logic [ADDR_SIZE - 1:0] o_pc
);


  // The request for access to the cache
  logic cache_req;

  // The cache is ready for a new request
  logic cache_ready;

  // The current program counter that is being requested from the cache
  logic [ADDR_SIZE - 1:0] pc_fetch;

  // The program counter calculated from the incoming branch and pcplus4
  logic [ADDR_SIZE - 1:0] pc;
  logic [ADDR_SIZE - 1:0] pcplus4;

  // The instruction is available from the rest of the cache
  logic cache_valid;

  // When a branch is valid, the output of the cache becomes invalid until it receives the new branch address
  logic cache_invalidate;

  // Indicates there is an instruction waiting to be sent to the decode stage after the stall is lifted
  logic instr_stalled_valid;

  // The registered instruction enabled whenever a stall occurs
  logic [INST_SIZE - 1:0] instr_stalled;

  // The instruction from the to cache to be sent to the decode stage
  logic [INST_SIZE - 1:0] cache_instr;


  /////////////////////////////////////////////
  // Instruction Cache
  /////////////////////////////////////////////

  instruction_cache #(
    .ADDR_SIZE(ADDR_SIZE),
    .CACHE_SIZE(CACHE_SIZE),
    .BLK_PER_SET(BLK_PER_SET)
  ) instr_cache(
    // System Clock and reset
    .i_aclk(i_aclk),
    .i_areset_n(i_areset_n),
    // AXI
    .axi(axi),
    // Request for instruction
    .i_req(cache_req),
    // Cache is ready for a new request
    .o_req_ready(cache_ready),
    // Program counter stimulus
    .i_addr(pc_fetch),
    // Indicates that o_instruction is valid
    .o_instr_valid(cache_valid),
    // The instruction obtained from the cache DUT
    .o_instruction(cache_instr)
  );

  // Program counter is incremented by four
  assign pcplus4 = pc_fetch + INST_SIZE / 8;

  // Multiplexer decides if decode address should be taken or next instruction
  assign pc = i_branch_valid ? i_branch_addr : pcplus4;

  // The instruction is valid as soon as it comes out of the cache, unless the data is invalid due to a jump or branch
  assign o_instr_valid = (instr_stalled_valid | cache_valid) & ~cache_invalidate;

  // The instruction to the decode stage takes the stored instruction if coming out of a stall, otherwise it takes the instruction directly from the cache
  assign o_instruction = instr_stalled_valid ? instr_stalled : cache_instr;

  // Enable reading from the cache whenever not stalled
  assign cache_req = i_en;

  // Update the program counter register controlling cache access
  always_ff @(posedge i_aclk or negedge i_areset_n) begin : proc_pc
    if(~i_areset_n) begin
      pc_fetch <= PC_BASE_ADDR;
      o_pc <= PC_BASE_ADDR;
      o_pcplus4 <= PC_BASE_ADDR + 4;
      instr_stalled_valid <= 0;
      cache_invalidate <= 0;
    end else begin

      if (~i_en && o_instr_valid) begin
        instr_stalled <= o_instruction;
        instr_stalled_valid <= 1;
      end else if (i_en) begin
        instr_stalled_valid <= 0;
      end

      // Program counter only increments when cache is ready and pipeline is not stalled
      // If there is an occurance of a branch becoming valid, the PC will be set to a new value and will attempt to access the cache
      if ((i_en && cache_ready && cache_req) || (i_en && i_branch_valid)) begin
        pc_fetch <= pc;
      end

      // There is a new address for the program counter, the cache won't know this until its transaction completes, so it must be invalidated until it becomes available again
      if (i_branch_valid && i_en) begin
        cache_invalidate <= 1;
      end else if (cache_ready) begin
        cache_invalidate <= 0;
      end

      // Register the program counter that was last used to fetch the data to send for use in other stages
      if (i_en && cache_ready && cache_req) begin
        o_pc <= pc_fetch;
        o_pcplus4 <= pcplus4;
      end

    end
  end

endmodule
