`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 09/22/2019 10:26:38 AM
// Design Name: 
// Module Name: tb_clk_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:
// Generates a reset and clock for the block diagram based test bench
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_clk_gen(
  output reg o_clk,
  output wire o_areset_n,
  output reg o_areset
);

  // Defines the clock period for the test bench
  localparam CLOCK_PERIOD = 2;

  // Defines the reset period for the test bench
  localparam RESET_PERIOD = 15;

  // Create an asynchronous reset
  initial begin
    o_clk = 0;
    o_areset = 1;
    #RESET_PERIOD
    o_areset = 0;
  end

  // Assign the inverted reset for active low devices
  assign o_areset_n = ~o_areset;

  // Generate the clock
  always begin
    #(CLOCK_PERIOD / 2) o_clk = ~o_clk;
  end

endmodule
