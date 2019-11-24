//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Sat Nov 23 19:32:54 2019
//Host        : Drew running 64-bit major release  (build 9200)
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
