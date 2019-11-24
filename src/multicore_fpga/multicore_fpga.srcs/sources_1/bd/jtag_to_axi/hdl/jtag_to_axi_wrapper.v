//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Fri Nov 22 20:50:04 2019
//Host        : Drew running 64-bit major release  (build 9200)
//Command     : generate_target jtag_to_axi_wrapper.bd
//Design      : jtag_to_axi_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module jtag_to_axi_wrapper
   (ddr_clock,
    led,
    reset_n,
    sw_tri_i);
  input ddr_clock;
  output [1:0]led;
  input reset_n;
  input [3:0]sw_tri_i;

  wire ddr_clock;
  wire [1:0]led;
  wire reset_n;
  wire [3:0]sw_tri_i;

  jtag_to_axi jtag_to_axi_i
       (.ddr_clock(ddr_clock),
        .led(led),
        .reset_n(reset_n),
        .sw_tri_i(sw_tri_i));
endmodule
