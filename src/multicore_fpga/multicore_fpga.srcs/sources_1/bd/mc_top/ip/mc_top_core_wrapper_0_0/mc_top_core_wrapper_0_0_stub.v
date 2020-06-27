// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Fri Jun 26 17:50:50 2020
// Host        : DESKTOP-N84G71E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/9benj/Documents/GitHub/Reconfigurable-RISC-V/src/multicore_fpga/multicore_fpga.srcs/sources_1/bd/mc_top/ip/mc_top_core_wrapper_0_0/mc_top_core_wrapper_0_0_stub.v
// Design      : mc_top_core_wrapper_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "core_wrapper_v1_0,Vivado 2020.1" *)
module mc_top_core_wrapper_0_0(m_instr_awid, m_instr_awaddr, m_instr_awlen, 
  m_instr_awsize, m_instr_awburst, m_instr_awlock, m_instr_awcache, m_instr_awprot, 
  m_instr_awqos, m_instr_awuser, m_instr_awvalid, m_instr_awready, m_instr_wdata, 
  m_instr_wstrb, m_instr_wlast, m_instr_wuser, m_instr_wvalid, m_instr_wready, m_instr_bid, 
  m_instr_bresp, m_instr_buser, m_instr_bvalid, m_instr_bready, m_instr_arid, m_instr_araddr, 
  m_instr_arlen, m_instr_arsize, m_instr_arburst, m_instr_arlock, m_instr_arcache, 
  m_instr_arprot, m_instr_arqos, m_instr_aruser, m_instr_arvalid, m_instr_arready, 
  m_instr_rid, m_instr_rdata, m_instr_rresp, m_instr_rlast, m_instr_ruser, m_instr_rvalid, 
  m_instr_rready, m_instr_aclk, m_instr_aresetn, m_instr_init_axi_txn, m_instr_txn_done, 
  m_instr_error, m_data_awid, m_data_awaddr, m_data_awlen, m_data_awsize, m_data_awburst, 
  m_data_awlock, m_data_awcache, m_data_awprot, m_data_awqos, m_data_awuser, m_data_awvalid, 
  m_data_awready, m_data_wdata, m_data_wstrb, m_data_wlast, m_data_wuser, m_data_wvalid, 
  m_data_wready, m_data_bid, m_data_bresp, m_data_buser, m_data_bvalid, m_data_bready, 
  m_data_arid, m_data_araddr, m_data_arlen, m_data_arsize, m_data_arburst, m_data_arlock, 
  m_data_arcache, m_data_arprot, m_data_arqos, m_data_aruser, m_data_arvalid, m_data_arready, 
  m_data_rid, m_data_rdata, m_data_rresp, m_data_rlast, m_data_ruser, m_data_rvalid, 
  m_data_rready, m_data_aclk, m_data_aresetn, m_data_init_axi_txn, m_data_txn_done, 
  m_data_error)
