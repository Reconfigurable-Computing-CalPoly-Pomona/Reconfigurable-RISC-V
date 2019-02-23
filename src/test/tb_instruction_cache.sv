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

  // Sets the clock speed used for the test
  localparam CLK_PER = 1ns;

  // Sets the time that the reset is deasserted at the start of the test
  localparam RESET_HIGH = 10.1ns;

  // Cache size to test
  localparam CACHE_SIZE = 2**14;

  // The associativity to test
  localparam BLK_PER_SET = 2;

  // The testing clock
  logic clk = 0;

  // The asynchrnous reset
  logic areset_n = 0;

  // The axi interface, master signals will be asserted upon, and slave signals will be controlled
  axi_inf axi();


  // Test Signals

  // The request to send into the instruction cache
  logic req;

  // The program counter stimulating the instruction cache
  logic [31:0] pc;

  // Indicates output from the DUT is valid
  logic instr_valid;

  // The instruction from the DUT after requesting
  logic [INST_SIZE - 1:0] instruction;


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
    {axi.r, axi.arready, axi.awready, axi.wready} = 0;
    #RESET_HIGH areset_n = 1;


  end : stimulus
endmodule
