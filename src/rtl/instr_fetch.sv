`timescale 1ns / 1ps
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
    .o_instr_valid(o_instr_valid),
    // The instruction obtained from the cache DUT
    .o_instruction(o_instruction)
  );

  // Program counter is incremented by four
  assign pcplus4 = pc_fetch + INST_SIZE / 8;

  // Multiplexer decides if decode address should be taken or next instruction
  assign pc = i_branch_valid ? i_branch_addr : pcplus4;

  // Enables the decode stage to use the address in its next decode
  // If left invalid, then the decode stage should disable by using No-Ops as its decode
  //assign o_instr_valid = cache_valid & ~i_branch_valid;

  // Update the program counter register controlling cache access
  always_ff @(posedge i_aclk or negedge i_areset_n) begin : proc_pc
    if(~i_areset_n) begin
      cache_req <= 0;
      pc_fetch <= PC_BASE_ADDR;
    end else begin
      // Program counter only increments when cache is ready and pipeline is not stalled
      if (cache_ready && cache_req) begin
        o_pc <= pc_fetch;
        o_pcplus4 <= pcplus4;
        pc_fetch <= pc;
        cache_req <= i_en;
      end else if (i_en) begin
        cache_req <= 1;
      end else begin
        cache_req <= 0;
      end

    end
  end

endmodule
