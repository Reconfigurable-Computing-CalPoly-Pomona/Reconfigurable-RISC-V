`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Benjamin Kueffler
// 
// Create Date: 01/27/2019 06:17:47 PM
// Design Name: 
// Module Name: inv_ff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Changes the polarity on an asynchronous reset
// 
//////////////////////////////////////////////////////////////////////////////////


module inv_ff(
    input i_aclk,
    input i_rst,
    output reg o_rst_n
    );

always @(posedge i_aclk or negedge i_rst) begin : proc_seq_ff
  if(i_rst) begin
    o_rst_n <= 0;
  end else begin
    o_rst_n <= 1;
  end
end
endmodule
