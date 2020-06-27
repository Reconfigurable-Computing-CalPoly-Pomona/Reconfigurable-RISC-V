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


// IP VLNV: xilinx.com:user:core_wrapper:1.0
// IP Revision: 1

(* X_CORE_INFO = "core_wrapper_v1_0,Vivado 2020.1" *)
(* CHECK_LICENSE_TYPE = "mc_top_core_wrapper_0_0,core_wrapper_v1_0,{}" *)
(* CORE_GENERATION_INFO = "mc_top_core_wrapper_0_0,core_wrapper_v1_0,{x_ipProduct=Vivado 2020.1,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=core_wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_m_instr_TARGET_SLAVE_BASE_ADDR=0x40000000,C_m_instr_BURST_LEN=16,C_m_instr_ID_WIDTH=1,C_m_instr_ADDR_WIDTH=32,C_m_instr_DATA_WIDTH=32,C_m_instr_AWUSER_WIDTH=1,C_m_instr_ARUSER_WIDTH=1,C_m_instr_WUSER_WIDTH=1,C_m_instr_RUSER_WIDTH=1,C_m_instr_BUSER_WIDTH=1,C_m_data_TARGET_SLAVE_BASE_ADDR=0x\
40000000,C_m_data_BURST_LEN=16,C_m_data_ID_WIDTH=1,C_m_data_ADDR_WIDTH=32,C_m_data_DATA_WIDTH=32,C_m_data_AWUSER_WIDTH=1,C_m_data_ARUSER_WIDTH=1,C_m_data_WUSER_WIDTH=1,C_m_data_RUSER_WIDTH=1,C_m_data_BUSER_WIDTH=1}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module mc_top_core_wrapper_0_0 (
  m_instr_awid,
  m_instr_awaddr,
  m_instr_awlen,
  m_instr_awsize,
  m_instr_awburst,
  m_instr_awlock,
  m_instr_awcache,
  m_instr_awprot,
  m_instr_awqos,
  m_instr_awuser,
  m_instr_awvalid,
  m_instr_awready,
  m_instr_wdata,
  m_instr_wstrb,
  m_instr_wlast,
  m_instr_wuser,
  m_instr_wvalid,
  m_instr_wready,
  m_instr_bid,
  m_instr_bresp,
  m_instr_buser,
  m_instr_bvalid,
  m_instr_bready,
  m_instr_arid,
  m_instr_araddr,
  m_instr_arlen,
  m_instr_arsize,
  m_instr_arburst,
  m_instr_arlock,
  m_instr_arcache,
  m_instr_arprot,
  m_instr_arqos,
  m_instr_aruser,
  m_instr_arvalid,
  m_instr_arready,
  m_instr_rid,
  m_instr_rdata,
  m_instr_rresp,
  m_instr_rlast,
  m_instr_ruser,
  m_instr_rvalid,
  m_instr_rready,
  m_instr_aclk,
  m_instr_aresetn,
  m_instr_init_axi_txn,
  m_instr_txn_done,
  m_instr_error,
  m_data_awid,
  m_data_awaddr,
  m_data_awlen,
  m_data_awsize,
  m_data_awburst,
  m_data_awlock,
  m_data_awcache,
  m_data_awprot,
  m_data_awqos,
  m_data_awuser,
  m_data_awvalid,
  m_data_awready,
  m_data_wdata,
  m_data_wstrb,
  m_data_wlast,
  m_data_wuser,
  m_data_wvalid,
  m_data_wready,
  m_data_bid,
  m_data_bresp,
  m_data_buser,
  m_data_bvalid,
  m_data_bready,
  m_data_arid,
  m_data_araddr,
  m_data_arlen,
  m_data_arsize,
  m_data_arburst,
  m_data_arlock,
  m_data_arcache,
  m_data_arprot,
  m_data_arqos,
  m_data_aruser,
  m_data_arvalid,
  m_data_arready,
  m_data_rid,
  m_data_rdata,
  m_data_rresp,
  m_data_rlast,
  m_data_ruser,
  m_data_rvalid,
  m_data_rready,
  m_data_aclk,
  m_data_aresetn,
  m_data_init_axi_txn,
  m_data_txn_done,
  m_data_error
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWID" *)
output wire [0 : 0] m_instr_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWADDR" *)
output wire [31 : 0] m_instr_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWLEN" *)
output wire [7 : 0] m_instr_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWSIZE" *)
output wire [2 : 0] m_instr_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWBURST" *)
output wire [1 : 0] m_instr_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWLOCK" *)
output wire m_instr_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWCACHE" *)
output wire [3 : 0] m_instr_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWPROT" *)
output wire [2 : 0] m_instr_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWQOS" *)
output wire [3 : 0] m_instr_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWUSER" *)
output wire [0 : 0] m_instr_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWVALID" *)
output wire m_instr_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWREADY" *)
input wire m_instr_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr WDATA" *)
output wire [31 : 0] m_instr_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr WSTRB" *)
output wire [3 : 0] m_instr_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr WLAST" *)
output wire m_instr_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr WUSER" *)
output wire [0 : 0] m_instr_wuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr WVALID" *)
output wire m_instr_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr WREADY" *)
input wire m_instr_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr BID" *)
input wire [0 : 0] m_instr_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr BRESP" *)
input wire [1 : 0] m_instr_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr BUSER" *)
input wire [0 : 0] m_instr_buser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr BVALID" *)
input wire m_instr_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr BREADY" *)
output wire m_instr_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARID" *)
output wire [0 : 0] m_instr_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARADDR" *)
output wire [31 : 0] m_instr_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARLEN" *)
output wire [7 : 0] m_instr_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARSIZE" *)
output wire [2 : 0] m_instr_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARBURST" *)
output wire [1 : 0] m_instr_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARLOCK" *)
output wire m_instr_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARCACHE" *)
output wire [3 : 0] m_instr_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARPROT" *)
output wire [2 : 0] m_instr_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARQOS" *)
output wire [3 : 0] m_instr_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARUSER" *)
output wire [0 : 0] m_instr_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARVALID" *)
output wire m_instr_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARREADY" *)
input wire m_instr_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr RID" *)
input wire [0 : 0] m_instr_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr RDATA" *)
input wire [31 : 0] m_instr_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr RRESP" *)
input wire [1 : 0] m_instr_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr RLAST" *)
input wire m_instr_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr RUSER" *)
input wire [0 : 0] m_instr_ruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr RVALID" *)
input wire m_instr_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_instr, WIZ_DATA_WIDTH 32, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 75000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM\
_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr RREADY" *)
output wire m_instr_rready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_instr_CLK, ASSOCIATED_BUSIF m_instr, ASSOCIATED_RESET m_instr_aresetn, FREQ_HZ 75000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_instr_CLK CLK" *)
input wire m_instr_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_instr_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m_instr_RST RST" *)
input wire m_instr_aresetn;
input wire m_instr_init_axi_txn;
output wire m_instr_txn_done;
output wire m_instr_error;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWID" *)
output wire [0 : 0] m_data_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWADDR" *)
output wire [31 : 0] m_data_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWLEN" *)
output wire [7 : 0] m_data_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWSIZE" *)
output wire [2 : 0] m_data_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWBURST" *)
output wire [1 : 0] m_data_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWLOCK" *)
output wire m_data_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWCACHE" *)
output wire [3 : 0] m_data_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWPROT" *)
output wire [2 : 0] m_data_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWQOS" *)
output wire [3 : 0] m_data_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWUSER" *)
output wire [0 : 0] m_data_awuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWVALID" *)
output wire m_data_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWREADY" *)
input wire m_data_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data WDATA" *)
output wire [31 : 0] m_data_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data WSTRB" *)
output wire [3 : 0] m_data_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data WLAST" *)
output wire m_data_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data WUSER" *)
output wire [0 : 0] m_data_wuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data WVALID" *)
output wire m_data_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data WREADY" *)
input wire m_data_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data BID" *)
input wire [0 : 0] m_data_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data BRESP" *)
input wire [1 : 0] m_data_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data BUSER" *)
input wire [0 : 0] m_data_buser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data BVALID" *)
input wire m_data_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data BREADY" *)
output wire m_data_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARID" *)
output wire [0 : 0] m_data_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARADDR" *)
output wire [31 : 0] m_data_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARLEN" *)
output wire [7 : 0] m_data_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARSIZE" *)
output wire [2 : 0] m_data_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARBURST" *)
output wire [1 : 0] m_data_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARLOCK" *)
output wire m_data_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARCACHE" *)
output wire [3 : 0] m_data_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARPROT" *)
output wire [2 : 0] m_data_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARQOS" *)
output wire [3 : 0] m_data_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARUSER" *)
output wire [0 : 0] m_data_aruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARVALID" *)
output wire m_data_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARREADY" *)
input wire m_data_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data RID" *)
input wire [0 : 0] m_data_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data RDATA" *)
input wire [31 : 0] m_data_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data RRESP" *)
input wire [1 : 0] m_data_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data RLAST" *)
input wire m_data_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data RUSER" *)
input wire [0 : 0] m_data_ruser;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data RVALID" *)
input wire m_data_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_data, WIZ_DATA_WIDTH 32, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 75000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_\
WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data RREADY" *)
output wire m_data_rready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_data_CLK, ASSOCIATED_BUSIF m_data, ASSOCIATED_RESET m_data_aresetn, FREQ_HZ 75000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_data_CLK CLK" *)
input wire m_data_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_data_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m_data_RST RST" *)
input wire m_data_aresetn;
input wire m_data_init_axi_txn;
output wire m_data_txn_done;
output wire m_data_error;

  core_wrapper_v1_0 #(
    .C_m_instr_TARGET_SLAVE_BASE_ADDR('H40000000),  // Base address of targeted slave
    .C_m_instr_BURST_LEN(16),  // Burst Length. Supports 1, 2, 4, 8, 16, 32, 64, 128, 256 burst lengths
    .C_m_instr_ID_WIDTH(1),  // Thread ID Width
    .C_m_instr_ADDR_WIDTH(32),  // Width of Address Bus
    .C_m_instr_DATA_WIDTH(32),  // Width of Data Bus
    .C_m_instr_AWUSER_WIDTH(1),  // Width of User Write Address Bus
    .C_m_instr_ARUSER_WIDTH(1),  // Width of User Read Address Bus
    .C_m_instr_WUSER_WIDTH(1),  // Width of User Write Data Bus
    .C_m_instr_RUSER_WIDTH(1),  // Width of User Read Data Bus
    .C_m_instr_BUSER_WIDTH(1),  // Width of User Response Bus
    .C_m_data_TARGET_SLAVE_BASE_ADDR('H40000000),  // Base address of targeted slave
    .C_m_data_BURST_LEN(16),  // Burst Length. Supports 1, 2, 4, 8, 16, 32, 64, 128, 256 burst lengths
    .C_m_data_ID_WIDTH(1),  // Thread ID Width
    .C_m_data_ADDR_WIDTH(32),  // Width of Address Bus
    .C_m_data_DATA_WIDTH(32),  // Width of Data Bus
    .C_m_data_AWUSER_WIDTH(1),  // Width of User Write Address Bus
    .C_m_data_ARUSER_WIDTH(1),  // Width of User Read Address Bus
    .C_m_data_WUSER_WIDTH(1),  // Width of User Write Data Bus
    .C_m_data_RUSER_WIDTH(1),  // Width of User Read Data Bus
    .C_m_data_BUSER_WIDTH(1)  // Width of User Response Bus
  ) inst (
    .m_instr_awid(m_instr_awid),
    .m_instr_awaddr(m_instr_awaddr),
    .m_instr_awlen(m_instr_awlen),
    .m_instr_awsize(m_instr_awsize),
    .m_instr_awburst(m_instr_awburst),
    .m_instr_awlock(m_instr_awlock),
    .m_instr_awcache(m_instr_awcache),
    .m_instr_awprot(m_instr_awprot),
    .m_instr_awqos(m_instr_awqos),
    .m_instr_awuser(m_instr_awuser),
    .m_instr_awvalid(m_instr_awvalid),
    .m_instr_awready(m_instr_awready),
    .m_instr_wdata(m_instr_wdata),
    .m_instr_wstrb(m_instr_wstrb),
    .m_instr_wlast(m_instr_wlast),
    .m_instr_wuser(m_instr_wuser),
    .m_instr_wvalid(m_instr_wvalid),
    .m_instr_wready(m_instr_wready),
    .m_instr_bid(m_instr_bid),
    .m_instr_bresp(m_instr_bresp),
    .m_instr_buser(m_instr_buser),
    .m_instr_bvalid(m_instr_bvalid),
    .m_instr_bready(m_instr_bready),
    .m_instr_arid(m_instr_arid),
    .m_instr_araddr(m_instr_araddr),
    .m_instr_arlen(m_instr_arlen),
    .m_instr_arsize(m_instr_arsize),
    .m_instr_arburst(m_instr_arburst),
    .m_instr_arlock(m_instr_arlock),
    .m_instr_arcache(m_instr_arcache),
    .m_instr_arprot(m_instr_arprot),
    .m_instr_arqos(m_instr_arqos),
    .m_instr_aruser(m_instr_aruser),
    .m_instr_arvalid(m_instr_arvalid),
    .m_instr_arready(m_instr_arready),
    .m_instr_rid(m_instr_rid),
    .m_instr_rdata(m_instr_rdata),
    .m_instr_rresp(m_instr_rresp),
    .m_instr_rlast(m_instr_rlast),
    .m_instr_ruser(m_instr_ruser),
    .m_instr_rvalid(m_instr_rvalid),
    .m_instr_rready(m_instr_rready),
    .m_instr_aclk(m_instr_aclk),
    .m_instr_aresetn(m_instr_aresetn),
    .m_instr_init_axi_txn(m_instr_init_axi_txn),
    .m_instr_txn_done(m_instr_txn_done),
    .m_instr_error(m_instr_error),
    .m_data_awid(m_data_awid),
    .m_data_awaddr(m_data_awaddr),
    .m_data_awlen(m_data_awlen),
    .m_data_awsize(m_data_awsize),
    .m_data_awburst(m_data_awburst),
    .m_data_awlock(m_data_awlock),
    .m_data_awcache(m_data_awcache),
    .m_data_awprot(m_data_awprot),
    .m_data_awqos(m_data_awqos),
    .m_data_awuser(m_data_awuser),
    .m_data_awvalid(m_data_awvalid),
    .m_data_awready(m_data_awready),
    .m_data_wdata(m_data_wdata),
    .m_data_wstrb(m_data_wstrb),
    .m_data_wlast(m_data_wlast),
    .m_data_wuser(m_data_wuser),
    .m_data_wvalid(m_data_wvalid),
    .m_data_wready(m_data_wready),
    .m_data_bid(m_data_bid),
    .m_data_bresp(m_data_bresp),
    .m_data_buser(m_data_buser),
    .m_data_bvalid(m_data_bvalid),
    .m_data_bready(m_data_bready),
    .m_data_arid(m_data_arid),
    .m_data_araddr(m_data_araddr),
    .m_data_arlen(m_data_arlen),
    .m_data_arsize(m_data_arsize),
    .m_data_arburst(m_data_arburst),
    .m_data_arlock(m_data_arlock),
    .m_data_arcache(m_data_arcache),
    .m_data_arprot(m_data_arprot),
    .m_data_arqos(m_data_arqos),
    .m_data_aruser(m_data_aruser),
    .m_data_arvalid(m_data_arvalid),
    .m_data_arready(m_data_arready),
    .m_data_rid(m_data_rid),
    .m_data_rdata(m_data_rdata),
    .m_data_rresp(m_data_rresp),
    .m_data_rlast(m_data_rlast),
    .m_data_ruser(m_data_ruser),
    .m_data_rvalid(m_data_rvalid),
    .m_data_rready(m_data_rready),
    .m_data_aclk(m_data_aclk),
    .m_data_aresetn(m_data_aresetn),
    .m_data_init_axi_txn(m_data_init_axi_txn),
    .m_data_txn_done(m_data_txn_done),
    .m_data_error(m_data_error)
  );
endmodule
