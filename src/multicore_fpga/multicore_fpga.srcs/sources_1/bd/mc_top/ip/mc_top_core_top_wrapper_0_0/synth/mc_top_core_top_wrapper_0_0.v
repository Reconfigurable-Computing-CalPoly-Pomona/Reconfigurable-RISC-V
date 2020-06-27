// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:core_top_wrapper:1.0
// IP Revision: 1

(* X_CORE_INFO = "core_top_wrapper,Vivado 2020.1" *)
(* CHECK_LICENSE_TYPE = "mc_top_core_top_wrapper_0_0,core_top_wrapper,{}" *)
(* CORE_GENERATION_INFO = "mc_top_core_top_wrapper_0_0,core_top_wrapper,{x_ipProduct=Vivado 2020.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=core_top_wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,PC_BASE_ADDR=0,INST_CACHE_SIZE=16384,INST_ASSOCIATIVITY=2,DATA_CACHE_SIZE=16384,DATA_ASSOCIATIVITY=2}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module mc_top_core_top_wrapper_0_0 (
  i_aclk,
  i_areset_n,
  i_instr_awready,
  o_instr_awvalid,
  o_instr_awburst,
  o_instr_awsize,
  o_instr_awlen,
  o_instr_awaddr,
  i_instr_arready,
  o_instr_arvalid,
  o_instr_arburst,
  o_instr_arsize,
  o_instr_arlen,
  o_instr_araddr,
  i_instr_wready,
  o_instr_wvalid,
  o_instr_wlast,
  o_instr_wstrb,
  o_instr_wdata,
  i_instr_bvalid,
  i_instr_bresp,
  o_instr_bready,
  i_instr_rvalid,
  i_instr_rlast,
  i_instr_rdata,
  o_instr_rready,
  i_data_awready,
  o_data_awvalid,
  o_data_awburst,
  o_data_awsize,
  o_data_awlen,
  o_data_awaddr,
  i_data_arready,
  o_data_arvalid,
  o_data_arburst,
  o_data_arsize,
  o_data_arlen,
  o_data_araddr,
  i_data_wready,
  o_data_wvalid,
  o_data_wlast,
  o_data_wstrb,
  o_data_wdata,
  i_data_bvalid,
  i_data_bresp,
  o_data_bready,
  i_data_rvalid,
  i_data_rlast,
  i_data_rdata,
  o_data_rready,
  o_unused
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_aclk, FREQ_HZ 75000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_aclk CLK" *)
input wire i_aclk;
input wire i_areset_n;
input wire i_instr_awready;
output wire o_instr_awvalid;
output wire [1 : 0] o_instr_awburst;
output wire [2 : 0] o_instr_awsize;
output wire [7 : 0] o_instr_awlen;
output wire [31 : 0] o_instr_awaddr;
input wire i_instr_arready;
output wire o_instr_arvalid;
output wire [1 : 0] o_instr_arburst;
output wire [2 : 0] o_instr_arsize;
output wire [7 : 0] o_instr_arlen;
output wire [31 : 0] o_instr_araddr;
input wire i_instr_wready;
output wire o_instr_wvalid;
output wire o_instr_wlast;
output wire [7 : 0] o_instr_wstrb;
output wire [31 : 0] o_instr_wdata;
input wire i_instr_bvalid;
input wire [1 : 0] i_instr_bresp;
output wire o_instr_bready;
input wire i_instr_rvalid;
input wire i_instr_rlast;
input wire [31 : 0] i_instr_rdata;
output wire o_instr_rready;
input wire i_data_awready;
output wire o_data_awvalid;
output wire [1 : 0] o_data_awburst;
output wire [2 : 0] o_data_awsize;
output wire [7 : 0] o_data_awlen;
output wire [31 : 0] o_data_awaddr;
input wire i_data_arready;
output wire o_data_arvalid;
output wire [1 : 0] o_data_arburst;
output wire [2 : 0] o_data_arsize;
output wire [7 : 0] o_data_arlen;
output wire [31 : 0] o_data_araddr;
input wire i_data_wready;
output wire o_data_wvalid;
output wire o_data_wlast;
output wire [7 : 0] o_data_wstrb;
output wire [31 : 0] o_data_wdata;
input wire i_data_bvalid;
input wire [1 : 0] i_data_bresp;
output wire o_data_bready;
input wire i_data_rvalid;
input wire i_data_rlast;
input wire [31 : 0] i_data_rdata;
output wire o_data_rready;
output wire [31 : 0] o_unused;

  core_top_wrapper #(
    .PC_BASE_ADDR(0),
    .INST_CACHE_SIZE(16384),
    .INST_ASSOCIATIVITY(2),
    .DATA_CACHE_SIZE(16384),
    .DATA_ASSOCIATIVITY(2)
  ) inst (
    .i_aclk(i_aclk),
    .i_areset_n(i_areset_n),
    .i_instr_awready(i_instr_awready),
    .o_instr_awvalid(o_instr_awvalid),
    .o_instr_awburst(o_instr_awburst),
    .o_instr_awsize(o_instr_awsize),
    .o_instr_awlen(o_instr_awlen),
    .o_instr_awaddr(o_instr_awaddr),
    .i_instr_arready(i_instr_arready),
    .o_instr_arvalid(o_instr_arvalid),
    .o_instr_arburst(o_instr_arburst),
    .o_instr_arsize(o_instr_arsize),
    .o_instr_arlen(o_instr_arlen),
    .o_instr_araddr(o_instr_araddr),
    .i_instr_wready(i_instr_wready),
    .o_instr_wvalid(o_instr_wvalid),
    .o_instr_wlast(o_instr_wlast),
    .o_instr_wstrb(o_instr_wstrb),
    .o_instr_wdata(o_instr_wdata),
    .i_instr_bvalid(i_instr_bvalid),
    .i_instr_bresp(i_instr_bresp),
    .o_instr_bready(o_instr_bready),
    .i_instr_rvalid(i_instr_rvalid),
    .i_instr_rlast(i_instr_rlast),
    .i_instr_rdata(i_instr_rdata),
    .o_instr_rready(o_instr_rready),
    .i_data_awready(i_data_awready),
    .o_data_awvalid(o_data_awvalid),
    .o_data_awburst(o_data_awburst),
    .o_data_awsize(o_data_awsize),
    .o_data_awlen(o_data_awlen),
    .o_data_awaddr(o_data_awaddr),
    .i_data_arready(i_data_arready),
    .o_data_arvalid(o_data_arvalid),
    .o_data_arburst(o_data_arburst),
    .o_data_arsize(o_data_arsize),
    .o_data_arlen(o_data_arlen),
    .o_data_araddr(o_data_araddr),
    .i_data_wready(i_data_wready),
    .o_data_wvalid(o_data_wvalid),
    .o_data_wlast(o_data_wlast),
    .o_data_wstrb(o_data_wstrb),
    .o_data_wdata(o_data_wdata),
    .i_data_bvalid(i_data_bvalid),
    .i_data_bresp(i_data_bresp),
    .o_data_bready(o_data_bready),
    .i_data_rvalid(i_data_rvalid),
    .i_data_rlast(i_data_rlast),
    .i_data_rdata(i_data_rdata),
    .o_data_rready(o_data_rready),
    .o_unused(o_unused)
  );
endmodule
