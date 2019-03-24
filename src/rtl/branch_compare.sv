//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 03/23/2019 03:42:49 PM
// Design Name: 
// Module Name: branch_compare
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Takes in the function for a branch operation and determines if the branch should
// be taken or not.
// 
// Dependencies: 
// None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;

module branch_compare(
  input t_brop i_funct,
  input signed [DATA_SIZE - 1:0] i_r1,
  input signed [DATA_SIZE - 1:0] i_r2,
  output logic o_true
);

  always_comb begin : proc_compare

    unique case(i_funct)
      // BEQ
      'b000: o_true = i_r1 == i_r2;
      // BNE
      'b001: o_true = i_r1 != i_r2;
      // BLT
      'b100: o_true = i_r1 < i_r2;
      // BGE
      'b101: o_true = i_r1 >= i_r2;
      // BLTU
      'b110: o_true = $unsigned(i_r1) < $unsigned(i_r2);
      // BGEU
      'b111: o_true = $unsigned(i_r1) >= $unsigned(i_r2);
      default: o_true = 0;
    endcase
  end
endmodule