/* synthesis syn_black_box black_box_pad_pin="m_instr_awid[0:0],m_instr_awaddr[31:0],m_instr_awlen[7:0],m_instr_awsize[2:0],m_instr_awburst[1:0],m_instr_awlock,m_instr_awcache[3:0],m_instr_awprot[2:0],m_instr_awqos[3:0],m_instr_awuser[0:0],m_instr_awvalid,m_instr_awready,m_instr_wdata[31:0],m_instr_wstrb[3:0],m_instr_wlast,m_instr_wuser[0:0],m_instr_wvalid,m_instr_wready,m_instr_bid[0:0],m_instr_bresp[1:0],m_instr_buser[0:0],m_instr_bvalid,m_instr_bready,m_instr_arid[0:0],m_instr_araddr[31:0],m_instr_arlen[7:0],m_instr_arsize[2:0],m_instr_arburst[1:0],m_instr_arlock,m_instr_arcache[3:0],m_instr_arprot[2:0],m_instr_arqos[3:0],m_instr_aruser[0:0],m_instr_arvalid,m_instr_arready,m_instr_rid[0:0],m_instr_rdata[31:0],m_instr_rresp[1:0],m_instr_rlast,m_instr_ruser[0:0],m_instr_rvalid,m_instr_rready,m_instr_aclk,m_instr_aresetn,m_instr_init_axi_txn,m_instr_txn_done,m_instr_error,m_data_awid[0:0],m_data_awaddr[31:0],m_data_awlen[7:0],m_data_awsize[2:0],m_data_awburst[1:0],m_data_awlock,m_data_awcache[3:0],m_data_awprot[2:0],m_data_awqos[3:0],m_data_awuser[0:0],m_data_awvalid,m_data_awready,m_data_wdata[31:0],m_data_wstrb[3:0],m_data_wlast,m_data_wuser[0:0],m_data_wvalid,m_data_wready,m_data_bid[0:0],m_data_bresp[1:0],m_data_buser[0:0],m_data_bvalid,m_data_bready,m_data_arid[0:0],m_data_araddr[31:0],m_data_arlen[7:0],m_data_arsize[2:0],m_data_arburst[1:0],m_data_arlock,m_data_arcache[3:0],m_data_arprot[2:0],m_data_arqos[3:0],m_data_aruser[0:0],m_data_arvalid,m_data_arready,m_data_rid[0:0],m_data_rdata[31:0],m_data_rresp[1:0],m_data_rlast,m_data_ruser[0:0],m_data_rvalid,m_data_rready,m_data_aclk,m_data_aresetn,m_data_init_axi_txn,m_data_txn_done,m_data_error" */;
  output [0:0]m_instr_awid;
  output [31:0]m_instr_awaddr;
  output [7:0]m_instr_awlen;
  output [2:0]m_instr_awsize;
  output [1:0]m_instr_awburst;
  output m_instr_awlock;
  output [3:0]m_instr_awcache;
  output [2:0]m_instr_awprot;
  output [3:0]m_instr_awqos;
  output [0:0]m_instr_awuser;
  output m_instr_awvalid;
  input m_instr_awready;
  output [31:0]m_instr_wdata;
  output [3:0]m_instr_wstrb;
  output m_instr_wlast;
  output [0:0]m_instr_wuser;
  output m_instr_wvalid;
  input m_instr_wready;
  input [0:0]m_instr_bid;
  input [1:0]m_instr_bresp;
  input [0:0]m_instr_buser;
  input m_instr_bvalid;
  output m_instr_bready;
  output [0:0]m_instr_arid;
  output [31:0]m_instr_araddr;
  output [7:0]m_instr_arlen;
  output [2:0]m_instr_arsize;
  output [1:0]m_instr_arburst;
  output m_instr_arlock;
  output [3:0]m_instr_arcache;
  output [2:0]m_instr_arprot;
  output [3:0]m_instr_arqos;
  output [0:0]m_instr_aruser;
  output m_instr_arvalid;
  input m_instr_arready;
  input [0:0]m_instr_rid;
  input [31:0]m_instr_rdata;
  input [1:0]m_instr_rresp;
  input m_instr_rlast;
  input [0:0]m_instr_ruser;
  input m_instr_rvalid;
  output m_instr_rready;
  input m_instr_aclk;
  input m_instr_aresetn;
  input m_instr_init_axi_txn;
  output m_instr_txn_done;
  output m_instr_error;
  output [0:0]m_data_awid;
  output [31:0]m_data_awaddr;
  output [7:0]m_data_awlen;
  output [2:0]m_data_awsize;
  output [1:0]m_data_awburst;
  output m_data_awlock;
  output [3:0]m_data_awcache;
  output [2:0]m_data_awprot;
  output [3:0]m_data_awqos;
  output [0:0]m_data_awuser;
  output m_data_awvalid;
  input m_data_awready;
  output [31:0]m_data_wdata;
  output [3:0]m_data_wstrb;
  output m_data_wlast;
  output [0:0]m_data_wuser;
  output m_data_wvalid;
  input m_data_wready;
  input [0:0]m_data_bid;
  input [1:0]m_data_bresp;
  input [0:0]m_data_buser;
  input m_data_bvalid;
  output m_data_bready;
  output [0:0]m_data_arid;
  output [31:0]m_data_araddr;
  output [7:0]m_data_arlen;
  output [2:0]m_data_arsize;
  output [1:0]m_data_arburst;
  output m_data_arlock;
  output [3:0]m_data_arcache;
  output [2:0]m_data_arprot;
  output [3:0]m_data_arqos;
  output [0:0]m_data_aruser;
  output m_data_arvalid;
  input m_data_arready;
  input [0:0]m_data_rid;
  input [31:0]m_data_rdata;
  input [1:0]m_data_rresp;
  input m_data_rlast;
  input [0:0]m_data_ruser;
  input m_data_rvalid;
  output m_data_rready;
  input m_data_aclk;
  input m_data_aresetn;
  input m_data_init_axi_txn;
  output m_data_txn_done;
  output m_data_error;
endmodule
