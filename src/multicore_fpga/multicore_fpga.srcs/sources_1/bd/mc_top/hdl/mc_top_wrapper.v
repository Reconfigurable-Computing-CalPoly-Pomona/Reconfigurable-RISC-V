//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Fri Jun 26 17:50:05 2020
//Host        : DESKTOP-N84G71E running 64-bit major release  (build 9200)
//Command     : generate_target mc_top_wrapper.bd
//Design      : mc_top_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mc_top_wrapper
   (ddr_clock,
    reset_n);
  input ddr_clock;
  input reset_n;

  wire ddr_clock;
  wire reset_n;

  mc_top mc_top_i
       (.ddr_clock(ddr_clock),
        .reset_n(reset_n));
endmodule
