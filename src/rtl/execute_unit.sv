`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 03/23/2019 10:55:31 PM
// Design Name: 
// Module Name: execute_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// The execution unit contains the logic neccessary to determine arithmetic operation,
// branch evaluation, and the target address for JALR jumps
// JALR are calculated from immediate and id_op1
// Branch target is from ID, branch comparison is done in branch comparison unit
// Arithmetic operations are performed in the ALU
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;

module execute_unit(
  // System clock
  input logic i_aclk,

  // Asynchronous reset
  input logic i_areset_n,

  // Enables the incoming instruction from the ID stage as valid
  input logic i_en,

  // Flushes this stage, creating No-Ops as a result
  input logic i_flush,

  // The address of the current program counter for this stage, used for AUIPC in this stage
  input logic [INST_SIZE - 1:0] i_pc,

  // The address of the program counter + 4, to be pipelined to later stage for JAL/JALR linkage
  input logic [INST_SIZE - 1:0] i_pcplus4,

  // The address of the program counter + 4, to be pipelined to later stage for JAL/JALR linkage
  output logic [INST_SIZE - 1:0] o_pcplus4,

  // Takes the calculated branch address from the decode stage, to be passed to fetch if the branch is valid
  input logic [INST_SIZE - 1:0] i_branch_addr,

  // Denotes if the branch address from the execute stage is valid (branch taken or JALR)
  output logic o_branch_valid,

  // The output branch or jump (JALR) address to take when o_branch_valid is asserted
  output logic [INST_SIZE - 1:0] o_branch_addr,

  // The write back destination
  input logic [$clog2(NUM_REGS) -1:0] i_rdest,

  // The write back destination
  output logic [$clog2(NUM_REGS) -1:0] o_rdest,

  // The hazard unit requesting that the operator a can be obtained via forwarding
  // 00 - No forwarding
  // 01 - Forward Memory access stage
  // 10 - Forward write back stage
  input logic [1:0] i_forward_a,

  // The hazard unit requesting that the operator b can be obtained via forwarding
  // 00 - No forwarding
  // 01 - Forward Memory access stage
  // 10 - Forward write back stag
  input logic [1:0] i_forward_b,

  // The source location for the first register data
  input logic [$clog2(NUM_REGS) -1:0] i_id_rs1,

  // The source location for the second register data
  input logic [$clog2(NUM_REGS) -1:0] i_id_rs2,

  // The registered location for the first register data
  output logic [$clog2(NUM_REGS) -1:0] o_id_rs1,

  // The registered location for the second register data
  output logic [$clog2(NUM_REGS) -1:0] o_id_rs2,

  // The data obtained from forward/register file register a
  input logic signed [DATA_SIZE - 1:0] i_id_op1,

  // The data obtained from forward/register file register b
  input logic signed [DATA_SIZE - 1:0] i_id_op2,

  // The forward data from memory access
  input logic signed [DATA_SIZE - 1:0] i_ma_op,

  // The forward data from write back stage
  input logic signed [DATA_SIZE - 1:0] i_wb_op,

  // The immediate data from the decode stage
  input logic signed [DATA_SIZE - 1:0] i_immediate,

  // Pipelined control signal to determine if reg file should be written at the end of instruction
  input logic i_cu_regwrite,

  // Pipelined control signal to determine if pc, mem, or alu output will go to the register file
  input logic [1:0] i_cu_memtoreg,

  // Determines if dmem will be written to
  input logic i_cu_memwrite,

  // Determines if the dmem will be accessed
  input logic i_cu_memaccess,

  // Determines the alu operation
  input t_aluop i_cu_aluop,

  // Determines the source of operator A for the alu
  input logic [1:0] i_cu_alu_srca,

  // Determines the source of operator B for the alu
  input logic [1:0] i_cu_alu_srcb,

  // Indicates if the branch comparison unit should be used in the execute stage
  input t_exe_unit i_cu_exe_unit,

  // The branch comparison units operation from the decoding
  input t_brop i_cu_brop,

  // The system operation from decoding
  input t_sysop i_cu_sysop,

  // The size of the load operation
  input t_ldop i_ldop,

  // The size of the store operation
  input t_sop i_sop,

  // Indicates if the new target address should be calculated in the execution stage
  input logic i_cu_jalr,

  // Memory access stage outputs

  // The output of the calculation units
  output logic [DATA_SIZE - 1:0] o_exe_calc,

  // The write data to pass to the data memory
  output logic [DATA_SIZE - 1:0] o_exe_wdata,

  // Pipelined control signal to determine if reg file should be written at the end of instruction
  output logic o_cu_regwrite,

  // Pipelined control signal to determine if pc, mem, or alu output will go to the register file
  output logic [1:0] o_cu_memtoreg,

  // Determines if dmem will be written to
  output logic o_cu_memwrite,

  // Determines if the dmem will be accessed
  output logic o_cu_memaccess,

  // The size of the load operation
  output t_ldop o_ldop,

  // The size of the store operation
  output t_sop o_sop


);

  // Registered control unit signals

  // When asserted, JALR is the instruction
  logic cu_jalr;

  // Registered view of which unit will be used
  t_exe_unit cu_exe_unit;

  // The ALU operation to perfrom
  t_aluop cu_aluop;

  // The branch operation to perform
  t_brop cu_brop;

  // The system operation to perform
  t_sysop cu_sysop;

  // Pipelined control signal to determine if reg file should be written at the end of instruction
  logic cu_regwrite;

  // Pipelined control signal to determine if pc, mem, or alu output will go to the register file
  logic [1:0] cu_memtoreg;

  // Determines if dmem will be written to
  logic cu_memwrite;

  // Determines the source of operator A for the alu
  logic [1:0] cu_alu_srca;

  // Determines the source of operator B for the alu
  logic [1:0] cu_alu_srcb;

  // Indicates that the branch comparison was true
  logic branch_true;

  // The data obtained from the ID register a
  logic signed [DATA_SIZE - 1:0] id_op1;

  // The data obtained from the ID register b
  logic signed [DATA_SIZE - 1:0] id_op2;

  // The address of the current program counter for this stage, used for AUIPC in this stage
  logic [INST_SIZE - 1:0] pc;

  // The address of the program counter + 4, to be pipelined to later stage for JAL/JALR linkage
  logic [INST_SIZE - 1:0] pcplus4;

  // Takes the calculated branch address from the decode stage, to be passed to fetch if the branch is valid
  logic [INST_SIZE - 1:0] branch_addr;

  // The immediate data from the decode stage
  logic signed [DATA_SIZE - 1:0] immediate;

  // The data obtained from forward/register file register a
  logic signed [DATA_SIZE - 1:0] op_b;

  // The data obtained from forward/register file register b
  logic signed [DATA_SIZE - 1:0] op_a;

  // The data obtained after muxing the operator A with the PC to determine ALU operator A
  logic signed [DATA_SIZE - 1:0] alu_op_a;

  // The data obtained after muxing operator B with the immediate to determine ALU operator B
  logic signed [DATA_SIZE - 1:0] alu_op_b;

  // The data from the ALUnit calculation
  logic signed [DATA_SIZE - 1:0] alu_calc;

  // The data from the system unit calculation
  logic [DATA_SIZE - 1:0] sys_calc;

  // Performs the branch comparisons
  branch_compare #() br_compare(
    .i_funct(cu_brop),
    .i_r1(op_a),
    .i_r2(op_b),
    .o_true(branch_true)
  );

  // Performs arithmetic logic
  alu #() alu_exe(
    .i_funct(cu_aluop),
    .i_op_a(alu_op_a),
    .i_op_b(alu_op_b),
    .o_result(alu_calc)
  );

  // Performs system operations
  system_exe_unit #(.TIME_CNT_PER(1024))
  sys_unit(
    .i_aclk(i_aclk),
    .i_areset_n(i_areset_n),
    .i_op(cu_sysop),
    .o_result(sys_calc)
  );

  // Determines the operations to use based on forwarding
  always_comb begin : proc_forwarding

    // Assign operator A
    unique case(i_forward_a)
      'b00: op_a = id_op1;
      'b01: op_a = i_ma_op;
      'b10: op_a = i_wb_op;
      default: op_a = 'x;
    endcase

    // Assign operator B
    unique case(i_forward_b)
      'b00: op_b = id_op2;
      'b01: op_b = i_ma_op;
      'b10: op_b = i_wb_op;
      default: op_b = 'x;
    endcase

  end

  // Determines the ALU operators
  always_comb begin : proc_alu_operators

    // Assign operator A
    unique case(cu_alu_srca)
      'b00: alu_op_a = op_a;
      // For AUIPC instruction, the PC is needed to be added to the upper immediate
      'b01: alu_op_a = pc;
      // For LUI instruction
      'b10: alu_op_a = 0;
      default: alu_op_a = 'x;
    endcase

    // Assign operator B
    unique case(cu_alu_srcb)
      // Use register value
      'b00: alu_op_b = op_b;
      // Use immediate or shift amount, in the case of shift
      'b01: alu_op_b = (cu_aluop == SRL || cu_aluop == SRA) ? immediate[4:0] : immediate;
      default: alu_op_b = 'x;
    endcase

  end

  // Returns the output result from the execution units
  assign o_exe_calc = (cu_exe_unit == SYSTEM_UNIT) ? sys_calc : alu_calc;

  // The write data to go to the data memory
  assign o_exe_wdata = op_b;

  // The branch address/valid will take either the branch (if correct and valid) or JALR address
  assign o_branch_valid = (branch_true & (cu_exe_unit == BRANCH)) | cu_jalr;
  assign o_branch_addr = (cu_exe_unit == BRANCH) ? branch_addr : o_exe_calc;

  // Processes pipeline registers that should be reset
  always_ff @(posedge i_aclk or negedge i_areset_n) begin : proc_register
    if(~i_areset_n) begin
      {cu_jalr, o_cu_regwrite, o_cu_memwrite, o_cu_memaccess} <= 0;
      cu_exe_unit <= ALU;
    end else begin
      if (i_en) begin
        if (i_flush) begin
          {cu_jalr, o_cu_regwrite, o_cu_memwrite, o_cu_memaccess} <= 0;
          cu_exe_unit <= ALU;
        end else begin
          cu_exe_unit <= i_cu_exe_unit;
          cu_jalr <= i_cu_jalr;
          o_cu_regwrite <= i_cu_regwrite;
          o_cu_memwrite <= i_cu_memwrite;
          o_cu_memaccess <= i_cu_memaccess;
        end
      end
    end
  end

  // Processes pipeline registers that do not need to be reset
  always_ff @(posedge i_aclk) begin : proc_register_no_rst
    if (i_en) begin
      pc <= i_pc;
      pcplus4 <= i_pcplus4;
      branch_addr <= i_branch_addr;
      immediate <= i_immediate;
      id_op1 <= i_id_op1;
      id_op2 <= i_id_op2;
      cu_brop <= i_cu_brop;
      cu_aluop <= i_cu_aluop;
      cu_sysop <= i_cu_sysop;
      cu_alu_srca <= i_cu_alu_srca;
      cu_alu_srcb <= i_cu_alu_srcb;
      o_cu_memtoreg <= i_cu_memtoreg;
      o_rdest <= i_rdest;
      o_pcplus4 <= i_pcplus4;
      o_ldop <= i_ldop;
      o_sop <= i_sop;
      o_id_rs1 <= i_id_rs1;
      o_id_rs2 <= i_id_rs2;
    end
  end

endmodule
