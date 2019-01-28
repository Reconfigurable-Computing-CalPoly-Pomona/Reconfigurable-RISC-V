`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Benjamin Kueffler
// 
// Create Date: 01/27/2019 12:10:01 AM
// Design Name: 
// Module Name: reset_bridge_wrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:
// Creates a verilog wrapper for the reset bridge to use in Vivado block diagrams
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reset_bridge_wrapper(
    input i_aclk,
    input i_rst,
    output o_rst_n
    );


  reset_bridge reset_bridge_inst(
    .i_aclk(i_aclk),
    .i_rst(i_rst),
    .o_rst_n(o_rst_n)
  );
endmodule
