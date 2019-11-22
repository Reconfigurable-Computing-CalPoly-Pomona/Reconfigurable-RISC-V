`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Benjamin Kueffler
// 
// Create Date: 02/13/2019 11:35:57 AM
// Design Name: 
// Module Name: ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:
// Creates a synchronous RAM block under mode "Write first"
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ram
#(
  parameter DEPTH = 2**16,
  parameter DATA_WIDTH = 32
)
(
  input logic i_clk,

  // Port A
  input logic i_we,
  input logic i_en,
  input logic [$clog2(DEPTH) - 1:0] i_addr,
  input logic [DATA_WIDTH - 1:0] i_data,
  output logic [DATA_WIDTH - 1:0] o_data

/*
  // Port B
  input logic [$clog2(DEPTH) - 1:0] i_addr_b,
  input logic [DATA_WIDTH - 1:0] i_data_b,
  input logic i_we_b,
  output logic [DATA_WIDTH - 1:0] o_data_b
*/
);

  // The memory, which may be generated using block RAM or distributed RAM
  logic [DATA_WIDTH - 1:0] mem [0:DEPTH - 1];

  always_ff @(posedge i_clk) begin : proc_ram
    if (i_en) begin
      // During write first mode, the write occurs before reading out the data
      if (i_we) begin
        mem[i_addr] <= i_data;
        o_data <= i_data;
      end else begin
        o_data <= mem[i_addr]; 
      end
    end
  end
  /*
  // Port A
  always_ff @(posedge i_clk) begin : proc_port_a

    if (i_we_a) begin 
      if (i_addr_a != i_addr_b || ~i_we_b) mem[i_addr_a] <= i_data_a;
      o_data_a <= i_data_a;
    end else begin
      if (i_we_b && i_addr_a == i_addr_b) o_data_a <= i_data_b;
      else o_data_a <= mem[i_addr_a];
    end

  end


  // Port B
  always_ff @(posedge i_clk) begin : proc_port_b

    if (i_we_b) begin
      if (i_addr_b != i_addr_a || ~i_we_a) mem[i_addr_b] <= i_data_b;
      o_data_b <= i_data_b;
    end else begin
      if (i_we_a && i_addr_b == i_addr_a) o_data_b <= i_data_a;
      else o_data_b <= mem[i_addr_b];
    end

  end
  */

endmodule
