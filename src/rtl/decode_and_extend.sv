`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 03/17/2019 12:33:19 PM
// Design Name: 
// Module Name: decode_and_extend
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Accepts a RISC-V opcode & instruction and sign extends the appropriate
// immediate field to be 32 bits.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decode_and_extend(
  // The instruction
  input logic [INST_SIZE - 1:0] i_instr,

  // The opcode as apart of the instruction
  input t_opcode i_op,

  // The output immediate value
  output logic signed [DATA_SIZE - 1:0] o_immediate

);

  // Decode and sign extend, depending on opcode
  always_comb begin : proc_dextend
    unique case(i_op)
      LOADS:    o_immediate = $signed(i_instr[31:20]);
      STORES:   o_immediate = $signed({i_instr[31:25], i_instr[11:7]});
      ALC_I:    o_immediate = $signed(i_instr[31:20]);
      BRANCHES: o_immediate = $signed({i_instr[31], i_instr[7], i_instr[30:25], i_instr[11:8], 1'b0});
      LUI:      o_immediate = $signed({i_instr[31:12], 12'h0});
      AUIPC:    o_immediate = $signed({i_instr[31:12], 12'h0});
      JAL:      o_immediate = $signed({i_instr[31], i_instr[19:12], i_instr[20], i_instr[30:21], 1'b0});
      JALR:     o_immediate = $signed(i_instr[31:20]);
      
      // If the immediate is not used, set to be don't care
      default:  o_immediate = 'x;
    endcase
  end
endmodule
