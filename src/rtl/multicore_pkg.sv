//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 02/16/2019 03:48:47 PM
// Design Name: 
// Module Name: multicore_pkg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Keeps the type and structures used in the multicore processor
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


package multicore_pkg;

  // The size of the instructions
  localparam INST_SIZE = 32;

  // The size of the data in the processor
  localparam DATA_SIZE = 32;

  // The number of registers in the register file
  localparam NUM_REGS = 32;

  // The size of the cache sets in # of lines
  localparam WORDS_PER_LINE = 8;

  // The size in bytes of each line
  localparam LINE_SIZE = WORDS_PER_LINE * INST_SIZE / 8;

  // The byte offset per each word, given minimum size
  localparam OFFSET = $clog2(INST_SIZE / 8);

  // The bits required for each word within each line
  localparam WORD_BITS = $clog2(LINE_SIZE) - OFFSET;

  localparam logic [6:0] NOOP_CODE = 'b0010011; 

  // Defines the opcode types for RISC V
  typedef enum logic [6:0] {
    LOADS      = 'b0000011,
    STORES     = 'b0100011,

    // Arithmetic, logical, and compare immediate/register
    ALC_I      = 'b0010011,
    ALC_R      = 'b0110011,

    BRANCHES   = 'b1100011,
    LUI        = 'b0110111,
    AUIPC      = 'b0010111,
    JAL        = 'b1101111,
    JALR       = 'b1100111,

    SYNCH      = 'b0001111,
    SYSTEM     = 'b1110011
  } t_opcode;


  // Defines the different execution units that are present in the execute stage
  typedef enum logic [1:0] {
    ALU         = 'b00,
    BRANCH      = 'b01,
    SYSTEM_UNIT = 'b10
  } t_exe_unit;

  // Defines the alu code types for the alu implemented
  typedef enum logic [3:0] {
    ADD  = 'b0000,
    SUB  = 'b1000,
    SLL  = 'b0001,
    SLT  = 'b0010,
    SLTU = 'b0011,
    XOR  = 'b0100,
    SRL  = 'b0101,
    SRA  = 'b1101,
    OR   = 'b0110,
    AND  = 'b0111
  } t_aluop;

  // Defines the branch opcode types for the branch compare in the execute stage, includes JALR
  typedef enum logic [2:0] {
    BEQ = 'b000,
    BNE = 'b001,
    BLT = 'b100,
    BGE = 'b101,
    BLTU = 'b110,
    BGEU = 'b111
  } t_brop;

  // Defines the system opcode types for the system unit in the execute stage
  typedef enum logic [2:0] {
    RDCYCLE    = 'b000,
    RDCYCLEH   = 'b001,
    RDTIME    = 'b010,
    RDTIMEH    = 'b011,
    RDINSTRET  = 'b100,
    RDINSTRETH = 'b101,
    SCALL      = 'b110,
    SBREAK     = 'b111
  } t_sysop;

  // Defines the control unit types for the different types of loads (byte, half, word, unsigned variants)
  typedef enum logic [2:0] {
    LB  = 'b000,
    LH  = 'b001,
    LW  = 'b010,
    LBU = 'b100,
    LHU = 'b101
  } t_ldop;

  // Defines the control unit types for the different types of stores (byte, half, word)
  typedef enum logic [1:0] {
    SB = 'b00,
    SH = 'b01,
    SW = 'b10
  } t_sop;

endpackage : multicore_pkg
