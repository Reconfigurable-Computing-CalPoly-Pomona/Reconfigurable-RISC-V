`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 04/21/2019 11:37:42 AM
// Design Name: multicore
// Module Name: hazard_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:
// Handles data, control, and structural hazards that occur as a part of the pipelining
// nature of the processor
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;

module hazard_unit(

  ///////////////////////////////
  // Instruction unit
  ///////////////////////////////

  // Indicates that the fetch instruction is valid
  input logic i_fetch_instr_valid,

  // The address to send to the instruction unit
  output logic [31:0] o_br_addr,

  // Indicates the branch is valid and should be used as the next instruction given to the decode stage
  output logic o_br_valid,

  // Enables the fetch unit, when disabled, no instruction is fetched
  output logic o_fetch_en,

  ///////////////////////////////
  // Decode unit  
  ///////////////////////////////

  // Branch address given from decode unit
  input logic [31:0] i_decode_br_addr,

  // Branch valid
  input logic i_decode_br_valid,

  // The decode unit's instruction pointer, used for determining mispredictions
  input logic [31:0] i_decode_pc,

  // The address of the register access for port A
  logic [$clog2(NUM_REGS) - 1:0] i_decode_rs1,

  // The address of the register access for port B
  logic [$clog2(NUM_REGS) - 1:0] i_decode_rs2,

  // Multiplexer controller to determine which data should be used in the decode stage
  // 00 - No forwarding
  // 01 - Forward Memory access stage (after alu computation)
  // 10 - Forward write back stage
  output logic [1:0] o_decode_fwd_a,

  // Multiplexer controller to determine which data should be used in the decode stage
  // 00 - No forwarding
  // 01 - Forward Memory access stage (after alu computation)
  // 10 - Forward write back stage
  output logic [1:0] o_decode_fwd_b,

  // Enables the decode unit, when disabled, no new instructions will be obtained
  output logic o_decode_en,

  // Flushes the decode unit, replacing incoming instruction with No-Op
  output logic o_decode_flush,

  ///////////////////////////////
  // Execution Unit   
  ///////////////////////////////

  // Branch address given from execution unit
  input logic [31:0] i_execute_br_addr,

  // Branch valid from execution unit
  input logic i_execute_br_valid,

  // The source register A location utilized in the execution unit
  input logic [$clog2(NUM_REGS) - 1:0] i_exe_rs1,

  // The source register B location utilized in the execution unit
  input logic [$clog2(NUM_REGS) - 1:0] i_exe_rs2,

  // Multiplexer controller to determine which data should be used in the execute stage
  // 00 - No forwarding
  // 01 - Forward Memory access stage
  // 10 - Forward write back stage
  output logic [1:0] o_exe_fwd_a,

  // Multiplexer controller to determine which data should be used in the execute stage
  // 00 - No forwarding
  // 01 - Forward Memory access stage
  // 10 - Forward write back stage
  output logic [1:0] o_exe_fwd_b,

  // Enables the execution unit, when disabled, the internal state and instruction of the execute stage will be held
  output logic o_exe_en,

  // Flushes the execution unit, causing No-Op instruction to be output
  output logic o_exe_flush,

  ///////////////////////////////
  // Memory Access
  ///////////////////////////////

  // Indicates memory access cache is ready for next request
  input logic i_ma_cache_ready,

  // Determines if the data memory will be accessed (Control unit)
  input logic i_ma_memaccess,

  // Determines if the register file will be written (Control unit)
  input logic i_ma_regwrite,

  // Pipelined control signal to determine if pc, mem, or alu output will go to the register file  (Control unit)
  input logic [1:0] i_ma_memtoreg,

  // The write back destination for the memory access unit
  input logic [$clog2(NUM_REGS) -1:0] i_ma_rdest,

  // Indicates the last request for the cache (Read or store)
  input logic i_ma_store,

  // Enables the memory access unit
  output logic o_ma_en,

  // The data from the memory access unit that was calculated from the ALU unit
  input logic [DATA_SIZE - 1:0] i_ma_exe_data,

  // The data from the cache of the memory access unit
  input logic [DATA_SIZE - 1:0] i_ma_mem_data,

  // The pcplus4 data from the memory access unit
  input logic [INST_SIZE - 1:0] i_ma_pcplus4,

  // The data to be used for forwarding from the memory access unit
  output logic [DATA_SIZE - 1:0] o_ma_fwd,

  ///////////////////////////////
  // Write back
  ///////////////////////////////

  // Indicates the write back stage will write into the register file
  input logic i_wb_regwrite,

  // The write back destination for the write back unit
  input logic [$clog2(NUM_REGS) -1:0] i_wb_rdest

);


  // Priority encoder for branching. If a branch occurs in the execute stage, then the decode branch is nullfied
  assign o_br_valid = i_execute_br_valid | i_decode_br_valid;
  assign o_br_addr  = i_execute_br_valid ? i_execute_br_addr : i_decode_br_addr;

  // In case of a store, disables the memory access unit only when there is a data access request, but the cache is not ready
  // In the case of a load, if the data memory is not ready, then the data has not been found and may be needed by other instructions, so a stall will occur
  //assign o_ma_en = i_ma_store ? ((i_ma_memaccess & i_ma_cache_ready) | ~i_ma_memaccess) : i_ma_cache_ready;
  assign o_ma_en = i_ma_cache_ready;

  // Flushes the execute stage when a branch has been mispredicted
  //assign o_exe_en = i_decode_pc == i_execute_br_addr || ~i_execute_br_valid;

  // TODO
  assign o_fetch_en = o_ma_en;
  assign o_decode_en = o_ma_en;
  assign o_exe_en = o_ma_en;
  //assign o_decode_en = i_fetch_instr_valid & ~o_br_valid;

  assign o_decode_flush = ~i_fetch_instr_valid | o_br_valid;
  assign o_exe_flush = i_decode_pc != i_execute_br_addr && i_execute_br_valid;

  // Decode stage forwarding - Mux A
  always_comb begin : proc_decode_fwd_a

    // Determine the forwarding logic, either take the data from the decode stage(no forward), memory access, or writeback
    if (i_ma_rdest == i_decode_rs1 && i_decode_rs1 != 0 && i_ma_regwrite) begin //&& (i_ma_memtoreg == 'b00 || i_ma_memtoreg == 'b10)) begin
      // The register in the decode stage matches the register in the memory access stage and the instruction in the MA stage is writing to a register with ALU or PCPLUS4 data
      o_decode_fwd_a = 'b01;
    end else if (i_wb_rdest == i_decode_rs1 && i_decode_rs1 != 0 && i_wb_regwrite) begin
      // The write back unit will be writing to the register at the same time it is being read from this cycle, forward the data
      o_decode_fwd_a = 'b10; 
    end else begin
      // No forwarding will occur for this port
      o_decode_fwd_a = 0;
    end
  end

  // Decode stage forwarding - Mux B
  always_comb begin : proc_decode_fwd_b

    // Determine the forwarding logic, either take the data from the decode stage(no forward), memory access, or writeback
    if (i_ma_rdest == i_decode_rs2 && i_decode_rs2 != 0 && i_ma_regwrite) begin //&& (i_ma_memtoreg == 'b00 || i_ma_memtoreg == 'b10)) begin
      // The register in the decode stage matches the register in the memory access stage and the instruction in the MA stage is writing to a register with ALU or PCPLUS4 data
      o_decode_fwd_b = 'b01;
    end else if (i_wb_rdest == i_decode_rs2 && i_decode_rs2 != 0 && i_wb_regwrite) begin
      // The write back unit will be writing to the register at the same time it is being read from this cycle, forward the data
      o_decode_fwd_b = 'b10; 
    end else begin
      // No forwarding will occur for this port
      o_decode_fwd_b = 0;
    end
  end

  // Execution stage forwarding - Mux A
  always_comb begin : proc_exe_fwd_a

    // Determine the forwarding logic, either take the data from the execute stage(no forward), memory access, or writeback
    if (i_ma_rdest == i_exe_rs1 && i_exe_rs1 != 0 && i_ma_regwrite) begin //&& (i_ma_memtoreg == 'b00 || i_ma_memtoreg == 'b10)) begin
      // The register in the execute stage matches the register in the memory access stage and the instruction in the MA stage is writing to a register with ALU or PCPLUS4 data
      o_exe_fwd_a = 'b01;
    end else if (i_wb_rdest == i_exe_rs1 && i_exe_rs1 != 0 && i_wb_regwrite) begin
      // The write back unit will be writing to the register at the same time it is being read from this cycle, forward the data
      o_exe_fwd_a = 'b10; 
    end else begin
      // No forwarding will occur for this port
      o_exe_fwd_a = 0;
    end
  end

  // Execution stage forwarding - Mux B
  always_comb begin : proc_exe_fwd_b

    // Determine the forwarding logic, either take the data from the execute stage(no forward), memory access, or writeback
    if (i_ma_rdest == i_exe_rs2 && i_exe_rs2 != 0 && i_ma_regwrite) begin //&& (i_ma_memtoreg == 'b00 || i_ma_memtoreg == 'b10)) begin
      // The register in the execute stage matches the register in the memory access stage and the instruction in the MA stage is writing to a register with ALU or PCPLUS4 data
      o_exe_fwd_b = 'b01;
    end else if (i_wb_rdest == i_exe_rs2 && i_exe_rs2 != 0 && i_wb_regwrite) begin
      // The write back unit will be writing to the register at the same time it is being read from this cycle, forward the data
      o_exe_fwd_b = 'b10; 
    end else begin
      // No forwarding will occur for this port
      o_exe_fwd_b = 0;
    end
  end

  // Multiplex the possible register writes from the memory access stage to get the data to forward
  always_comb begin : proc_fwd_ma
    unique case (i_ma_memtoreg)
      'b00: o_ma_fwd = i_ma_exe_data;
      'b01: o_ma_fwd = i_ma_mem_data;
      'b10: o_ma_fwd = i_ma_pcplus4;
      default: o_ma_fwd = 'x;
    endcase;
  end

endmodule
