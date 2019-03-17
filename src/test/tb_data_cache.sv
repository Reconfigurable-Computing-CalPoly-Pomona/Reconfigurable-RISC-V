`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 03/09/2019 12:04:05 PM
// Design Name: 
// Module Name: tb_data_cache
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:
// Creates a test bench for the data cache in order to test functionality with
// reads and writes to a cache. Along with write back functionalities.
// 
// Dependencies: 
// data_cache
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;
import axi_defines::*;

module tb_data_cache();

  // The address size used for the test
  localparam ADDR_SIZE = 32;

  // Sets the clock speed used for the test
  localparam CLK_PER = 10ns;

  // Sets the time that the reset is deasserted at the start of the test
  localparam RESET_HIGH = 10.1ns;

  // Cache size to test
  localparam CACHE_SIZE = 2**14;

  // The associativity to test
  localparam BLK_PER_SET = 1;

  /////////////////////////////////////////////////////////////////
  // Local parameters for data cache test
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
  localparam CACHE_DEPTH = WAY_SIZE / (WORDS_PER_LINE * DATA_SIZE / 8);

  // The width used for the block RAM including data, tags, valid, and dirty bits
  localparam CACHE_WIDTH = 1 + 1 + TAG_BITS + DATA_SIZE * WORDS_PER_LINE;

  typedef struct packed {
    logic dirty;
    logic valid;
    logic [TAG_BITS - 1:0] tag;
    logic [WORDS_PER_LINE - 1:0] [DATA_SIZE - 1:0] data;
  } data_blk_t;

  // The testing clock
  logic clk = 0;

  // The asynchrnous reset
  logic areset_n = 0;

  // The axi interface, master signals will be asserted upon, and slave signals will be controlled
  axi_inf axi();


  // Test Signals

  // The request to send into the data cache
  logic req;

  // The request is a write/store request
  logic req_store;

  // The cache ready to accept a new address
  logic req_ready;

  // The data address to request load or stores
  logic [31:0] data_addr;

  // Indicates output from the DUT is valid
  logic data_valid;

  // The data from the DUT after requesting
  logic [DATA_SIZE - 1:0] data;

  // The expected data, to compare to the real data
  logic [DATA_SIZE - 1:0] exp_data;

  // The data to store within the cache during a write request
  logic [DATA_SIZE - 1:0] store_data;

  // Most signficant bits of address, which are compared for a hit or miss
  logic [TAG_BITS - 1:0] tag;

  // The index which determines which index of the cache RAM will contain the value
  logic [INDEX_BITS - 1:0] index;

  // The expected AXI address to be sent during a miss
  logic [31:0] axi_addr;

  // Models the least recently used bits
  bit [BLK_PER_SET - 1:0] model_plru [CACHE_DEPTH - 1:0] = '{default:0};

  // Contains model caches to simulate what the real cache should look like
  data_blk_t [BLK_PER_SET - 1:0] model_cache [CACHE_DEPTH - 1:0] = '{default:0};

  // Determines if there is a hit in the model cache
  logic [BLK_PER_SET - 1:0] hit;

  // Determines the way that was hit
  logic [$clog2(BLK_PER_SET) - 1:0] sel_way;

  //---------------------------------------------------------------------------
  // DUT
  //--------------------------------------------------------------------------

  data_cache #(
    .ADDR_SIZE(32),
    .CACHE_SIZE(CACHE_SIZE),
    .BLK_PER_SET(BLK_PER_SET)
  ) dut(
    // System Clock and reset
    .i_aclk(clk),
    .i_areset_n(areset_n),
    // AXI
    .axi(axi),
    // Request for data by memory stage
    .i_req(req),
    // Send write requests
    .i_req_write(req_store),
    // The data to store during a store request
    .i_store_data(store_data),
    // Cache is ready for a new request
    .o_req_ready(req_ready),
    // Program counter stimulus
    .i_addr(data_addr),
    // Indicates that o_data is valid
    .o_data_valid(data_valid),
    // The data obtained from the cache DUT
    .o_data(data)
  );

  //---------------------------------------------------------------------------
  // Main
  //---------------------------------------------------------------------------

  // Generate a clock signal
  always #CLK_PER clk = ~clk;

  initial begin : stimulus
    {req, data_addr, req_store} = 0;
    {axi.r, axi.arready, axi.awready, axi.wready, axi.b.valid} = 0;
    #RESET_HIGH areset_n = 1;
    for (int addr=0; addr < CACHE_SIZE * 2; addr=addr+4) begin
      req = 0;
      hit = 0; #1
      // Test 1, address is incrementing in an ideal fashion
      if (addr < CACHE_SIZE) data_addr = addr;
      // Test 2, randomly target addresses
      // The random values do not take up the full 32 bits, or else this would result in misses
      // constantly occuring, rather, it's best to have a mix of misses and hits by only allowing
      // a few of the tag bits to be randomized
      else data_addr[$size(data_addr) - TAG_BITS - 1 + 2:0] = $urandom();
      do begin
        req_store = $urandom();
        store_data = $urandom();
        req = $urandom(); @(posedge(clk));
      end while(~req);
      if (addr == 0) $display("Test 1: Incrementing data address in ideal fashion.");
      else if (addr == CACHE_SIZE) $display("Test 2: Random data addresses");

      index = data_addr[INDEX_BITS + WORD_BITS + OFFSET - 1:WORD_BITS + OFFSET];
      tag = data_addr[$size(data_addr) - 1:INDEX_BITS + WORD_BITS + OFFSET];

      for (int w=0; w < BLK_PER_SET; w++) begin
        if (model_cache[index][w].valid && model_cache[index][w].tag == tag) begin
          hit[w] = 1;
          // Set the expected data if there is a hit
          sel_way = w;
          if (model_plru[index] == '1) model_plru[index] = 0;
          model_plru[index][sel_way] = 1;
          if (req_store) begin
            model_cache[index][sel_way].dirty = 1;
            model_cache[index][sel_way].data[data_addr[WORD_BITS + OFFSET - 1:OFFSET]] = store_data;
          end
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
        if (model_cache[index][sel_way].dirty) begin
          axi.awready = 1;
          wait(axi.aw.valid == 1); @(posedge(clk));
          axi_addr = 0;
          axi_addr[$size(axi.ar.addr) - 1:WORD_BITS + OFFSET] = {tag, index};
          assert (axi.aw.addr == axi_addr) else
            $fatal(1,"Send memory address was %h, expected %h!", axi.aw.addr, axi_addr);
          axi.awready = 0;
          for (int i=0; i < WORDS_PER_LINE; i++) begin
            axi.wready = 1;

            wait(axi.w.valid == 1); @(posedge(clk));
            assert(axi.w.data == model_cache[index][sel_way].data[i]) else $fatal(1,
              "Write back data was %h, expected %h", axi.w.data, model_cache[index][sel_way].data[i]);
            if (i == WORDS_PER_LINE - 1) begin
              assert(axi.w.last) else $fatal(1, "AXI last was not asserted on last beat!");
            end
          end
          axi.b.valid = 1;
          wait(axi.bready == 1); @(posedge(clk));
          axi.wready = 0;
          axi.b.valid = 0;
        end
        axi.arready = 1;
        wait(axi.ar.valid == 1); @(posedge(clk));
        axi_addr = 0;
        axi_addr[$size(axi.ar.addr) - 1:WORD_BITS + OFFSET] = {tag, index};
        assert (axi.ar.addr == axi_addr) else
          $fatal(1,"Send memory address was %h, expected %h!", axi.ar.addr, axi_addr);
        axi.arready = 0;
        // Generate a random data
        exp_data = $urandom();
        for (int i=0; i < WORDS_PER_LINE; i++) begin
          axi.r.valid = 1;
          if (i == WORDS_PER_LINE - 1) axi.r.last = 1;
          else axi.r.last = 0;
          axi.r.data = exp_data + 4*i;
          model_cache[index][sel_way].dirty = 0;
          model_cache[index][sel_way].valid = 1;
          model_cache[index][sel_way].tag = tag;
          model_cache[index][sel_way].data[i] = exp_data + 4*i;
          wait(axi.rready == 1) @(posedge(clk));
        end
        if (req_store) begin
          model_cache[index][sel_way].dirty = 1;
          model_cache[index][sel_way].data[data_addr[WORD_BITS + OFFSET - 1:OFFSET]] = store_data;
        end
      end 
      axi.r.valid = 0;
      wait(data_valid == 1);
      #1
      if (~req_store) begin
        assert (data == model_cache[index][sel_way].data[data_addr[WORD_BITS + OFFSET - 1:OFFSET]]) else
          $fatal(1,"data was %h, expected %h!", data, exp_data + data_addr[WORD_BITS + OFFSET - 1:0]);
      end
    end
    req = 0;

    repeat(5) @(posedge(clk));
    $display("Tests Completed!"); $stop;
  end : stimulus
endmodule
