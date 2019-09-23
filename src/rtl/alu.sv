`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 03/24/2019 10:29:37 AM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// The arthimetic logic unit to handle simple operations between two registers
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;

module alu(
  input t_aluop i_funct,
  input logic signed [DATA_SIZE - 1:0] i_op_a,
  input logic signed [DATA_SIZE - 1:0] i_op_b,
  output logic signed [DATA_SIZE - 1:0] o_result
);

  always_comb begin : proc_calculate
    unique case(i_funct)
      ADD        : o_result = i_op_a + i_op_b;
      SUB        : o_result = i_op_a - i_op_b;
      SLL        : o_result = i_op_a << i_op_b;
      SLT        : o_result = i_op_a < i_op_b;
      SLTU       : o_result = $unsigned(i_op_a) < $unsigned(i_op_b);
      XOR        : o_result = i_op_a ^ i_op_b;
      SRL        : o_result = i_op_a >> i_op_b;
      SRA        : o_result = i_op_a >>> i_op_b;
      OR         : o_result = i_op_a | i_op_b;
      AND        : o_result = i_op_a & i_op_b;
      default    : o_result = 'x;
    endcase
  end
endmodule
