`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 03/24/2019 03:32:12 PM
// Design Name: 
// Module Name: writeback
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// The write back stage multiplexes the different data paths (PC, ALU, LD) to choose
// the one to write back to the register file. If there is no write back to register,
// this stage will do nothing. 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;

module writeback(
  // System clock
  logic i_aclk,

  // Asynchronous reset
  logic i_areset_n,

  // The write back destination
  input logic [$clog2(NUM_REGS) - 1:0] i_rdest,

  // The write back destination, pipelined
  output logic [$clog2(NUM_REGS) - 1:0] o_rdest,

  // Pass through control signals

  // Pipelined control signal to determine if reg file should be written
  input logic i_cu_regwrite,

  // Pipelined control signal to determine if pc, mem, or alu output will go to the register file
  input logic [1:0] i_cu_memtoreg,

  // Pipelined control signals

  // Enables writing to the register file
  output logic o_cu_regwrite,

  // The address of the program counter + 4, to be pipelined to later stage for JAL/JALR linkage
  input logic [INST_SIZE - 1:0] i_pcplus4,

  // The data from any load accesses
  input logic signed [DATA_SIZE - 1:0] i_mem_data,

  // The data from ALU executions
  input logic signed [DATA_SIZE - 1:0] i_exe_data,

  // Data to write to the register file and forward to any stages that need it
  output logic signed [DATA_SIZE - 1:0] o_wb_result
);

  // The address of the program counter + 4, to be pipelined to later stage for JAL/JALR linkage
  logic [INST_SIZE - 1:0] pcplus4;

  // The data from any load accesses, pipelined
  logic signed [DATA_SIZE - 1:0] mem_data;

  // The data from ALU executions, pipelined
  logic signed [DATA_SIZE - 1:0] exe_data;

  // Determines which data gets written to the register file
  logic [1:0] cu_memtoreg;

  // Multiplex the data that could be written into the register file
  // 00 - ALU, 01 - Memory, 10 - Program counter + 4 
  always_comb begin : proc_mux_wdata
    unique case(cu_memtoreg)
      'b00: o_wb_result = exe_data;
      'b01: o_wb_result = mem_data;
      'b10: o_wb_result = pcplus4;
      default: o_wb_result = 'x;
    endcase
  end

  // Reset FF control register
  always_ff @(posedge i_aclk or negedge i_areset_n) begin : control_ff
    if(~i_areset_n) begin
      o_cu_regwrite <= 0;
    end else begin
      o_cu_regwrite <= i_cu_regwrite;
    end
  end

  // Pipeline registers
  always_ff @(posedge i_aclk) begin : pipeline_ff
    cu_memtoreg <= i_cu_memtoreg;
    mem_data <= i_mem_data;
    exe_data <= i_exe_data;
    pcplus4 <= i_pcplus4;
    o_rdest <= i_rdest;
  end

endmodule