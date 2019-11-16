`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 04/21/2019 11:48:54 AM
// Design Name: 
// Module Name: core_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:
// A single core processor using the RISC V ISA, targetting FPGA designs utilizing
// an AXI bus.
// 
// Dependencies:
// writeback.sv
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;
import axi_defines::*;

module core_top #(
  // The starting address for the program counter
  parameter logic [31:0] PC_BASE_ADDR = 0,
  // The size of the instruction cache desired in bytes
  parameter INST_CACHE_SIZE = 2**14,
  // Associativity factor of the instruction cache (1- Direct Mapped, N - N way set associative)
  parameter INST_ASSOCIATIVITY = 2,
  // The size of the data cache desired in bytes
  parameter DATA_CACHE_SIZE = 2**14,
  // Associativity factor of the data cache (1- Direct Mapped, N - N way set associative)
  parameter DATA_ASSOCIATIVITY = 2
  )(

  // System clock
  input logic i_aclk,

  // Asychronous Reset
  input logic i_areset_n,

  // AXI Master from the instruction cache contorller
  axi_inf.master axi_instr,

  // AXI Master from the data cache controller
  axi_inf.master axi_data
);

  // Hazard Unit
  logic decode_en;
  logic fetch_en;
  logic exe_en;
  logic ma_en;
  logic fetch_branch_valid;
  logic [31:0] fetch_branch_addr;

  logic [1:0] hazard_to_exe_forward_a;
  logic [1:0] hazard_to_exe_forward_b;
  logic [1:0] hazard_to_decode_forward_a;
  logic [1:0] hazard_to_decode_forward_b;

  // Fetch to decode
  logic decode_instr_valid;
  logic [INST_SIZE - 1:0] decode_instruction;
  logic [31:0] decode_pc;
  logic [31:0] decode_pcplus4;

  // Decode to hazard
  logic [31:0] decode_to_hazard_branch_addr;
  logic decode_to_hazard_branch_valid;
  logic [$clog2(NUM_REGS) -1:0] decode_to_hazard_rs1;
  logic [$clog2(NUM_REGS) -1:0] decode_to_hazard_rs2;

  // Decode to execution unit
  logic [DATA_SIZE - 1:0] exe_rd1;
  logic [DATA_SIZE - 1:0] exe_rd2;
  logic [$clog2(NUM_REGS) - 1:0] exe_rdest;
  logic signed [DATA_SIZE - 1:0] exe_immediate;
  logic [31:0] exe_pc;
  logic [31:0] exe_pcplus4;
  logic exe_cu_regwrite;
  logic [1:0] exe_cu_memtoreg;
  logic exe_cu_memwrite;
  logic exe_cu_memaccess;
  t_aluop exe_cu_aluop;
  logic [1:0] exe_cu_alu_srca;
  logic [1:0] exe_cu_alu_srcb;
  t_exe_unit exe_cu_exe_unit;
  t_brop exe_cu_brop;
  t_sysop exe_cu_sysop;
  t_ldop exe_ldop;
  t_sop exe_sop;
  logic exe_cu_jalr;

  // Execute to hazard
  logic [31:0] execute_to_hazard_branch_addr;
  logic execute_to_hazard_branch_valid;
  logic [$clog2(NUM_REGS) - 1:0] exe_to_hazard_rs1;
  logic [$clog2(NUM_REGS) - 1:0] exe_to_hazard_rs2;

  // Execute to memory access unit
  logic signed [DATA_SIZE - 1:0] ma_calc;
  logic signed [DATA_SIZE - 1:0] ma_wdata;
  logic [$clog2(NUM_REGS) -1:0] ma_rdest;
  logic [31:0] ma_pcplus4;
  logic ma_cu_regwrite;
  logic [1:0] ma_cu_memtoreg;
  logic ma_cu_memwrite;
  logic ma_cu_memaccess;
  t_ldop ma_ldop;
  t_sop ma_sop;

  // Memory access to hazard
  logic ma_to_hazard_cache_ready;

  // Memory access to write back
  logic [31:0] wb_pcplus4;
  logic [$clog2(NUM_REGS) -1:0] wb_rdest;
  logic wb_cu_regwrite;
  logic [1:0] wb_cu_memtoreg;
  logic [DATA_SIZE - 1:0] wb_mem_data;
  logic [DATA_SIZE - 1:0] wb_exe_data;

  // Writeback to decode
  logic decode_cu_regwrite;
  logic signed [DATA_SIZE - 1:0] decode_wreg;
  logic [$clog2(NUM_REGS) - 1:0] decode_rdest;

  // The fetch unit, which increments the program counter and accepts a new instruction from the instruction cache
  instr_fetch #(
    .PC_BASE_ADDR(PC_BASE_ADDR),
    .ADDR_SIZE(32),
    .CACHE_SIZE(INST_CACHE_SIZE),
    .BLK_PER_SET(INST_ASSOCIATIVITY)
  ) fetch_unit (
    .i_aclk(i_aclk),
    .i_areset_n(i_areset_n),

    .axi(axi_instr),
    .i_branch_addr(fetch_branch_addr),
    .i_branch_valid(fetch_branch_valid),
    .i_en(fetch_en),

    .o_instruction(decode_instruction),
    .o_instr_valid(decode_instr_valid),
    .o_pc(decode_pc),
    .o_pcplus4(decode_pcplus4)
  );

  // The decode unit, which determines the instruction and its components
  instr_decode #() decode_unit (
    .i_aclk(i_aclk),
    .i_areset_n(i_areset_n),

    .i_en(decode_en),

    .i_instruction(decode_instruction),
    .i_pc(decode_pc),
    .i_pcplus4(decode_pcplus4),
    .o_branch_addr(decode_to_hazard_branch_addr),
    .o_branch_valid(decode_to_hazard_branch_valid),
    .o_rs1(decode_to_hazard_rs1),
    .o_rs2(decode_to_hazard_rs2),

    .i_wb(decode_cu_regwrite),
    .i_wb_data(decode_wreg),
    .i_wb_addr(decode_rdest),

    .i_forward_a(hazard_to_decode_forward_a),
    .i_forward_b(hazard_to_decode_forward_b),
    .i_fdata_ma(wb_exe_data),

    .o_rd1(exe_rd1),
    .o_rd2(exe_rd2),
    .o_rdest(exe_rdest),
    .o_immediate(exe_immediate),
    .o_pc(exe_pc),
    .o_pcplus4(exe_pcplus4),
    .o_cu_regwrite(exe_cu_regwrite),
    .o_cu_memtoreg(exe_cu_memtoreg),
    .o_cu_memwrite(exe_cu_memwrite),
    .o_cu_memaccess(exe_cu_memaccess),
    .o_cu_aluop(exe_cu_aluop),
    .o_cu_alu_srca(exe_cu_alu_srca),
    .o_cu_alu_srcb(exe_cu_alu_srcb),
    .o_cu_exe_unit(exe_cu_exe_unit),
    .o_cu_brop(exe_cu_brop),
    .o_cu_sysop(exe_cu_sysop),
    .o_ldop(exe_ldop),
    .o_sop(exe_sop),
    .o_cu_jalr(exe_cu_jalr)
  );

  // The execution unit, which contains the ALU, system operation unit, and branch operation unit
  execute_unit #() exe_unit (
    .i_aclk(i_aclk),
    .i_areset_n(i_areset_n),

    .i_en(exe_en),

    .i_pc(exe_pc),
    .i_pcplus4(exe_pcplus4),
    .i_branch_addr(decode_to_hazard_branch_addr),
    .o_pcplus4(ma_pcplus4),
    .o_branch_addr(execute_to_hazard_branch_addr),
    .o_branch_valid(execute_to_hazard_branch_valid),

    .i_rdest(exe_rdest),
    .o_rdest(ma_rdest),

    .i_forward_a(hazard_to_exe_forward_a),
    .i_forward_b(hazard_to_exe_forward_b),

    .i_id_op1(exe_rd1),
    .i_id_op2(exe_rd2),
    .i_id_rs1(decode_to_hazard_rs1),
    .i_id_rs2(decode_to_hazard_rs2),
    .o_id_rs1(exe_to_hazard_rs1),
    .o_id_rs2(exe_to_hazard_rs2),
    .i_ma_op(wb_exe_data),
    .i_wb_op(decode_wreg),

    .i_immediate(exe_immediate),
    .i_cu_regwrite(exe_cu_regwrite),
    .i_cu_memtoreg(exe_cu_memtoreg),
    .i_cu_memwrite(exe_cu_memwrite),
    .i_cu_memaccess(exe_cu_memaccess),
    .i_cu_aluop(exe_cu_aluop),
    .i_cu_alu_srca(exe_cu_alu_srca),
    .i_cu_alu_srcb(exe_cu_alu_srcb),
    .i_cu_exe_unit(exe_cu_exe_unit),
    .i_cu_brop(exe_cu_brop),
    .i_cu_sysop(exe_cu_sysop),
    .i_ldop(exe_ldop),
    .i_sop(exe_sop),
    .i_cu_jalr(exe_cu_jalr),

    .o_exe_calc(ma_calc),
    .o_exe_wdata(ma_wdata),
    .o_cu_regwrite(ma_cu_regwrite),
    .o_cu_memtoreg(ma_cu_memtoreg),
    .o_cu_memwrite(ma_cu_memwrite),
    .o_cu_memaccess(ma_cu_memaccess),
    .o_ldop(ma_ldop),
    .o_sop(ma_sop)
  );

  // The memmory access unit, which accesses the data cache in order to obtain or write memory
  mem_access #(
    .ADDR_SIZE(32),
    .CACHE_SIZE(DATA_CACHE_SIZE),
    .BLK_PER_SET(DATA_ASSOCIATIVITY)
  ) mem_access_unit (
    .i_aclk(i_aclk),
    .i_areset_n(i_areset_n),

    .axi(axi_data),

    .i_en(ma_en),
    .i_pcplus4(ma_pcplus4),
    .o_pcplus4(wb_pcplus4),

    .i_rdest(ma_rdest),
    .o_rdest(wb_rdest),

    .i_exe_out(ma_calc),
    .i_mem_wdata(ma_wdata),
    .i_mem_we(ma_cu_memwrite),

    .i_cu_memaccess(ma_cu_memaccess),
    .i_ldop(ma_ldop),
    .i_sop(ma_sop),
    .i_cu_regwrite(ma_cu_regwrite),
    .o_cu_regwrite(wb_cu_regwrite),
    .i_cu_memtoreg(ma_cu_memtoreg),
    .o_cu_memtoreg(wb_cu_memtoreg),

    .o_mem_data(wb_mem_data),
    .o_exe_data(wb_exe_data),

    .o_cache_ready(ma_to_hazard_cache_ready)
  );

  // The writeback unit, which writes into the register file of the decode stage
  writeback #() wb_unit(
    .i_aclk(i_aclk),
    .i_areset_n(i_areset_n),

    .i_rdest(wb_rdest),
    .o_rdest(decode_rdest),

    .i_cu_regwrite(wb_cu_regwrite),
    .i_cu_memtoreg(wb_cu_memtoreg),

    .o_cu_regwrite(decode_cu_regwrite),
    .i_pcplus4(wb_pcplus4),

    .i_mem_data(wb_mem_data),
    .i_exe_data(wb_exe_data),
    .o_wb_result(decode_wreg)
  );

  // The hazard unit, which handles forwarding and pipeline control
  hazard_unit #() hazard_unit(
    .i_aclk(i_aclk),
    .i_areset_n(i_areset_n),

    .o_br_addr(fetch_branch_addr),
    .o_br_valid(fetch_branch_valid),
    .o_fetch_en(fetch_en),

    .i_fetch_instr_valid(decode_instr_valid),
    .i_decode_br_addr(decode_to_hazard_branch_addr),
    .i_decode_br_valid(decode_to_hazard_branch_valid),
    .i_decode_pc(decode_pc),
    .i_decode_rs1(decode_to_hazard_rs1),
    .i_decode_rs2(decode_to_hazard_rs2),
    .o_decode_fwd_a(hazard_to_decode_forward_a),
    .o_decode_fwd_b(hazard_to_decode_forward_b),
    .o_decode_en(decode_en),

    .i_execute_br_addr(execute_to_hazard_branch_addr),
    .i_execute_br_valid(execute_to_hazard_branch_valid),
    .i_exe_rs1(exe_to_hazard_rs1),
    .i_exe_rs2(exe_to_hazard_rs2),
    .o_exe_fwd_a(hazard_to_exe_forward_a),
    .o_exe_fwd_b(hazard_to_exe_forward_b),
    .o_exe_en(exe_en),

    .i_ma_cache_ready(ma_to_hazard_cache_ready),
    .i_ma_memaccess(ma_cu_memaccess),
    .i_ma_regwrite(wb_cu_regwrite),
    .i_ma_memtoreg(wb_cu_memtoreg),
    .i_ma_rdest(wb_rdest),
    .o_ma_en(ma_en),
    
    .i_wb_regwrite(decode_cu_regwrite),
    .i_wb_rdest(decode_rdest)

    //.i_ma_cache_ready(ma_to_hazard_cache_ready),
    //.i_ma_memaccess(ma_cu_memaccess),
    //.i_ma_regwrite(ma_cu_regwrite),
    //.i_ma_memtoreg(ma_cu_memtoreg),
    //.i_ma_rdest(ma_rdest),
    //.o_ma_en(ma_en),
//
    //.i_wb_regwrite(wb_cu_regwrite),
    //.i_wb_rdest(wb_rdest)
  );

endmodule
