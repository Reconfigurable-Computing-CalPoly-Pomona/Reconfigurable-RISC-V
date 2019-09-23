`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 03/24/2019 03:32:12 PM
// Design Name: 
// Module Name: mem_access
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// The memory access stage of the pipeline, which handle data loads and stores from memory
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;

module mem_access#(
  // The size of the accessible address space
  parameter ADDR_SIZE = 32,
  // The size of the cache desired in bytes
  parameter CACHE_SIZE = 2**14,
  // Associativity factor (1- Direct Mapped, N - N way set associative)
  parameter BLK_PER_SET = 2
)(
  // System clock
  logic i_aclk,

  // Asynchronous reset
  logic i_areset_n,

  // AXI Master Passthrough from cache
  axi_inf.master axi,

  // Enables accepting another instruction, this may be disabled if stalling is neccessary from the data memory
  input logic i_en,

  // The address of the program counter + 4, to be pipelined to later stage for JAL/JALR linkage
  input logic [INST_SIZE - 1:0] i_pcplus4,

  // The address of the program counter + 4, to be pipelined to later stage for JAL/JALR linkage
  output logic [INST_SIZE - 1:0] o_pcplus4,

  // The write back destination
  input logic [$clog2(NUM_REGS) -1:0] i_rdest,

  // The write back destination
  output logic [$clog2(NUM_REGS) -1:0] o_rdest,

  // The input from the calculation unit
  input logic [DATA_SIZE - 1:0] i_exe_out,

  // The write data to pass to the data cache
  input signed [DATA_SIZE - 1:0] i_mem_wdata,

  // Determines if dmem will be written to
  input logic i_mem_we,

  // Determines if the dmem will be accessed
  input logic i_cu_memaccess,

  // Pass through control signals

  // The size of the load operation
  input t_ldop i_ldop,

  // The size of the store operation
  input t_sop i_sop,

  // Pipelined control signal to determine if reg file should be written at the end of instruction
  input logic i_cu_regwrite,

  // Pipelined control signal to determine if reg file should be written at the end of instruction
  output logic o_cu_regwrite,

  // Pipelined control signal to determine if pc, mem, or alu output will go to the register file
  input logic [1:0] i_cu_memtoreg,

  // Pipelined control signal to determine if pc, mem, or alu output will go to the register file
  output logic [1:0] o_cu_memtoreg,

  // Write back signals

  // The write data to pass to the data cache
  output logic signed [DATA_SIZE - 1:0] o_mem_data,

  // The data to forward to the ALU and write back stages, originally came from execution unit
  output logic signed [DATA_SIZE - 1:0] o_exe_data,

  // Indicates the cache is ready. This should be sent to the control unit in order to determine if a stall is neccessary
  output o_cache_ready
);

  data_cache #(
    .ADDR_SIZE(ADDR_SIZE),
    .CACHE_SIZE(CACHE_SIZE),
    .BLK_PER_SET(BLK_PER_SET)
  ) dcache(
    // System Clock and reset
    .i_aclk(i_aclk),
    .i_areset_n(i_areset_n),
    // AXI
    .axi(axi),
    // Request for data; only ld/store will request this memory
    .i_req(i_cu_memaccess),
    // Request is a write request, only stores will request this write enable
    .i_req_write(i_mem_we),
    // Cache is ready for a new request
    .o_req_ready(o_cache_ready),
    // The data to store
    .i_store_data(i_mem_wdata),
    // The size of the data to store (word, half, byte)
    .i_sop(i_sop),
    // The size and sign of the data to read
    .i_ldop(i_ldop),
    // The address of the data to access
    .i_addr(i_exe_out),
    // Indicates that o_data is valid
    .o_data_valid(),
    // The data obtained from the cache DUT
    .o_data(o_mem_data)
  );

  // The ID & EXE stages should stall behind if the cache needs to be accessed when its not ready.
  // The hazard unit shall handle this
  // The write back will naturally also stall, but the last write back once the data is valid shall be valid

  // Registers apart of the pipeline that must be reset
  always_ff @(posedge i_aclk or negedge i_areset_n) begin : proc_pipe_rst
    if(~i_areset_n) begin
      o_cu_regwrite <= 0;
    end else begin
      if (i_en) begin
        o_cu_regwrite <= i_cu_regwrite;
      end
    end
  end
  
  // Add the input signals to the pipelining registers
  always_ff @(posedge i_aclk) begin : proc_pipe
    if (i_en) begin
      o_pcplus4     <= i_pcplus4;
      o_exe_data    <= i_exe_out;
      o_rdest       <= i_rdest;
      o_cu_memtoreg <= i_cu_memtoreg;
    end
  end

endmodule
