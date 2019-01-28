`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Benjamin Kueffler
// 
// Create Date: 01/26/2019 10:13:03 PM
// Design Name: 
// Module Name: reset_bridge
// Project Name:
// Target Devices: 
// Tool Versions: 
// Description: 
// Instantiates two flip flops for the purpose of an asynchronously asserted,
// synchronously deasserted reset
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reset_bridge(
  input logic i_aclk,
  input logic i_rst,
  output logic o_rst_n
);

// The output of the first flip flop
logic meta_reset_n;

always_ff @(posedge i_aclk or negedge i_rst) begin : proc_seq
  if(~i_rst) begin
    // Asynchronous Reset
    {meta_reset_n, o_rst_n} <= '0;
  end else begin
    // Synchronous flip flops
    meta_reset_n <= 1;
    o_rst_n <= meta_reset_n;
  end
end
endmodule
