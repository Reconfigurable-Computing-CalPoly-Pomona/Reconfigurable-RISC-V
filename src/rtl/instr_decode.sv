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

  // The address of the program counter + 4, to be used in branch/jump calculations
  input logic [INST_SIZE - 1:0] i_pcplus4,

  // If the branch/jump is valid, then this address will become the new address to fetch
  output logic [ADDR_SIZE - 1:0] o_branch_addr,

  // Denotes if the branch address from the decode stage is valid (branch taken/jump)
  output logic o_branch_valid,

  // The write back enable from the write back stage, updates the register file
  input logic i_wb,

  // The write back data from the write back stage, updates the register file
  input signed [DATA_SIZE - 1:0] i_wb_data,

  // The address to write to the register file
  input logic [$clog2(NUM_REGS) - 1:0] i_wb_addr,

  // The hazard unit requesting that the register data be obtained via forwarding
  input logic i_forward_a,

  // The hazard unit requesting that the register b data be obtained via forwarding
  input logic i_forward_b,

  // The forward data for register a
  input signed [DATA_SIZE - 1:0] i_fdata_a,

  // The forward data for register b
  input signed [DATA_SIZE - 1:0] i_fdata_b,


  // The outputs to the execute stage

  // The data obtained from forward/register file register a
  output signed [DATA_SIZE - 1:0] o_rd1,

  // The data obtained from forward/register file register a
  output signed [DATA_SIZE - 1:0] o_rd2,

  // The sign-extended immediate data
  output signed [DATA_SIZE - 1:0] o_immediate

);

  // The register file which holds the registers
  logic [$clog2(NUM_REGS) - 1:0][DATA_SIZE - 1:0] reg_file;

  // The registered instruction from fetch
  logic [INST_SIZE - 1:0] instruction;

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

  // Create the decoder/sign extender for any immediates, given certain opcodes
  decode_and_extend #() dsign_extend(
    .i_instr(instruction),
    .o_immediate(o_immediate)
  );

  // Assign the wires connecting to the registered instruction
  assign opcode = instruction[6:0];
  assign rd     = instruction[11:7];
  assign funct3 = instruction[14:12];
  assign rs1    = instruction[19:15];
  assign rs2    = instruction[24:20];
  assign funct7 = instruction[31:25];

  // Multiplex the read data between the forwarded data and the register file
  assign o_rd1 = i_forward_a ? i_fdata_a : reg_file[rs1];
  assign o_rd2 = i_forward_b ? i_fdata_b : reg_file[rs2];


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
