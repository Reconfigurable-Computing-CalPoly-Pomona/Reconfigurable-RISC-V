`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler 
// 
// Create Date: 07/20/2019 11:45:24 AM
// Design Name: 
// Module Name: core_top_wrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:
// Converts the top level core from a SystemVerilog file to Verilog for the purpose
// of block diagram compatibility.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module core_top_wrapper #(
  // The starting address for the program counter
  parameter PC_BASE_ADDR = 0,
  // The size of the instruction cache desired in bytes
  parameter INST_CACHE_SIZE = 2**14,
  // Associativity factor of the instruction cache (1- Direct Mapped, N - N way set associative)
  parameter INST_ASSOCIATIVITY = 2,
  // The size of the data cache desired in bytes
  parameter DATA_CACHE_SIZE = 2**14,
  // Associativity factor of the data cache (1- Direct Mapped, N - N way set associative)
  parameter DATA_ASSOCIATIVITY = 2
)(
  // System Clock and Reset
  input wire i_aclk,
  input wire i_areset_n,

  // AW Instruction
  input wire i_instr_awready,
  output wire o_instr_awvalid,
  output wire [1:0] o_instr_awburst,
  output wire [2:0] o_instr_awsize,
  output wire [7:0] o_instr_awlen,
  output wire [31:0] o_instr_awaddr,

  // AR Instruction
  input wire i_instr_arready,
  output wire o_instr_arvalid,
  output wire [1:0] o_instr_arburst,
  output wire [2:0] o_instr_arsize,
  output wire [7:0] o_instr_arlen,
  output wire [31:0] o_instr_araddr,

  // W Instruction
  input wire i_instr_wready,
  output wire o_instr_wvalid,
  output wire o_instr_wlast,
  output wire [7:0] o_instr_wstrb,
  output wire [31:0] o_instr_wdata,

  // B Instruction
  input wire i_instr_bvalid,
  input wire [1:0] i_instr_bresp,
  output wire o_instr_bready,

  // R Instruction
  input wire i_instr_rvalid,
  input wire i_instr_rlast,
  input wire [31:0] i_instr_rdata,
  output wire o_instr_rready,

  // AW Data
  input wire i_data_awready,
  output wire o_data_awvalid,
  output wire [1:0] o_data_awburst,
  output wire [2:0] o_data_awsize,
  output wire [7:0] o_data_awlen,
  output wire [31:0] o_data_awaddr,

  // AR Instruction
  input wire i_data_arready,
  output wire o_data_arvalid,
  output wire [1:0] o_data_arburst,
  output wire [2:0] o_data_arsize,
  output wire [7:0] o_data_arlen,
  output wire [31:0] o_data_araddr,

  // W Instruction
  input wire i_data_wready,
  output wire o_data_wvalid,
  output wire o_data_wlast,
  output wire [7:0] o_data_wstrb,
  output wire [31:0] o_data_wdata,

  // B Instruction
  input wire i_data_bvalid,
  input wire [1:0] i_data_bresp,
  output wire o_data_bready,

  // R Instruction
  input wire i_data_rvalid,
  input wire i_data_rlast,
  input wire [31:0] i_data_rdata,
  output wire o_data_rready,

  output wire [31:0] o_unused
);

  assign o_unused = 0;
  // The top level design of the AXI core top
  core_top_intf_wrapper #(
    .PC_BASE_ADDR(PC_BASE_ADDR),
    .INST_CACHE_SIZE(INST_CACHE_SIZE),
    .INST_ASSOCIATIVITY(INST_ASSOCIATIVITY),
    .DATA_CACHE_SIZE(DATA_CACHE_SIZE),
    .DATA_ASSOCIATIVITY(DATA_ASSOCIATIVITY)
  ) core_top_intf_wrapper_inst (
    .i_aclk(i_aclk),
    .i_areset_n(i_areset_n),

    // AW Instruction
    .i_instr_awready(i_instr_awready),
    .o_instr_awvalid(o_instr_awvalid),
    .o_instr_awburst(o_instr_awburst),
    .o_instr_awsize(o_instr_awsize),
    .o_instr_awlen(o_instr_awlen),
    .o_instr_awaddr(o_instr_awaddr),

    // AR Instruction
    .i_instr_arready(i_instr_arready),
    .o_instr_arvalid(o_instr_arvalid),
    .o_instr_arburst(o_instr_arburst),
    .o_instr_arsize(o_instr_arsize),
    .o_instr_arlen(o_instr_arlen),
    .o_instr_araddr(o_instr_araddr),
  
    // W Instruction
    .i_instr_wready(i_instr_wready),
    .o_instr_wvalid(o_instr_wvalid),
    .o_instr_wlast(o_instr_wlast),
    .o_instr_wstrb(o_instr_wstrb),
    .o_instr_wdata(o_instr_wdata),
  
    // B Instruction
    .i_instr_bvalid(i_instr_bvalid),
    .i_instr_bresp(i_instr_bresp),
    .o_instr_bready(o_instr_bready),
  
    // R Instruction
    .i_instr_rvalid(i_instr_rvalid),
    .i_instr_rlast(i_instr_rlast),
    .i_instr_rdata(i_instr_rdata),
    .o_instr_rready(o_instr_rready),
  
    // AW Data
    .i_data_awready(i_data_awready),
    .o_data_awvalid(o_data_awvalid),
    .o_data_awburst(o_data_awburst),
    .o_data_awsize(o_data_awsize),
    .o_data_awlen(o_data_awlen),
    .o_data_awaddr(o_data_awaddr),

    // AR Data
    .i_data_arready(i_data_arready),
    .o_data_arvalid(o_data_arvalid),
    .o_data_arburst(o_data_arburst),
    .o_data_arsize(o_data_arsize),
    .o_data_arlen(o_data_arlen),
    .o_data_araddr(o_data_araddr),
  
    // W Data
    .i_data_wready(i_data_wready),
    .o_data_wvalid(o_data_wvalid),
    .o_data_wlast(o_data_wlast),
    .o_data_wstrb(o_data_wstrb),
    .o_data_wdata(o_data_wdata),
  
    // B Data
    .i_data_bvalid(i_data_bvalid),
    .i_data_bresp(i_data_bresp),
    .o_data_bready(o_data_bready),
  
    // R Data
    .i_data_rvalid(i_data_rvalid),
    .i_data_rlast(i_data_rlast),
    .i_data_rdata(i_data_rdata),
    .o_data_rready(o_data_rready)
  );
endmodule
