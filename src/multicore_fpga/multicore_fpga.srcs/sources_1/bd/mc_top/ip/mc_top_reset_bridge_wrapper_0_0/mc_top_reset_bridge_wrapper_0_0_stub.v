// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sun Jan 27 21:23:39 2019
// Host        : Drew running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {C:/Users/Benjamin/Documents/Word
//               documents/CPP/RISC-V-Multicore/src/multicore_fpga/multicore_fpga.srcs/sources_1/bd/mc_top/ip/mc_top_reset_bridge_wrapper_0_0/mc_top_reset_bridge_wrapper_0_0_stub.v}
// Design      : mc_top_reset_bridge_wrapper_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "reset_bridge_wrapper,Vivado 2018.3" *)
module mc_top_reset_bridge_wrapper_0_0(i_aclk, i_rst, o_rst_n)
/* synthesis syn_black_box black_box_pad_pin="i_aclk,i_rst,o_rst_n" */;
  input i_aclk;
  input i_rst;
  output o_rst_n;
endmodule
