`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 02/22/2019 09:16:38 PM
// Design Name: 
// Module Name: tb_instruction_cache
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:
// Creates a test bench for the instruction cache, which simulates a slave memory
// being accessed by the cache, along with a simulated fetch stage
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;
import axi_defines::*;

module tb_instruction_cache();

  // The address size used for the test
  localparam ADDR_SIZE = 32;

  // Sets the clock speed used for the test
  localparam CLK_PER = 10ns;

  // Sets the time that the reset is deasserted at the start of the test
  localparam RESET_HIGH = 10.1ns;

  // Cache size to test
  localparam CACHE_SIZE = 2**14;

  // The associativity to test
  localparam BLK_PER_SET = 2;

  /////////////////////////////////////////////////////////////////
  // Local parameters for instruction cache test
  /////////////////////////////////////////////////////////////////

  // The number of blocks in the cache, given constant block size 
  localparam NUM_BLOCKS = CACHE_SIZE / LINE_SIZE;

  // The block RAM size to represent the particular way of each set
  localparam WAY_SIZE = CACHE_SIZE / BLK_PER_SET;

  // Index for the block # that the address is referring to
  localparam INDEX_BITS = $clog2(WAY_SIZE) - WORD_BITS - OFFSET;

  // The bits dedicated to storing the tag
  // ADDR_SIZE minus the other bits represents the tag, the MSbits of the address
  localparam TAG_BITS = ADDR_SIZE - INDEX_BITS - WORD_BITS - OFFSET;

  // The number of elements in the cache
  localparam CACHE_DEPTH = WAY_SIZE / (WORDS_PER_LINE * INST_SIZE / 8);

  // The width used for the block RAM including instructions, tags, and valids
  localparam CACHE_WIDTH = 1 + TAG_BITS + INST_SIZE * WORDS_PER_LINE;

  typedef struct packed {
    logic valid;
    logic [TAG_BITS - 1:0] tag;
    logic [WORDS_PER_LINE - 1:0] [INST_SIZE - 1:0] data;
  } inst_blk_t;

  // The testing clock
  logic clk = 0;

  // The asynchrnous reset
  logic areset_n = 0;

  // The axi interface, master signals will be asserted upon, and slave signals will be controlled
  axi_inf axi();


  // Test Signals

  // The request to send into the instruction cache
  logic req;

  // The cache ready to accept a new address
  logic req_ready;

  // The program counter stimulating the instruction cache
  logic [31:0] pc;

  // Indicates output from the DUT is valid
  logic instr_valid;

  // The instruction from the DUT after requesting
  logic [INST_SIZE - 1:0] instruction;

  // The expected instruction, to compare to the real instruction
  logic [INST_SIZE - 1:0] exp_instruction;


  // Most signficant bits of address, which are compared for a hit or miss
  logic [TAG_BITS - 1:0] tag;

  // The index which determines which index of the cache RAM will contain the value
  logic [INDEX_BITS - 1:0] index;

  // The expected AXI address to be sent during a miss
  logic [31:0] axi_addr;

  // Models the least recently used bits
  bit [BLK_PER_SET - 1:0] model_plru [CACHE_DEPTH - 1:0] = '{default:0};

  // Contains model caches to simulate what the real cache should look like
  inst_blk_t [BLK_PER_SET - 1:0] model_cache [CACHE_DEPTH - 1:0] = '{default:0};

  // Determines if there is a hit in the model cache
  logic [BLK_PER_SET - 1:0] hit;

  // Determines the way that was hit
  logic [$clog2(BLK_PER_SET) - 1:0] sel_way;

  //---------------------------------------------------------------------------
  // DUT
  //--------------------------------------------------------------------------

  instruction_cache #(
    .ADDR_SIZE(32),
    .CACHE_SIZE(CACHE_SIZE),
    .BLK_PER_SET(BLK_PER_SET)
  ) dut(
    // System Clock and reset
    .i_aclk(clk),
    .i_areset_n(areset_n),
    // AXI
    .axi(axi),
    // Request for instruction by instruction fetch stage
    .i_req(req),
    // Cache is ready for a new request
    .o_req_ready(req_ready),
    // Program counter stimulus
    .i_addr(pc),
    // Indicates that o_instruction is valid
    .o_instr_valid(instr_valid),
    // The instruction obtained from the cache DUT
    .o_instruction(instruction)
  );

  //---------------------------------------------------------------------------
  // Main
  //---------------------------------------------------------------------------

  // Generate a clock signal
  always #CLK_PER clk = ~clk;

  initial begin : stimulus
    {req, pc} = 0;
    {axi.r, axi.arready, axi.awready, axi.wready, axi.b.valid} = 0;
    #RESET_HIGH areset_n = 1;
    for (int addr=0; addr < CACHE_SIZE * 2; addr=addr+4) begin
      hit = 0; #1
      // Test 1, address is incrementing in an ideal fashion
      if (addr < CACHE_SIZE) pc = addr;
      // Test 2, randomly target addresses
      // The random values do not take up the full 32 bits, or else this would result in misses
      // constantly occuring, rather, it's best to have a mix of misses and hits by only allowing
      // a few of the tag bits to be randomized
      else pc[$size(pc) - TAG_BITS - 1 + 2:0] = $urandom();

      // Randomly de-assert request
      do begin
        req = $urandom(); @(posedge(clk));
      end while(~req);

      if (addr == 0) $display("Test 1: Incrementing PC in ideal fashion.");
      else if (addr == CACHE_SIZE) $display("Test 2: Random PC addresses");

      index = pc[INDEX_BITS + WORD_BITS + OFFSET - 1:WORD_BITS + OFFSET];
      tag = pc[$size(pc) - 1:INDEX_BITS + WORD_BITS + OFFSET];
      @(posedge(clk));

      for (int w=0; w < BLK_PER_SET; w++) begin
        if (model_cache[index][w].valid && model_cache[index][w].tag == tag) begin
          hit[w] = 1;
          // Set the expected instruction if there is a hit
          sel_way = w;
          if (model_plru[index] == '1) model_plru[index] = 0;
          model_plru[index][sel_way] = 1;
        end
      end
      // If there is expected to be a miss based on known previous sent commands
      // Then AXI cmds must be performed
      if (~|hit) begin
        // Select the way that the replacement will go into
        sel_way = BLK_PER_SET - 1;
        for (int w=0; w < BLK_PER_SET; w++) begin
          if (model_plru[index][w] == 0) sel_way = w;
        end
        // As the DUT cache is filled, fill the model cache
        if (model_plru[index] == '1) model_plru[index] = 0;
        model_plru[index][sel_way] = 1;
        axi.arready = 1;
        wait(axi.ar.valid == 1); @(posedge(clk));
        axi_addr = 0;
        axi_addr[$size(axi.ar.addr) - 1:WORD_BITS + OFFSET] = {tag, index};
        assert (axi.ar.addr == axi_addr) else
          $fatal(1,"Send memory address was %h, expected %h!", axi.ar.addr, axi_addr);
        axi.arready = 0;
        // Generate a random instruction
        exp_instruction = $urandom();
        for (int i=0; i < WORDS_PER_LINE; i++) begin
          axi.r.valid = 1;
          if (i == WORDS_PER_LINE - 1) axi.r.last = 1;
          else axi.r.last = 0;
          axi.r.data = exp_instruction + 4*i;
          model_cache[index][sel_way].valid = 1;
          model_cache[index][sel_way].tag = tag;
          model_cache[index][sel_way].data[i] = exp_instruction + 4*i;
          wait(axi.rready == 1) @(posedge(clk));
        end
      end 

      axi.r.valid = 0;
      wait(instr_valid == 1)

      assert (instruction == model_cache[index][sel_way].data[pc[WORD_BITS + OFFSET - 1:OFFSET]]) else
        $fatal(1,"Instruction was %h, expected %h!", instruction, exp_instruction + pc[WORD_BITS + OFFSET - 1:0]);

    end
    req = 0;

    repeat(5) @(posedge(clk));
    $display("Tests Completed!"); $stop;
  end : stimulus
endmodule
