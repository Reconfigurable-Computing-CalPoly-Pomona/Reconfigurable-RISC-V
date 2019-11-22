// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Nov 21 21:11:44 2019
// Host        : Drew running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/Benjamin/Documents/Word-documents/CPP/RISC-V-Multicore/src/multicore_fpga/multicore_fpga.srcs/sources_1/bd/mc_top/ip/mc_top_core_top_wrapper_0_0/mc_top_core_top_wrapper_0_0_stub.v
// Design      : mc_top_core_top_wrapper_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "core_top_wrapper,Vivado 2018.3" *)
module mc_top_core_top_wrapper_0_0(i_aclk, i_areset_n, i_instr_awready, 
  o_instr_awvalid, o_instr_awburst, o_instr_awsize, o_instr_awlen, o_instr_awaddr, 
  i_instr_arready, o_instr_arvalid, o_instr_arburst, o_instr_arsize, o_instr_arlen, 
  o_instr_araddr, i_instr_wready, o_instr_wvalid, o_instr_wlast, o_instr_wstrb, 
  o_instr_wdata, i_instr_bvalid, i_instr_bresp, o_instr_bready, i_instr_rvalid, 
  i_instr_rlast, i_instr_rdata, o_instr_rready, i_data_awready, o_data_awvalid, 
  o_data_awburst, o_data_awsize, o_data_awlen, o_data_awaddr, i_data_arready, o_data_arvalid, 
  o_data_arburst, o_data_arsize, o_data_arlen, o_data_araddr, i_data_wready, o_data_wvalid, 
  o_data_wlast, o_data_wstrb, o_data_wdata, i_data_bvalid, i_data_bresp, o_data_bready, 
  i_data_rvalid, i_data_rlast, i_data_rdata, o_data_rready, o_unused)
/* synthesis syn_black_box black_box_pad_pin="i_aclk,i_areset_n,i_instr_awready,o_instr_awvalid,o_instr_awburst[1:0],o_instr_awsize[2:0],o_instr_awlen[7:0],o_instr_awaddr[31:0],i_instr_arready,o_instr_arvalid,o_instr_arburst[1:0],o_instr_arsize[2:0],o_instr_arlen[7:0],o_instr_araddr[31:0],i_instr_wready,o_instr_wvalid,o_instr_wlast,o_instr_wstrb[7:0],o_instr_wdata[31:0],i_instr_bvalid,i_instr_bresp[1:0],o_instr_bready,i_instr_rvalid,i_instr_rlast,i_instr_rdata[31:0],o_instr_rready,i_data_awready,o_data_awvalid,o_data_awburst[1:0],o_data_awsize[2:0],o_data_awlen[7:0],o_data_awaddr[31:0],i_data_arready,o_data_arvalid,o_data_arburst[1:0],o_data_arsize[2:0],o_data_arlen[7:0],o_data_araddr[31:0],i_data_wready,o_data_wvalid,o_data_wlast,o_data_wstrb[7:0],o_data_wdata[31:0],i_data_bvalid,i_data_bresp[1:0],o_data_bready,i_data_rvalid,i_data_rlast,i_data_rdata[31:0],o_data_rready,o_unused[31:0]" */;
  input i_aclk;
  input i_areset_n;
  input i_instr_awready;
  output o_instr_awvalid;
  output [1:0]o_instr_awburst;
  output [2:0]o_instr_awsize;
  output [7:0]o_instr_awlen;
  output [31:0]o_instr_awaddr;
  input i_instr_arready;
  output o_instr_arvalid;
  output [1:0]o_instr_arburst;
  output [2:0]o_instr_arsize;
  output [7:0]o_instr_arlen;
  output [31:0]o_instr_araddr;
  input i_instr_wready;
  output o_instr_wvalid;
  output o_instr_wlast;
  output [7:0]o_instr_wstrb;
  output [31:0]o_instr_wdata;
  input i_instr_bvalid;
  input [1:0]i_instr_bresp;
  output o_instr_bready;
  input i_instr_rvalid;
  input i_instr_rlast;
  input [31:0]i_instr_rdata;
  output o_instr_rready;
  input i_data_awready;
  output o_data_awvalid;
  output [1:0]o_data_awburst;
  output [2:0]o_data_awsize;
  output [7:0]o_data_awlen;
  output [31:0]o_data_awaddr;
  input i_data_arready;
  output o_data_arvalid;
  output [1:0]o_data_arburst;
  output [2:0]o_data_arsize;
  output [7:0]o_data_arlen;
  output [31:0]o_data_araddr;
  input i_data_wready;
  output o_data_wvalid;
  output o_data_wlast;
  output [7:0]o_data_wstrb;
  output [31:0]o_data_wdata;
  input i_data_bvalid;
  input [1:0]i_data_bresp;
  output o_data_bready;
  input i_data_rvalid;
  input i_data_rlast;
  input [31:0]i_data_rdata;
  output o_data_rready;
  output [31:0]o_unused;
endmodule
