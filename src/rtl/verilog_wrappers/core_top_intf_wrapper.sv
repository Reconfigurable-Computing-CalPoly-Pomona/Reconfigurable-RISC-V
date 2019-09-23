`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 07/20/2019 10:53:09 AM
// Design Name: 
// Module Name: core_top_intf_wrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:
// Converts interface based core processor into discrete signals for compatibility with other languages
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

module core_top_intf_wrapper #(
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
  input logic i_aclk,
  input logic i_areset_n,

  // AW Instruction
  input logic i_instr_awready,
  output logic o_instr_awvalid,
  output logic [1:0] o_instr_awburst,
  output logic [2:0] o_instr_awsize,
  output logic [7:0] o_instr_awlen,
  output logic [31:0] o_instr_awaddr,

  // AR Instruction
  input logic i_instr_arready,
  output logic o_instr_arvalid,
  output logic [1:0] o_instr_arburst,
  output logic [2:0] o_instr_arsize,
  output logic [7:0] o_instr_arlen,
  output logic [31:0] o_instr_araddr,

  // W Instruction
  input logic i_instr_wready,
  output logic o_instr_wvalid,
  output logic o_instr_wlast,
  output logic [7:0] o_instr_wstrb,
  output logic [31:0] o_instr_wdata,

  // B Instruction
  input logic i_instr_bvalid,
  input logic [1:0] i_instr_bresp,
  output logic o_instr_bready,

  // R Instruction
  input logic i_instr_rvalid,
  input logic i_instr_rlast,
  input logic [31:0] i_instr_rdata,
  output logic o_instr_rready,

  // AW Data
  input logic i_data_awready,
  output logic o_data_awvalid,
  output logic [1:0] o_data_awburst,
  output logic [2:0] o_data_awsize,
  output logic [7:0] o_data_awlen,
  output logic [31:0] o_data_awaddr,

  // AR Data
  input logic i_data_arready,
  output logic o_data_arvalid,
  output logic [1:0] o_data_arburst,
  output logic [2:0] o_data_arsize,
  output logic [7:0] o_data_arlen,
  output logic [31:0] o_data_araddr,

  // W Data
  input logic i_data_wready,
  output logic o_data_wvalid,
  output logic o_data_wlast,
  output logic [7:0] o_data_wstrb,
  output logic [31:0] o_data_wdata,

  // B Data
  input logic i_data_bvalid,
  input logic [1:0] i_data_bresp,
  output logic o_data_bready,

  // R Data
  input logic i_data_rvalid,
  input logic i_data_rlast,
  input logic [31:0] i_data_rdata,
  output logic o_data_rready
);

  // AXI Master from the instruction cache contorller
  axi_inf axi_instr();

  // AXI Master from the data cache controller
  axi_inf axi_data();

  // The top level design of the AXI core top
  core_top #(
    .PC_BASE_ADDR(PC_BASE_ADDR),
    .INST_CACHE_SIZE(INST_CACHE_SIZE),
    .INST_ASSOCIATIVITY(INST_ASSOCIATIVITY),
    .DATA_CACHE_SIZE(DATA_CACHE_SIZE),
    .DATA_ASSOCIATIVITY(DATA_ASSOCIATIVITY)
  ) core_top_inst (
    .i_aclk(i_aclk),
    .i_areset_n(i_areset_n),

    .axi_instr(axi_instr),
    .axi_data(axi_data)
  );

  // AW Instruction  
  assign axi_instr.awready = i_instr_awready;
  assign o_instr_awvalid = axi_instr.aw.valid;
  assign o_instr_awburst = axi_instr.aw.burst;
  assign o_instr_awsize = axi_instr.aw.size;
  assign o_instr_awlen = axi_instr.aw.len;
  assign o_instr_awaddr = axi_instr.aw.addr;

  // AR Instruction
  assign axi_instr.arready = i_instr_arready;
  assign o_instr_arvalid = axi_instr.ar.valid;
  assign o_instr_arburst = axi_instr.ar.burst;
  assign o_instr_arsize = axi_instr.ar.size;
  assign o_instr_arlen = axi_instr.ar.len;
  assign o_instr_araddr = axi_instr.ar.addr;

  // W Instruction
  assign axi_instr.wready = i_instr_wready;
  assign o_instr_wvalid = axi_instr.w.valid;
  assign o_instr_wlast = axi_instr.w.last;
  assign o_instr_wstrb = axi_instr.w.strb;
  assign o_instr_wdata = axi_instr.w.data;

  // B Instruction
  assign axi_instr.b.valid = i_instr_bvalid;
  assign o_instr_bready = axi_instr.bready;

  // R Instruction
  assign axi_instr.r.valid = i_instr_rvalid;
  assign axi_instr.r.last = i_instr_rlast;
  assign axi_instr.r.data = i_instr_rdata;
  assign o_instr_rready = axi_instr.rready;

  // AW Instruction  
  assign axi_data.awready = i_data_awready;
  assign o_data_awvalid = axi_data.aw.valid;
  assign o_data_awburst = axi_data.aw.burst;
  assign o_data_awsize = axi_data.aw.size;
  assign o_data_awlen = axi_data.aw.len;
  assign o_data_awaddr = axi_data.aw.addr;

  // AR Data
  assign axi_data.arready = i_data_arready;
  assign o_data_arvalid = axi_data.ar.valid;
  assign o_data_arburst = axi_data.ar.burst;
  assign o_data_arsize = axi_data.ar.size;
  assign o_data_arlen = axi_data.ar.len;
  assign o_data_araddr = axi_data.ar.addr;

  // W Data
  assign axi_data.wready = i_data_wready;
  assign o_data_wvalid = axi_data.w.valid;
  assign o_data_wlast = axi_data.w.last;
  assign o_data_wstrb = axi_data.w.strb;
  assign o_data_wdata = axi_data.w.data;

  // B Data
  assign axi_data.b.valid = i_data_bvalid;
  assign o_data_bready = axi_data.bready;

  // R Data
  assign axi_data.r.valid = i_data_rvalid;
  assign axi_data.r.last = i_data_rlast;
  assign axi_data.r.data = i_data_rdata;
  assign o_data_rready = axi_data.rready;


  // Assign enumerated type for the write response (Data)
  always_comb begin : data_resp_conv
    unique case(i_data_bresp)
      0: axi_data.b.resp = OKAY;
      1: axi_data.b.resp = EXOKAY;
      2: axi_data.b.resp = SLVERR;
      default: axi_data.b.resp = DECERR;
    endcase
  end

  // Assign enumerated type for the write response (Instruction)
  always_comb begin : instr_resp_conv
    unique case(i_instr_bresp)
      0: axi_instr.b.resp = OKAY;
      1: axi_instr.b.resp = EXOKAY;
      2: axi_instr.b.resp = SLVERR;
      default: axi_instr.b.resp = DECERR;
    endcase
  end

endmodule
