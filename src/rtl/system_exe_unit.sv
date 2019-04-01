//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 03/24/2019 11:17:14 AM
// Design Name: 
// Module Name: system_exe_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// One of the execution units of the execute stage. Handles all SYSTEM operations
// includes registers to keep timers in order to carry out time reporting operations.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import multicore_pkg::*;

module system_exe_unit #(
  // The period of the time counter in number of aclk cycles
  parameter TIME_CNT_PER = 1024
  )(
  // The clock used for the execute unit
  input logic i_aclk,

  // The asynchronous reset used to reset counters
  input logic i_areset_n,

  // The system operation to handle
  input t_sysop i_op,

  // The output, if the operation has an output
  output logic [DATA_SIZE - 1:0] o_result
);

  // The counter that increments every cycle, returns to 0 on reset
  // This counter does not roll over in practice
  logic [63:0] cycle_cnt;

  // This counter keeps a count of the wall clock time, the smallest unit of time is given by the generic
  logic [63:0] time_cnt;

  // Counter to determine when the time_cnt should increment
  logic [$clog2(TIME_CNT_PER) - 1:0]subtime_cnt;

  // Increment time next cycle
  logic time_cnt_incr;

  // This counter keeps a count of all instructions retired by this hardware thread
  // Currently this counter is unused, and will return the same result as the cycle_cnt
  logic [63:0] instret_cnt;

  // Increment the counters
  always_ff @(posedge i_aclk or negedge i_areset_n) begin : proc_counters
    if (~i_areset_n) begin
      {cycle_cnt, time_cnt, instret_cnt, time_cnt_incr, subtime_cnt} <= 0;
    end else begin
      cycle_cnt <= cycle_cnt + 1;
      // Currently the hardware thread instruction retirement counter is just the number of cycles
      instret_cnt <= instret_cnt + 1;

      // Time counter increments whenever the set time period is reached
      time_cnt <= time_cnt + time_cnt_incr;

      // A seperate bit tracks when the time cnt is one cycle away from incrementing to increase maximum speed
      time_cnt_incr <= subtime_cnt == TIME_CNT_PER - 2;
      subtime_cnt <= (subtime_cnt == TIME_CNT_PER - 1) ? 0 : (subtime_cnt + 1);
    end
  end
  
  // Determine the output, if there is one for the system operation
  always_comb begin : proc_calculate
    unique case(i_op)
      RDCYCLE    : o_result = cycle_cnt[31:0];
      RDCYCLEH   : o_result = cycle_cnt[63:32];
      RDTIMEH    : o_result = time_cnt[31:0];
      RDTIMEH    : o_result = time_cnt[63:32];
      RDINSTRET  : o_result = instret_cnt[31:0];
      RDINSTRETH : o_result = instret_cnt[63:32];
      SCALL      : o_result = 'x;
      SBREAK     : o_result = 'x;
      default    : o_result = 'x;
    endcase
  end

endmodule
