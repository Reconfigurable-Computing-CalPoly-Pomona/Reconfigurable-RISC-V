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
  input logic [$clog2(DEPTH) - 1:0] i_addr,
  input logic [DATA_WIDTH - 1:0] i_data,
  input logic i_we,
  output logic [DATA_WIDTH - 1:0] o_data

);

  // The memory, which may be generated using block RAM or distributed RAM
  logic [DATA_WIDTH - 1:0] mem [0:DEPTH - 1];

  always_ff @(posedge i_clk) begin : proc_ram
    if (i_we) begin 
      mem[i_addr] <= i_data;
      o_data <= i_data;
    end else begin
      o_data <= mem[i_addr];
    end
  end

endmodule
