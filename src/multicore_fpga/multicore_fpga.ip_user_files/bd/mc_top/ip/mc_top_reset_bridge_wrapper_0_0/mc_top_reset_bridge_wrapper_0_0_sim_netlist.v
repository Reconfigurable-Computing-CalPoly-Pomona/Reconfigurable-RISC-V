// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sun Jan 27 21:23:39 2019
// Host        : Drew running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {C:/Users/Benjamin/Documents/Word
//               documents/CPP/RISC-V-Multicore/src/multicore_fpga/multicore_fpga.srcs/sources_1/bd/mc_top/ip/mc_top_reset_bridge_wrapper_0_0/mc_top_reset_bridge_wrapper_0_0_sim_netlist.v}
// Design      : mc_top_reset_bridge_wrapper_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mc_top_reset_bridge_wrapper_0_0,reset_bridge_wrapper,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "reset_bridge_wrapper,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module mc_top_reset_bridge_wrapper_0_0
   (i_aclk,
    i_rst,
    o_rst_n);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_aclk, ASSOCIATED_RESET i_rst, FREQ_HZ 162495938, PHASE 0, CLK_DOMAIN mc_top_mig_7series_0_0_ui_clk, INSERT_VIP 0" *) input i_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 i_rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input i_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 o_rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME o_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output o_rst_n;

  wire i_aclk;
  wire i_rst;
  wire o_rst_n;

  mc_top_reset_bridge_wrapper_0_0_reset_bridge_wrapper inst
       (.i_aclk(i_aclk),
        .i_rst(i_rst),
        .o_rst_n(o_rst_n));
endmodule

(* ORIG_REF_NAME = "reset_bridge" *) 
module mc_top_reset_bridge_wrapper_0_0_reset_bridge
   (o_rst_n,
    i_aclk,
    i_rst);
  output o_rst_n;
  input i_aclk;
  input i_rst;

  wire i_aclk;
  wire i_rst;
  wire meta_reset_n;
  wire o_rst_n;
  wire o_rst_n_i_1_n_0;

  FDCE meta_reset_n_reg
       (.C(i_aclk),
        .CE(1'b1),
        .CLR(o_rst_n_i_1_n_0),
        .D(1'b1),
        .Q(meta_reset_n));
  LUT1 #(
    .INIT(2'h1)) 
    o_rst_n_i_1
       (.I0(i_rst),
        .O(o_rst_n_i_1_n_0));
  FDCE o_rst_n_reg
       (.C(i_aclk),
        .CE(1'b1),
        .CLR(o_rst_n_i_1_n_0),
        .D(meta_reset_n),
        .Q(o_rst_n));
endmodule

(* ORIG_REF_NAME = "reset_bridge_wrapper" *) 
module mc_top_reset_bridge_wrapper_0_0_reset_bridge_wrapper
   (o_rst_n,
    i_aclk,
    i_rst);
  output o_rst_n;
  input i_aclk;
  input i_rst;

  wire i_aclk;
  wire i_rst;
  wire o_rst_n;

  mc_top_reset_bridge_wrapper_0_0_reset_bridge reset_bridge_inst
       (.i_aclk(i_aclk),
        .i_rst(i_rst),
        .o_rst_n(o_rst_n));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
