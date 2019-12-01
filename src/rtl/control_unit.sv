`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 03/16/2019 10:42:09 PM
// Design Name: 
// Module Name: control_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:
// The control unit for the pipeline. Resides in the decode stage and takes in
// the instruction opcode and function in order to command other stages to
// perform certain actions. 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;

module control_unit(
  input t_opcode i_op,
  input logic [6:0] i_funct7,
  input logic [2:0] i_funct3,
  input logic [11:0] i_csr,
  output logic o_regwrite,
  output logic [1:0] o_memtoreg,
  output logic o_memwrite,
  output logic o_memaccess,
  output t_aluop o_aluop,
  output logic [1:0] o_alu_srca,
  output logic [1:0] o_alu_srcb,
  output logic o_jalr,
  output t_brop o_brop,
  output t_sysop o_sysop,
  output t_exe_unit o_exe_unit,
  output t_ldop o_ldop,
  output t_sop o_sop
);


  // Determines if the particular operation will write back to the decode register file
  always_comb begin : proc_regwrite
    unique case(i_op)
      LOADS: o_regwrite = 1;
      STORES: o_regwrite = 0;
      ALC_I: o_regwrite = 1;
      ALC_R: o_regwrite = 1;
      BRANCHES: o_regwrite = 0;
      LUI: o_regwrite = 1;
      AUIPC: o_regwrite = 1;
      JAL: o_regwrite = 1;
      JALR: o_regwrite = 1;
      SYNCH: o_regwrite = 0;
      SYSTEM: begin
        unique case (i_funct3)
          // SCALL or SBREAK
          'b000: o_regwrite = 0;
          // RD Counters
          'b010: o_regwrite = 1;
          default: o_regwrite = 0;
        endcase
      end
      default: o_regwrite = 0;
    endcase;
  end

  // Determines if an operation will take data memory to the register (01), or will just use ALU output (00),
  // or will use the current pc (10)
  // Certain outputs are don't care, since the register will not be written regardless
  always_comb begin : proc_memtoreg
    unique case(i_op)
      LOADS: o_memtoreg = 'b01;
      STORES: o_memtoreg = 'x;
      ALC_I: o_memtoreg = 0;
      ALC_R: o_memtoreg = 0;
      BRANCHES: o_memtoreg = 'x;
      LUI: o_memtoreg = 0;
      AUIPC: o_memtoreg = 0;
      JAL: o_memtoreg = 'b10;
      JALR: o_memtoreg = 'b10;
      SYNCH: o_memtoreg = 'x;
      SYSTEM: o_memtoreg = 0;
      default: o_memtoreg = 'x;
    endcase;
  end

  // Determines if an operation will write to the data memory
  always_comb begin : proc_memwrite
    unique case(i_op)
      STORES: o_memwrite = 1;
      default: o_memwrite = 0;
    endcase;
  end

  // Determines if an operation will request access to the data memory
  always_comb begin : proc_memaccess
    unique case(i_op)
      STORES: o_memaccess = 1;
      LOADS : o_memaccess = 1;
      default: o_memaccess = 0;
    endcase;
  end

  // ALU Controls

  // Determines what data will source port A of the ALU
  // Port A will always take register data (0), unless it is the AUIPC or LUI
  // In the case of AUIPC, it will take the program counter (1)
  // In the case of LUI, it will take zeroes for source A (2)
  always_comb begin : proc_alu_srca
    unique case(i_op)
      AUIPC: o_alu_srca = 1;
      LUI: o_alu_srca = 2;
      default: o_alu_srca = 0;
    endcase;
  end

  // Determines what data will source port B of the ALU (registers(0) or immediate(1))
  always_comb begin : proc_alu_srcb
    unique case(i_op)
      LOADS: o_alu_srcb = 1;
      STORES: o_alu_srcb = 1;
      ALC_I: o_alu_srcb = 1;
      ALC_R: o_alu_srcb = 0;
      BRANCHES: o_alu_srcb = 1;
      LUI: o_alu_srcb = 1;
      AUIPC: o_alu_srcb = 1;
      JAL: o_alu_srcb = 'x;
      JALR: o_alu_srcb = 1;
      SYNCH: o_alu_srcb = 'x;
      SYSTEM: o_alu_srcb = 'x;
      default: o_alu_srcb = 'x;
    endcase;
  end

  // Determines the operation (aluop) to perform between register 1/2
  always_comb begin : proc_aluop
    unique case(i_op)
      LOADS: o_aluop = ADD;
      STORES: o_aluop = ADD;
      ALC_I: begin
        unique case(i_funct3)
          'b000: o_aluop = ADD;
          'b001: o_aluop = SLL;
          'b010: o_aluop = SLT;
          'b011: o_aluop = SLTU;
          'b100: o_aluop = XOR;
          'b101: o_aluop = i_funct7[5] ? SRA : SRL;
          'b110: o_aluop = OR;
          'b111: o_aluop = AND;
          default: o_aluop = ADD;
        endcase 
      end
      ALC_R: begin
        unique case(i_funct3)
          'b000: o_aluop = i_funct7[5] ? SUB : ADD;
          'b001: o_aluop = SLL;
          'b010: o_aluop = SLT;
          'b011: o_aluop = SLTU;
          'b100: o_aluop = XOR;
          'b101: o_aluop = i_funct7[5] ? SRA : SRL;
          'b110: o_aluop = OR;
          'b111: o_aluop = AND;
          default: o_aluop = ADD;
        endcase
      end
      LUI: o_aluop = ADD;
      AUIPC: o_aluop = ADD;
      default: o_aluop = ADD;
    endcase;
  end

  // Processes the operation to carry out in the system unit
  always_comb begin : proc_sysop
    unique case(i_op)
      SYSTEM: begin
        unique case(i_funct3)
          'b000: o_sysop = i_csr[0] ? SBREAK : SCALL;
          'b010: begin
            unique case(i_csr)
              'b110000000000: o_sysop = RDCYCLE;
              'b110010000000: o_sysop = RDCYCLEH;
              'b110000000001: o_sysop = RDTIME;
              'b110010000001: o_sysop = RDTIMEH;
              'b110000000010: o_sysop = RDINSTRET;
              'b110010000010: o_sysop = RDINSTRETH;
              default: o_sysop = RDCYCLE;
            endcase
          end
          default: o_sysop = RDCYCLE;
        endcase
      end
      default: o_sysop = RDCYCLE;
    endcase;
  end

  // Determines which unit should be used in the execute stage
  // There should be no "Don't Care", since this is used as a control signal due
  always_comb begin : proc_exe_unit
    unique case(i_op)
      LOADS: o_exe_unit = ALU;
      STORES: o_exe_unit = ALU;
      ALC_I: o_exe_unit = ALU;
      ALC_R: o_exe_unit = ALU;
      BRANCHES: o_exe_unit = BRANCH;
      LUI: o_exe_unit = ALU;
      AUIPC: o_exe_unit = ALU;
      JAL: o_exe_unit = ALU;
      JALR: o_exe_unit = ALU;
      SYNCH: o_exe_unit = ALU;
      SYSTEM: o_exe_unit = SYSTEM_UNIT;
      default: o_exe_unit = ALU;
    endcase;
  end

  // If a branch instruction is decoded, then the execute stage will determine if it is taken or not taken
  always_comb begin : proc_branch_unit
    unique case(i_funct3)
      'b000: o_brop = BEQ;
      'b001: o_brop = BNE;
      'b100: o_brop = BLT;
      'b101: o_brop = BGE;
      'b110: o_brop = BLTU;
      'b111: o_brop = BGEU;
      default: o_brop = BEQ;
    endcase;
  end

  // If a JALR instruction is decoded, then it will be taken during the execution stage
  assign o_jalr = i_op == JALR;

  // Assign which bytes will be written in the memory access stage
  always_comb begin : proc_load_types
    unique case(i_funct3)
      'b000: o_ldop = LB;
      'b001: o_ldop = LH;
      'b010: o_ldop = LW;
      'b100: o_ldop = LBU;
      'b101: o_ldop = LHU;
      default: o_ldop = LW;
    endcase;
  end

  // Assign how many bytes will be stored in the register map
  always_comb begin : proc_store_types
    unique case(i_funct3)
      'b000: o_sop = SB;
      'b001: o_sop = SH;
      'b010: o_sop = SW;
      default: o_sop = SW;
    endcase;
  end

endmodule
