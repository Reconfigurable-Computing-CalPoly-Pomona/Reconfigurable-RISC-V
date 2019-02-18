//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Sun Jan 27 21:22:47 2019
//Host        : Drew running 64-bit major release  (build 9200)
//Command     : generate_target mc_top.bd
//Design      : mc_top
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "mc_top,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=mc_top,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=2,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "mc_top.hwdef" *) 
module mc_top
   (ddr3_addr,
    ddr3_ba,
    ddr3_cas_n,
    ddr3_ck_n,
    ddr3_ck_p,
    ddr3_cke,
    ddr3_cs_n,
    ddr3_dm,
    ddr3_dq,
    ddr3_dqs_n,
    ddr3_dqs_p,
    ddr3_odt,
    ddr3_ras_n,
    ddr3_reset_n,
    ddr3_we_n,
    ddr_clock,
    reset);
  output [13:0]ddr3_addr;
  output [2:0]ddr3_ba;
  output ddr3_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.DDR3_CK_N CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.DDR3_CK_N, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) output [0:0]ddr3_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.DDR3_CK_P CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.DDR3_CK_P, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) output [0:0]ddr3_ck_p;
  output [0:0]ddr3_cke;
  output [0:0]ddr3_cs_n;
  output [1:0]ddr3_dm;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DDR3_DQ DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DDR3_DQ, LAYERED_METADATA undef" *) inout [15:0]ddr3_dq;
  inout [1:0]ddr3_dqs_n;
  inout [1:0]ddr3_dqs_p;
  output [0:0]ddr3_odt;
  output ddr3_ras_n;
  output ddr3_reset_n;
  output ddr3_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.DDR_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.DDR_CLOCK, CLK_DOMAIN mc_top_ddr_clock, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input ddr_clock;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset;

  wire [15:0]Net;
  wire [1:0]Net1;
  wire [1:0]Net2;
  wire aclk;
  wire [31:0]axi_interconnect_M00_AXI_ARADDR;
  wire [1:0]axi_interconnect_M00_AXI_ARBURST;
  wire [3:0]axi_interconnect_M00_AXI_ARCACHE;
  wire [3:0]axi_interconnect_M00_AXI_ARID;
  wire [7:0]axi_interconnect_M00_AXI_ARLEN;
  wire axi_interconnect_M00_AXI_ARLOCK;
  wire [2:0]axi_interconnect_M00_AXI_ARPROT;
  wire [3:0]axi_interconnect_M00_AXI_ARQOS;
  wire axi_interconnect_M00_AXI_ARREADY;
  wire [2:0]axi_interconnect_M00_AXI_ARSIZE;
  wire axi_interconnect_M00_AXI_ARVALID;
  wire [31:0]axi_interconnect_M00_AXI_AWADDR;
  wire [1:0]axi_interconnect_M00_AXI_AWBURST;
  wire [3:0]axi_interconnect_M00_AXI_AWCACHE;
  wire [3:0]axi_interconnect_M00_AXI_AWID;
  wire [7:0]axi_interconnect_M00_AXI_AWLEN;
  wire axi_interconnect_M00_AXI_AWLOCK;
  wire [2:0]axi_interconnect_M00_AXI_AWPROT;
  wire [3:0]axi_interconnect_M00_AXI_AWQOS;
  wire axi_interconnect_M00_AXI_AWREADY;
  wire [2:0]axi_interconnect_M00_AXI_AWSIZE;
  wire axi_interconnect_M00_AXI_AWVALID;
  wire [3:0]axi_interconnect_M00_AXI_BID;
  wire axi_interconnect_M00_AXI_BREADY;
  wire [1:0]axi_interconnect_M00_AXI_BRESP;
  wire axi_interconnect_M00_AXI_BVALID;
  wire [31:0]axi_interconnect_M00_AXI_RDATA;
  wire [3:0]axi_interconnect_M00_AXI_RID;
  wire axi_interconnect_M00_AXI_RLAST;
  wire axi_interconnect_M00_AXI_RREADY;
  wire [1:0]axi_interconnect_M00_AXI_RRESP;
  wire axi_interconnect_M00_AXI_RVALID;
  wire [31:0]axi_interconnect_M00_AXI_WDATA;
  wire axi_interconnect_M00_AXI_WLAST;
  wire axi_interconnect_M00_AXI_WREADY;
  wire [3:0]axi_interconnect_M00_AXI_WSTRB;
  wire axi_interconnect_M00_AXI_WVALID;
  wire ddr_clock_1;
  wire inv_ff_0_o_reset_n;
  wire [31:0]jtag_axi_0_M_AXI_ARADDR;
  wire [1:0]jtag_axi_0_M_AXI_ARBURST;
  wire [3:0]jtag_axi_0_M_AXI_ARCACHE;
  wire [3:0]jtag_axi_0_M_AXI_ARID;
  wire [7:0]jtag_axi_0_M_AXI_ARLEN;
  wire jtag_axi_0_M_AXI_ARLOCK;
  wire [2:0]jtag_axi_0_M_AXI_ARPROT;
  wire [3:0]jtag_axi_0_M_AXI_ARQOS;
  wire jtag_axi_0_M_AXI_ARREADY;
  wire [2:0]jtag_axi_0_M_AXI_ARSIZE;
  wire jtag_axi_0_M_AXI_ARVALID;
  wire [31:0]jtag_axi_0_M_AXI_AWADDR;
  wire [1:0]jtag_axi_0_M_AXI_AWBURST;
  wire [3:0]jtag_axi_0_M_AXI_AWCACHE;
  wire [3:0]jtag_axi_0_M_AXI_AWID;
  wire [7:0]jtag_axi_0_M_AXI_AWLEN;
  wire jtag_axi_0_M_AXI_AWLOCK;
  wire [2:0]jtag_axi_0_M_AXI_AWPROT;
  wire [3:0]jtag_axi_0_M_AXI_AWQOS;
  wire jtag_axi_0_M_AXI_AWREADY;
  wire [2:0]jtag_axi_0_M_AXI_AWSIZE;
  wire jtag_axi_0_M_AXI_AWVALID;
  wire [3:0]jtag_axi_0_M_AXI_BID;
  wire jtag_axi_0_M_AXI_BREADY;
  wire [1:0]jtag_axi_0_M_AXI_BRESP;
  wire jtag_axi_0_M_AXI_BVALID;
  wire [31:0]jtag_axi_0_M_AXI_RDATA;
  wire [3:0]jtag_axi_0_M_AXI_RID;
  wire jtag_axi_0_M_AXI_RLAST;
  wire jtag_axi_0_M_AXI_RREADY;
  wire [1:0]jtag_axi_0_M_AXI_RRESP;
  wire jtag_axi_0_M_AXI_RVALID;
  wire [31:0]jtag_axi_0_M_AXI_WDATA;
  wire jtag_axi_0_M_AXI_WLAST;
  wire jtag_axi_0_M_AXI_WREADY;
  wire [3:0]jtag_axi_0_M_AXI_WSTRB;
  wire jtag_axi_0_M_AXI_WVALID;
  wire [13:0]mig_7series_0_ddr3_addr;
  wire [2:0]mig_7series_0_ddr3_ba;
  wire mig_7series_0_ddr3_cas_n;
  wire [0:0]mig_7series_0_ddr3_ck_n;
  wire [0:0]mig_7series_0_ddr3_ck_p;
  wire [0:0]mig_7series_0_ddr3_cke;
  wire [0:0]mig_7series_0_ddr3_cs_n;
  wire [1:0]mig_7series_0_ddr3_dm;
  wire [0:0]mig_7series_0_ddr3_odt;
  wire mig_7series_0_ddr3_ras_n;
  wire mig_7series_0_ddr3_reset_n;
  wire mig_7series_0_ddr3_we_n;
  wire mig_7series_0_ui_addn_clk_0;
  wire mig_7series_0_ui_clk_sync_rst;
  wire reset_1;
  wire reset_bridge_wrapper_0_o_areset_n;

  assign ddr3_addr[13:0] = mig_7series_0_ddr3_addr;
  assign ddr3_ba[2:0] = mig_7series_0_ddr3_ba;
  assign ddr3_cas_n = mig_7series_0_ddr3_cas_n;
  assign ddr3_ck_n[0] = mig_7series_0_ddr3_ck_n;
  assign ddr3_ck_p[0] = mig_7series_0_ddr3_ck_p;
  assign ddr3_cke[0] = mig_7series_0_ddr3_cke;
  assign ddr3_cs_n[0] = mig_7series_0_ddr3_cs_n;
  assign ddr3_dm[1:0] = mig_7series_0_ddr3_dm;
  assign ddr3_odt[0] = mig_7series_0_ddr3_odt;
  assign ddr3_ras_n = mig_7series_0_ddr3_ras_n;
  assign ddr3_reset_n = mig_7series_0_ddr3_reset_n;
  assign ddr3_we_n = mig_7series_0_ddr3_we_n;
  assign ddr_clock_1 = ddr_clock;
  assign reset_1 = reset;
  mc_top_axi_interconnect_0 axi_interconnect
       (.ACLK(aclk),
        .ARESETN(inv_ff_0_o_reset_n),
        .M00_ACLK(aclk),
        .M00_ARESETN(inv_ff_0_o_reset_n),
        .M00_AXI_araddr(axi_interconnect_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_interconnect_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_interconnect_M00_AXI_ARCACHE),
        .M00_AXI_arid(axi_interconnect_M00_AXI_ARID),
        .M00_AXI_arlen(axi_interconnect_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_interconnect_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_interconnect_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_interconnect_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_interconnect_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_interconnect_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_interconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_interconnect_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_interconnect_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_interconnect_M00_AXI_AWCACHE),
        .M00_AXI_awid(axi_interconnect_M00_AXI_AWID),
        .M00_AXI_awlen(axi_interconnect_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_interconnect_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_interconnect_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_interconnect_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_interconnect_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_interconnect_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_interconnect_M00_AXI_AWVALID),
        .M00_AXI_bid(axi_interconnect_M00_AXI_BID),
        .M00_AXI_bready(axi_interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_interconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_interconnect_M00_AXI_RDATA),
        .M00_AXI_rid(axi_interconnect_M00_AXI_RID),
        .M00_AXI_rlast(axi_interconnect_M00_AXI_RLAST),
        .M00_AXI_rready(axi_interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_interconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_interconnect_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_interconnect_M00_AXI_WLAST),
        .M00_AXI_wready(axi_interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_interconnect_M00_AXI_WVALID),
        .S00_ACLK(aclk),
        .S00_ARESETN(inv_ff_0_o_reset_n),
        .S00_AXI_araddr(jtag_axi_0_M_AXI_ARADDR),
        .S00_AXI_arburst(jtag_axi_0_M_AXI_ARBURST),
        .S00_AXI_arcache(jtag_axi_0_M_AXI_ARCACHE),
        .S00_AXI_arid(jtag_axi_0_M_AXI_ARID),
        .S00_AXI_arlen(jtag_axi_0_M_AXI_ARLEN),
        .S00_AXI_arlock(jtag_axi_0_M_AXI_ARLOCK),
        .S00_AXI_arprot(jtag_axi_0_M_AXI_ARPROT),
        .S00_AXI_arqos(jtag_axi_0_M_AXI_ARQOS),
        .S00_AXI_arready(jtag_axi_0_M_AXI_ARREADY),
        .S00_AXI_arsize(jtag_axi_0_M_AXI_ARSIZE),
        .S00_AXI_arvalid(jtag_axi_0_M_AXI_ARVALID),
        .S00_AXI_awaddr(jtag_axi_0_M_AXI_AWADDR),
        .S00_AXI_awburst(jtag_axi_0_M_AXI_AWBURST),
        .S00_AXI_awcache(jtag_axi_0_M_AXI_AWCACHE),
        .S00_AXI_awid(jtag_axi_0_M_AXI_AWID),
        .S00_AXI_awlen(jtag_axi_0_M_AXI_AWLEN),
        .S00_AXI_awlock(jtag_axi_0_M_AXI_AWLOCK),
        .S00_AXI_awprot(jtag_axi_0_M_AXI_AWPROT),
        .S00_AXI_awqos(jtag_axi_0_M_AXI_AWQOS),
        .S00_AXI_awready(jtag_axi_0_M_AXI_AWREADY),
        .S00_AXI_awsize(jtag_axi_0_M_AXI_AWSIZE),
        .S00_AXI_awvalid(jtag_axi_0_M_AXI_AWVALID),
        .S00_AXI_bid(jtag_axi_0_M_AXI_BID),
        .S00_AXI_bready(jtag_axi_0_M_AXI_BREADY),
        .S00_AXI_bresp(jtag_axi_0_M_AXI_BRESP),
        .S00_AXI_bvalid(jtag_axi_0_M_AXI_BVALID),
        .S00_AXI_rdata(jtag_axi_0_M_AXI_RDATA),
        .S00_AXI_rid(jtag_axi_0_M_AXI_RID),
        .S00_AXI_rlast(jtag_axi_0_M_AXI_RLAST),
        .S00_AXI_rready(jtag_axi_0_M_AXI_RREADY),
        .S00_AXI_rresp(jtag_axi_0_M_AXI_RRESP),
        .S00_AXI_rvalid(jtag_axi_0_M_AXI_RVALID),
        .S00_AXI_wdata(jtag_axi_0_M_AXI_WDATA),
        .S00_AXI_wlast(jtag_axi_0_M_AXI_WLAST),
        .S00_AXI_wready(jtag_axi_0_M_AXI_WREADY),
        .S00_AXI_wstrb(jtag_axi_0_M_AXI_WSTRB),
        .S00_AXI_wvalid(jtag_axi_0_M_AXI_WVALID));
  mc_top_inv_ff_0_0 inv_ff_0
       (.i_aclk(aclk),
        .i_rst(mig_7series_0_ui_clk_sync_rst),
        .o_rst_n(inv_ff_0_o_reset_n));
  mc_top_jtag_axi_0_0 jtag_master
       (.aclk(aclk),
        .aresetn(inv_ff_0_o_reset_n),
        .m_axi_araddr(jtag_axi_0_M_AXI_ARADDR),
        .m_axi_arburst(jtag_axi_0_M_AXI_ARBURST),
        .m_axi_arcache(jtag_axi_0_M_AXI_ARCACHE),
        .m_axi_arid(jtag_axi_0_M_AXI_ARID),
        .m_axi_arlen(jtag_axi_0_M_AXI_ARLEN),
        .m_axi_arlock(jtag_axi_0_M_AXI_ARLOCK),
        .m_axi_arprot(jtag_axi_0_M_AXI_ARPROT),
        .m_axi_arqos(jtag_axi_0_M_AXI_ARQOS),
        .m_axi_arready(jtag_axi_0_M_AXI_ARREADY),
        .m_axi_arsize(jtag_axi_0_M_AXI_ARSIZE),
        .m_axi_arvalid(jtag_axi_0_M_AXI_ARVALID),
        .m_axi_awaddr(jtag_axi_0_M_AXI_AWADDR),
        .m_axi_awburst(jtag_axi_0_M_AXI_AWBURST),
        .m_axi_awcache(jtag_axi_0_M_AXI_AWCACHE),
        .m_axi_awid(jtag_axi_0_M_AXI_AWID),
        .m_axi_awlen(jtag_axi_0_M_AXI_AWLEN),
        .m_axi_awlock(jtag_axi_0_M_AXI_AWLOCK),
        .m_axi_awprot(jtag_axi_0_M_AXI_AWPROT),
        .m_axi_awqos(jtag_axi_0_M_AXI_AWQOS),
        .m_axi_awready(jtag_axi_0_M_AXI_AWREADY),
        .m_axi_awsize(jtag_axi_0_M_AXI_AWSIZE),
        .m_axi_awvalid(jtag_axi_0_M_AXI_AWVALID),
        .m_axi_bid(jtag_axi_0_M_AXI_BID),
        .m_axi_bready(jtag_axi_0_M_AXI_BREADY),
        .m_axi_bresp(jtag_axi_0_M_AXI_BRESP),
        .m_axi_bvalid(jtag_axi_0_M_AXI_BVALID),
        .m_axi_rdata(jtag_axi_0_M_AXI_RDATA),
        .m_axi_rid(jtag_axi_0_M_AXI_RID),
        .m_axi_rlast(jtag_axi_0_M_AXI_RLAST),
        .m_axi_rready(jtag_axi_0_M_AXI_RREADY),
        .m_axi_rresp(jtag_axi_0_M_AXI_RRESP),
        .m_axi_rvalid(jtag_axi_0_M_AXI_RVALID),
        .m_axi_wdata(jtag_axi_0_M_AXI_WDATA),
        .m_axi_wlast(jtag_axi_0_M_AXI_WLAST),
        .m_axi_wready(jtag_axi_0_M_AXI_WREADY),
        .m_axi_wstrb(jtag_axi_0_M_AXI_WSTRB),
        .m_axi_wvalid(jtag_axi_0_M_AXI_WVALID));
  mc_top_mig_7series_0_0 mig_7series_0
       (.aresetn(inv_ff_0_o_reset_n),
        .clk_ref_i(mig_7series_0_ui_addn_clk_0),
        .ddr3_addr(mig_7series_0_ddr3_addr),
        .ddr3_ba(mig_7series_0_ddr3_ba),
        .ddr3_cas_n(mig_7series_0_ddr3_cas_n),
        .ddr3_ck_n(mig_7series_0_ddr3_ck_n),
        .ddr3_ck_p(mig_7series_0_ddr3_ck_p),
        .ddr3_cke(mig_7series_0_ddr3_cke),
        .ddr3_cs_n(mig_7series_0_ddr3_cs_n),
        .ddr3_dm(mig_7series_0_ddr3_dm),
        .ddr3_dq(ddr3_dq[15:0]),
        .ddr3_dqs_n(ddr3_dqs_n[1:0]),
        .ddr3_dqs_p(ddr3_dqs_p[1:0]),
        .ddr3_odt(mig_7series_0_ddr3_odt),
        .ddr3_ras_n(mig_7series_0_ddr3_ras_n),
        .ddr3_reset_n(mig_7series_0_ddr3_reset_n),
        .ddr3_we_n(mig_7series_0_ddr3_we_n),
        .s_axi_araddr(axi_interconnect_M00_AXI_ARADDR[27:0]),
        .s_axi_arburst(axi_interconnect_M00_AXI_ARBURST),
        .s_axi_arcache(axi_interconnect_M00_AXI_ARCACHE),
        .s_axi_arid(axi_interconnect_M00_AXI_ARID),
        .s_axi_arlen(axi_interconnect_M00_AXI_ARLEN),
        .s_axi_arlock(axi_interconnect_M00_AXI_ARLOCK),
        .s_axi_arprot(axi_interconnect_M00_AXI_ARPROT),
        .s_axi_arqos(axi_interconnect_M00_AXI_ARQOS),
        .s_axi_arready(axi_interconnect_M00_AXI_ARREADY),
        .s_axi_arsize(axi_interconnect_M00_AXI_ARSIZE),
        .s_axi_arvalid(axi_interconnect_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_interconnect_M00_AXI_AWADDR[27:0]),
        .s_axi_awburst(axi_interconnect_M00_AXI_AWBURST),
        .s_axi_awcache(axi_interconnect_M00_AXI_AWCACHE),
        .s_axi_awid(axi_interconnect_M00_AXI_AWID),
        .s_axi_awlen(axi_interconnect_M00_AXI_AWLEN),
        .s_axi_awlock(axi_interconnect_M00_AXI_AWLOCK),
        .s_axi_awprot(axi_interconnect_M00_AXI_AWPROT),
        .s_axi_awqos(axi_interconnect_M00_AXI_AWQOS),
        .s_axi_awready(axi_interconnect_M00_AXI_AWREADY),
        .s_axi_awsize(axi_interconnect_M00_AXI_AWSIZE),
        .s_axi_awvalid(axi_interconnect_M00_AXI_AWVALID),
        .s_axi_bid(axi_interconnect_M00_AXI_BID),
        .s_axi_bready(axi_interconnect_M00_AXI_BREADY),
        .s_axi_bresp(axi_interconnect_M00_AXI_BRESP),
        .s_axi_bvalid(axi_interconnect_M00_AXI_BVALID),
        .s_axi_rdata(axi_interconnect_M00_AXI_RDATA),
        .s_axi_rid(axi_interconnect_M00_AXI_RID),
        .s_axi_rlast(axi_interconnect_M00_AXI_RLAST),
        .s_axi_rready(axi_interconnect_M00_AXI_RREADY),
        .s_axi_rresp(axi_interconnect_M00_AXI_RRESP),
        .s_axi_rvalid(axi_interconnect_M00_AXI_RVALID),
        .s_axi_wdata(axi_interconnect_M00_AXI_WDATA),
        .s_axi_wlast(axi_interconnect_M00_AXI_WLAST),
        .s_axi_wready(axi_interconnect_M00_AXI_WREADY),
        .s_axi_wstrb(axi_interconnect_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_interconnect_M00_AXI_WVALID),
        .sys_clk_i(ddr_clock_1),
        .sys_rst(reset_bridge_wrapper_0_o_areset_n),
        .ui_addn_clk_0(mig_7series_0_ui_addn_clk_0),
        .ui_clk(aclk),
        .ui_clk_sync_rst(mig_7series_0_ui_clk_sync_rst));
  mc_top_reset_bridge_wrapper_0_0 reset_bridge_wrapper_0
       (.i_aclk(aclk),
        .i_rst(reset_1),
        .o_rst_n(reset_bridge_wrapper_0_o_areset_n));
