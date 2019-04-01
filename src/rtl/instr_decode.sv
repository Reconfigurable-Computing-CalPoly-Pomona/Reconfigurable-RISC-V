//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 03/16/2019 10:40:50 PM
// Design Name: 
// Module Name: instr_decode
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// The decode stage. Accepts some instruction, if enabled, from the fetch stage.
// Accesses register file for reads and writes. Moves active registers to the execute
// stage along with operation. Checks result of branch instruction and sends address to
// fetch stage.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;

module instr_decode(
  // System clock
  input logic i_aclk,

  // Asynchronous reset
  input logic i_areset_n,

  // Enables the incoming instruction from the fetch stage as valid
  // If this is low, then NoOPs are used
  input logic i_en,

  // The instruction to return to the instruction fetch stage
  input logic [INST_SIZE - 1:0] i_instruction,

  // The address of the current program counter for this stage, used in AUIPC in the ALU stage
  input logic [INST_SIZE - 1:0] i_pc,

  // The address of the program counter + 4, to be used in branch/jump calculations
  input logic [INST_SIZE - 1:0] i_pcplus4,

  // Calculates a new branch address in case the branch or jump is taken
  output logic [INST_SIZE - 1:0] o_branch_addr,

  // Denotes if the branch address from the decode stage is valid (branch taken/jump)
  output logic o_branch_valid,

  // The write back enable from the write back stage, updates the register file
  input logic i_wb,

  // The write back data from the write back stage, updates the register file
  input logic signed [DATA_SIZE - 1:0] i_wb_data,

  // The address to write to the register file
  input logic [$clog2(NUM_REGS) - 1:0] i_wb_addr,

  // The hazard unit requesting that the register data be obtained via forwarding
  input logic i_forward_a,

  // The hazard unit requesting that the register b data be obtained via forwarding
  input logic i_forward_b,

  // The forward data for register a
  input logic signed [DATA_SIZE - 1:0] i_fdata_a,

  // The forward data for register b
  input logic signed [DATA_SIZE - 1:0] i_fdata_b,


  // The outputs to the execute stage

  // The data obtained from forward/register file register a
  output signed [DATA_SIZE - 1:0] o_rd1,

  // The data obtained from forward/register file register a
  output signed [DATA_SIZE - 1:0] o_rd2,

  // The destination register
  output [$clog2(NUM_REGS) - 1:0] o_rdest,

  // The sign-extended immediate data
  output logic signed [DATA_SIZE - 1:0] o_immediate,

  // The current program counter, to be used for the AUIPC instruction
  output logic [INST_SIZE - 1:0] o_pc,

  // The PC + 4 to be passed through to the write back stage for JAL/JALR linkage to register
  output logic [INST_SIZE - 1:0] o_pcplus4,

  // Pipelined control signal to determine if reg file should be written at the end of instruction
  output logic o_cu_regwrite,

  // Pipelined control signal to determine if pc, mem, or alu output will go to the register file
  output logic [1:0] o_cu_memtoreg,

  // Determines if dmem will be written to
  output logic o_cu_memwrite,

  // Determines the alu operation
  output t_aluop o_cu_aluop,

  // Determines the source of operator A for the alu
  output logic o_cu_alu_srca,

  // Determines the source of operator B for the alu
  output logic o_cu_alu_srcb,

  // Indicates if the branch comparison unit, ALU, or system unit should be used in the execute stage
  output t_exe_unit o_cu_exe_unit,

  // The branch comparison units operation from the decoding
  output t_brop o_cu_brop,

  // The system operation task from decoding
  output t_sysop o_cu_sysop,

  // Indicates if the new target address should be calculated in the execution stage
  output logic o_cu_jalr
);

  // The register file which holds the registers
  logic [$clog2(NUM_REGS) - 1:0][DATA_SIZE - 1:0] reg_file;

  // The registered instruction from fetch
  logic [INST_SIZE - 1:0] instruction;

  // The registered program counter plus 4
  logic [INST_SIZE - 1:0] pcplus4;

  // The registered source address for register A
  logic [$clog2(NUM_REGS) - 1:0] rs1;

  // The registered source address for register A
  logic [$clog2(NUM_REGS) - 1:0] rs2;

  // The registered destination address
  logic [4:0] rd;

  // The registered opcode
  t_opcode opcode;

  // The registered function3 corresponding to R/I/S/SB opcodes
  logic [2:0] funct3;

  // The registered function7 corresponding to R type opcodes
  logic [6:0] funct7;

  // Control unit signal, indicates if opcode/funct corresponds to branch
  logic branch;

  // Control unit signal, indiciates if opcode/funct corresponds to jump
  logic jump;

  // Output of branch comparison, valid if the opcode is a branch
  logic compare_true;

  // Create the decoder/sign extender for any immediates, given certain opcodes
  decode_and_extend #() dsign_extend(
    .i_instr(instruction),
    .i_op(opcode),
    .i_jalr_reg(o_rd1),
    .o_immediate(o_immediate)
  );

  // Sets the controls for other stages in the pipeline based on the operatoin
  control_unit #() control_u(
    .i_op(opcode),
    .i_funct7(funct7),
    .i_funct3(funct3),
    .i_csr(instruction[31:20]),
    .o_regwrite(o_cu_regwrite),
    .o_memtoreg(o_cu_memtoreg),
    .o_memwrite(o_cu_memwrite),
    .o_aluop(o_cu_aluop),
    .o_alu_srca(o_cu_alu_srca),
    .o_alu_srcb(o_cu_alu_srcb),
    .o_exe_unit(o_cu_exe_unit),
    .o_brop(o_cu_brop),
    .o_sysop(o_cu_sysop),
    .o_jalr(o_cu_jalr)
  );

  // If a JAL instruction occurs, then the new branch address can be given to the IF stage
  // This is also where a branch predictor could deliver its prediction
  assign o_branch_valid = opcode == JAL;


  // Convert to opcode enumeration
  always_comb begin : op_enumerate
    unique case(instruction[6:0])
      'b0000011: opcode = LOADS;
      'b0100011: opcode = STORES;
      'b0010011: opcode = ALC_I;
      'b0110011: opcode = ALC_R;
      'b1100011: opcode = BRANCHES;
      'b0110111: opcode = LUI;
      'b0010111: opcode = AUIPC;
      'b1101111: opcode = JAL;
      'b1100111: opcode = JALR;
      'b0001111: opcode = SYNCH;
      'b1110011: opcode = SYSTEM;
      default:   opcode = ALC_I;
    endcase
  end

  // Assign the wires connecting to the registered instruction
  assign o_rdest = instruction[11:7];
  assign funct3  = instruction[14:12];
  assign rs1     = instruction[19:15];
  assign rs2     = instruction[24:20];
  assign funct7  = instruction[31:25];

  // Multiplex the read data between the forwarded data and the register file
  assign o_rd1 = i_forward_a ? i_fdata_a : reg_file[rs1];
  assign o_rd2 = i_forward_b ? i_fdata_b : reg_file[rs2];

  // Assign the predicted branch or jal address to go back to the fetch state
  assign o_branch_addr = o_pcplus4 + (o_immediate << 2);


  // Latch the instruction from the fetch stage, as long as the enable is asserted
  always_ff @(posedge i_aclk or negedge i_areset_n) begin : proc_instr
    if(~i_areset_n) begin
      // On reset, do ADDI x0, x0, 0;
      instruction <= 0;
      instruction[6:0] <= NOOP_CODE;
    end else begin
      if (i_en) begin
        instruction <= i_instruction;
      end else begin
        instruction <= 0;
        instruction[6:0] <= NOOP_CODE;
      end
    end
  end

  // Register the pc + 4 address
  always_ff @(posedge i_aclk) begin : proc_pcplus4
    o_pcplus4 <= i_pcplus4;
    o_pc <= i_pc;
  end

  // Create a register file which holds register zero + GPRs
  // If data is received from the WB stage, it gets written and immediately forwarded
  always_ff @(posedge i_aclk or negedge i_areset_n) begin : proc_regfile
    if(~i_areset_n) begin
      // Register zero is held to zero during reset
      reg_file[0] <= 0;
    end else begin
      // Write to the register when write back is valid, unless it is r0
      if (i_wb_addr != 0 && i_wb) reg_file[i_wb_addr] <= i_wb_data; 
    end
  end
endmodule