endmodule

module mc_top_axi_interconnect_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [3:0]M00_AXI_arid;
  output [7:0]M00_AXI_arlen;
  output M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [3:0]M00_AXI_awid;
  output [7:0]M00_AXI_awlen;
  output M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [3:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  input [3:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [3:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [3:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [3:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [3:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire axi_interconnect_ACLK_net;
  wire axi_interconnect_ARESETN_net;
  wire [31:0]axi_interconnect_to_s00_couplers_ARADDR;
  wire [1:0]axi_interconnect_to_s00_couplers_ARBURST;
  wire [3:0]axi_interconnect_to_s00_couplers_ARCACHE;
  wire [3:0]axi_interconnect_to_s00_couplers_ARID;
  wire [7:0]axi_interconnect_to_s00_couplers_ARLEN;
  wire axi_interconnect_to_s00_couplers_ARLOCK;
  wire [2:0]axi_interconnect_to_s00_couplers_ARPROT;
  wire [3:0]axi_interconnect_to_s00_couplers_ARQOS;
  wire axi_interconnect_to_s00_couplers_ARREADY;
  wire [2:0]axi_interconnect_to_s00_couplers_ARSIZE;
  wire axi_interconnect_to_s00_couplers_ARVALID;
  wire [31:0]axi_interconnect_to_s00_couplers_AWADDR;
  wire [1:0]axi_interconnect_to_s00_couplers_AWBURST;
  wire [3:0]axi_interconnect_to_s00_couplers_AWCACHE;
  wire [3:0]axi_interconnect_to_s00_couplers_AWID;
  wire [7:0]axi_interconnect_to_s00_couplers_AWLEN;
  wire axi_interconnect_to_s00_couplers_AWLOCK;
  wire [2:0]axi_interconnect_to_s00_couplers_AWPROT;
  wire [3:0]axi_interconnect_to_s00_couplers_AWQOS;
  wire axi_interconnect_to_s00_couplers_AWREADY;
  wire [2:0]axi_interconnect_to_s00_couplers_AWSIZE;
  wire axi_interconnect_to_s00_couplers_AWVALID;
  wire [3:0]axi_interconnect_to_s00_couplers_BID;
  wire axi_interconnect_to_s00_couplers_BREADY;
  wire [1:0]axi_interconnect_to_s00_couplers_BRESP;
  wire axi_interconnect_to_s00_couplers_BVALID;
  wire [31:0]axi_interconnect_to_s00_couplers_RDATA;
  wire [3:0]axi_interconnect_to_s00_couplers_RID;
  wire axi_interconnect_to_s00_couplers_RLAST;
  wire axi_interconnect_to_s00_couplers_RREADY;
  wire [1:0]axi_interconnect_to_s00_couplers_RRESP;
  wire axi_interconnect_to_s00_couplers_RVALID;
  wire [31:0]axi_interconnect_to_s00_couplers_WDATA;
  wire axi_interconnect_to_s00_couplers_WLAST;
  wire axi_interconnect_to_s00_couplers_WREADY;
  wire [3:0]axi_interconnect_to_s00_couplers_WSTRB;
  wire axi_interconnect_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_axi_interconnect_ARADDR;
  wire [1:0]s00_couplers_to_axi_interconnect_ARBURST;
  wire [3:0]s00_couplers_to_axi_interconnect_ARCACHE;
  wire [3:0]s00_couplers_to_axi_interconnect_ARID;
  wire [7:0]s00_couplers_to_axi_interconnect_ARLEN;
  wire s00_couplers_to_axi_interconnect_ARLOCK;
  wire [2:0]s00_couplers_to_axi_interconnect_ARPROT;
  wire [3:0]s00_couplers_to_axi_interconnect_ARQOS;
  wire s00_couplers_to_axi_interconnect_ARREADY;
  wire [2:0]s00_couplers_to_axi_interconnect_ARSIZE;
  wire s00_couplers_to_axi_interconnect_ARVALID;
  wire [31:0]s00_couplers_to_axi_interconnect_AWADDR;
  wire [1:0]s00_couplers_to_axi_interconnect_AWBURST;
  wire [3:0]s00_couplers_to_axi_interconnect_AWCACHE;
  wire [3:0]s00_couplers_to_axi_interconnect_AWID;
  wire [7:0]s00_couplers_to_axi_interconnect_AWLEN;
  wire s00_couplers_to_axi_interconnect_AWLOCK;
  wire [2:0]s00_couplers_to_axi_interconnect_AWPROT;
  wire [3:0]s00_couplers_to_axi_interconnect_AWQOS;
  wire s00_couplers_to_axi_interconnect_AWREADY;
  wire [2:0]s00_couplers_to_axi_interconnect_AWSIZE;
  wire s00_couplers_to_axi_interconnect_AWVALID;
  wire [3:0]s00_couplers_to_axi_interconnect_BID;
  wire s00_couplers_to_axi_interconnect_BREADY;
  wire [1:0]s00_couplers_to_axi_interconnect_BRESP;
  wire s00_couplers_to_axi_interconnect_BVALID;
  wire [31:0]s00_couplers_to_axi_interconnect_RDATA;
  wire [3:0]s00_couplers_to_axi_interconnect_RID;
  wire s00_couplers_to_axi_interconnect_RLAST;
  wire s00_couplers_to_axi_interconnect_RREADY;
  wire [1:0]s00_couplers_to_axi_interconnect_RRESP;
  wire s00_couplers_to_axi_interconnect_RVALID;
  wire [31:0]s00_couplers_to_axi_interconnect_WDATA;
  wire s00_couplers_to_axi_interconnect_WLAST;
  wire s00_couplers_to_axi_interconnect_WREADY;
  wire [3:0]s00_couplers_to_axi_interconnect_WSTRB;
  wire s00_couplers_to_axi_interconnect_WVALID;

  assign M00_AXI_araddr[31:0] = s00_couplers_to_axi_interconnect_ARADDR;
  assign M00_AXI_arburst[1:0] = s00_couplers_to_axi_interconnect_ARBURST;
  assign M00_AXI_arcache[3:0] = s00_couplers_to_axi_interconnect_ARCACHE;
  assign M00_AXI_arid[3:0] = s00_couplers_to_axi_interconnect_ARID;
  assign M00_AXI_arlen[7:0] = s00_couplers_to_axi_interconnect_ARLEN;
  assign M00_AXI_arlock = s00_couplers_to_axi_interconnect_ARLOCK;
  assign M00_AXI_arprot[2:0] = s00_couplers_to_axi_interconnect_ARPROT;
  assign M00_AXI_arqos[3:0] = s00_couplers_to_axi_interconnect_ARQOS;
  assign M00_AXI_arsize[2:0] = s00_couplers_to_axi_interconnect_ARSIZE;
  assign M00_AXI_arvalid = s00_couplers_to_axi_interconnect_ARVALID;
  assign M00_AXI_awaddr[31:0] = s00_couplers_to_axi_interconnect_AWADDR;
  assign M00_AXI_awburst[1:0] = s00_couplers_to_axi_interconnect_AWBURST;
  assign M00_AXI_awcache[3:0] = s00_couplers_to_axi_interconnect_AWCACHE;
  assign M00_AXI_awid[3:0] = s00_couplers_to_axi_interconnect_AWID;
  assign M00_AXI_awlen[7:0] = s00_couplers_to_axi_interconnect_AWLEN;
  assign M00_AXI_awlock = s00_couplers_to_axi_interconnect_AWLOCK;
  assign M00_AXI_awprot[2:0] = s00_couplers_to_axi_interconnect_AWPROT;
  assign M00_AXI_awqos[3:0] = s00_couplers_to_axi_interconnect_AWQOS;
  assign M00_AXI_awsize[2:0] = s00_couplers_to_axi_interconnect_AWSIZE;
  assign M00_AXI_awvalid = s00_couplers_to_axi_interconnect_AWVALID;
  assign M00_AXI_bready = s00_couplers_to_axi_interconnect_BREADY;
  assign M00_AXI_rready = s00_couplers_to_axi_interconnect_RREADY;
  assign M00_AXI_wdata[31:0] = s00_couplers_to_axi_interconnect_WDATA;
  assign M00_AXI_wlast = s00_couplers_to_axi_interconnect_WLAST;
  assign M00_AXI_wstrb[3:0] = s00_couplers_to_axi_interconnect_WSTRB;
  assign M00_AXI_wvalid = s00_couplers_to_axi_interconnect_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = axi_interconnect_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = axi_interconnect_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[3:0] = axi_interconnect_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = axi_interconnect_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_interconnect_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = axi_interconnect_to_s00_couplers_RDATA;
  assign S00_AXI_rid[3:0] = axi_interconnect_to_s00_couplers_RID;
  assign S00_AXI_rlast = axi_interconnect_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_interconnect_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_interconnect_to_s00_couplers_RVALID;
  assign S00_AXI_wready = axi_interconnect_to_s00_couplers_WREADY;
  assign axi_interconnect_ACLK_net = M00_ACLK;
  assign axi_interconnect_ARESETN_net = M00_ARESETN;
  assign axi_interconnect_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_interconnect_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_interconnect_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_interconnect_to_s00_couplers_ARID = S00_AXI_arid[3:0];
  assign axi_interconnect_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign axi_interconnect_to_s00_couplers_ARLOCK = S00_AXI_arlock;
  assign axi_interconnect_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_interconnect_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign axi_interconnect_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_interconnect_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_interconnect_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign axi_interconnect_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_interconnect_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_interconnect_to_s00_couplers_AWID = S00_AXI_awid[3:0];
  assign axi_interconnect_to_s00_couplers_AWLEN = S00_AXI_awlen[7:0];
  assign axi_interconnect_to_s00_couplers_AWLOCK = S00_AXI_awlock;
  assign axi_interconnect_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_interconnect_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign axi_interconnect_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_interconnect_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_interconnect_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_interconnect_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_interconnect_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign axi_interconnect_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign axi_interconnect_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign axi_interconnect_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign s00_couplers_to_axi_interconnect_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_axi_interconnect_AWREADY = M00_AXI_awready;
  assign s00_couplers_to_axi_interconnect_BID = M00_AXI_bid[3:0];
  assign s00_couplers_to_axi_interconnect_BRESP = M00_AXI_bresp[1:0];
  assign s00_couplers_to_axi_interconnect_BVALID = M00_AXI_bvalid;
  assign s00_couplers_to_axi_interconnect_RDATA = M00_AXI_rdata[31:0];
  assign s00_couplers_to_axi_interconnect_RID = M00_AXI_rid[3:0];
  assign s00_couplers_to_axi_interconnect_RLAST = M00_AXI_rlast;
  assign s00_couplers_to_axi_interconnect_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_axi_interconnect_RVALID = M00_AXI_rvalid;
  assign s00_couplers_to_axi_interconnect_WREADY = M00_AXI_wready;
  s00_couplers_imp_7VELFM s00_couplers
       (.M_ACLK(axi_interconnect_ACLK_net),
        .M_ARESETN(axi_interconnect_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arburst(s00_couplers_to_axi_interconnect_ARBURST),
        .M_AXI_arcache(s00_couplers_to_axi_interconnect_ARCACHE),
        .M_AXI_arid(s00_couplers_to_axi_interconnect_ARID),
        .M_AXI_arlen(s00_couplers_to_axi_interconnect_ARLEN),
        .M_AXI_arlock(s00_couplers_to_axi_interconnect_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_axi_interconnect_ARPROT),
        .M_AXI_arqos(s00_couplers_to_axi_interconnect_ARQOS),
        .M_AXI_arready(s00_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arsize(s00_couplers_to_axi_interconnect_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awburst(s00_couplers_to_axi_interconnect_AWBURST),
        .M_AXI_awcache(s00_couplers_to_axi_interconnect_AWCACHE),
        .M_AXI_awid(s00_couplers_to_axi_interconnect_AWID),
        .M_AXI_awlen(s00_couplers_to_axi_interconnect_AWLEN),
        .M_AXI_awlock(s00_couplers_to_axi_interconnect_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_axi_interconnect_AWPROT),
        .M_AXI_awqos(s00_couplers_to_axi_interconnect_AWQOS),
        .M_AXI_awready(s00_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awsize(s00_couplers_to_axi_interconnect_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bid(s00_couplers_to_axi_interconnect_BID),
        .M_AXI_bready(s00_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(s00_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(s00_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(s00_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rid(s00_couplers_to_axi_interconnect_RID),
        .M_AXI_rlast(s00_couplers_to_axi_interconnect_RLAST),
        .M_AXI_rready(s00_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(s00_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(s00_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(s00_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wlast(s00_couplers_to_axi_interconnect_WLAST),
        .M_AXI_wready(s00_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(s00_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_interconnect_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_interconnect_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_interconnect_to_s00_couplers_ARCACHE),
        .S_AXI_arid(axi_interconnect_to_s00_couplers_ARID),
        .S_AXI_arlen(axi_interconnect_to_s00_couplers_ARLEN),
        .S_AXI_arlock(axi_interconnect_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(axi_interconnect_to_s00_couplers_ARPROT),
        .S_AXI_arqos(axi_interconnect_to_s00_couplers_ARQOS),
        .S_AXI_arready(axi_interconnect_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_interconnect_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_interconnect_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_interconnect_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_interconnect_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_interconnect_to_s00_couplers_AWCACHE),
        .S_AXI_awid(axi_interconnect_to_s00_couplers_AWID),
        .S_AXI_awlen(axi_interconnect_to_s00_couplers_AWLEN),
        .S_AXI_awlock(axi_interconnect_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(axi_interconnect_to_s00_couplers_AWPROT),
        .S_AXI_awqos(axi_interconnect_to_s00_couplers_AWQOS),
        .S_AXI_awready(axi_interconnect_to_s00_couplers_AWREADY),
        .S_AXI_awsize(axi_interconnect_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(axi_interconnect_to_s00_couplers_AWVALID),
        .S_AXI_bid(axi_interconnect_to_s00_couplers_BID),
        .S_AXI_bready(axi_interconnect_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_interconnect_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_interconnect_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_interconnect_to_s00_couplers_RDATA),
        .S_AXI_rid(axi_interconnect_to_s00_couplers_RID),
        .S_AXI_rlast(axi_interconnect_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_interconnect_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_interconnect_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_interconnect_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_interconnect_to_s00_couplers_WDATA),
        .S_AXI_wlast(axi_interconnect_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_interconnect_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_interconnect_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_interconnect_to_s00_couplers_WVALID));
endmodule

module s00_couplers_imp_7VELFM
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [3:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [3:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [3:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [3:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [3:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [3:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [3:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [3:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [1:0]s00_couplers_to_s00_couplers_ARBURST;
  wire [3:0]s00_couplers_to_s00_couplers_ARCACHE;
  wire [3:0]s00_couplers_to_s00_couplers_ARID;
  wire [7:0]s00_couplers_to_s00_couplers_ARLEN;
  wire s00_couplers_to_s00_couplers_ARLOCK;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire [3:0]s00_couplers_to_s00_couplers_ARQOS;
  wire s00_couplers_to_s00_couplers_ARREADY;
  wire [2:0]s00_couplers_to_s00_couplers_ARSIZE;
  wire s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [1:0]s00_couplers_to_s00_couplers_AWBURST;
  wire [3:0]s00_couplers_to_s00_couplers_AWCACHE;
  wire [3:0]s00_couplers_to_s00_couplers_AWID;
  wire [7:0]s00_couplers_to_s00_couplers_AWLEN;
  wire s00_couplers_to_s00_couplers_AWLOCK;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire [3:0]s00_couplers_to_s00_couplers_AWQOS;
  wire s00_couplers_to_s00_couplers_AWREADY;
  wire [2:0]s00_couplers_to_s00_couplers_AWSIZE;
  wire s00_couplers_to_s00_couplers_AWVALID;
  wire [3:0]s00_couplers_to_s00_couplers_BID;
  wire s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire s00_couplers_to_s00_couplers_BVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire [3:0]s00_couplers_to_s00_couplers_RID;
  wire s00_couplers_to_s00_couplers_RLAST;
  wire s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire s00_couplers_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_s00_couplers_WDATA;
  wire s00_couplers_to_s00_couplers_WLAST;
  wire s00_couplers_to_s00_couplers_WREADY;
  wire [3:0]s00_couplers_to_s00_couplers_WSTRB;
  wire s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s00_couplers_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s00_couplers_to_s00_couplers_ARCACHE;
  assign M_AXI_arid[3:0] = s00_couplers_to_s00_couplers_ARID;
  assign M_AXI_arlen[7:0] = s00_couplers_to_s00_couplers_ARLEN;
  assign M_AXI_arlock = s00_couplers_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = s00_couplers_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = s00_couplers_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s00_couplers_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s00_couplers_to_s00_couplers_AWCACHE;
  assign M_AXI_awid[3:0] = s00_couplers_to_s00_couplers_AWID;
  assign M_AXI_awlen[7:0] = s00_couplers_to_s00_couplers_AWLEN;
  assign M_AXI_awlock = s00_couplers_to_s00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = s00_couplers_to_s00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = s00_couplers_to_s00_couplers_AWSIZE;
  assign M_AXI_awvalid = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wlast = s00_couplers_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bid[3:0] = s00_couplers_to_s00_couplers_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rid[3:0] = s00_couplers_to_s00_couplers_RID;
  assign S_AXI_rlast = s00_couplers_to_s00_couplers_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_s00_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_s00_couplers_ARID = S_AXI_arid[3:0];
  assign s00_couplers_to_s00_couplers_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_s00_couplers_ARLOCK = S_AXI_arlock;
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_couplers_to_s00_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_couplers_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_s00_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_s00_couplers_AWID = S_AXI_awid[3:0];
  assign s00_couplers_to_s00_couplers_AWLEN = S_AXI_awlen[7:0];
  assign s00_couplers_to_s00_couplers_AWLOCK = S_AXI_awlock;
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_couplers_to_s00_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_s00_couplers_BID = M_AXI_bid[3:0];
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready;
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RID = M_AXI_rid[3:0];
  assign s00_couplers_to_s00_couplers_RLAST = M_AXI_rlast;
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready;
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_couplers_WLAST = S_AXI_wlast;
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid;
endmodule
