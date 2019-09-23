
`timescale 1ns / 1ps
`include "core_wrapper_v1_0_tb_include.svh"

import axi_vip_pkg::*;
import core_wrapper_v1_0_bfm_1_slave_0_0_pkg::*;
import core_wrapper_v1_0_bfm_1_slave_1_0_pkg::*;

module core_wrapper_v1_0_tb();


xil_axi_uint                            error_cnt = 0;
xil_axi_uint                            comparison_cnt = 0;
axi_transaction                         wr_transaction;   
axi_transaction                         rd_transaction;   
axi_monitor_transaction                 mst_monitor_transaction;  
axi_monitor_transaction                 master_moniter_transaction_queue[$];  
xil_axi_uint                            master_moniter_transaction_queue_size =0;  
axi_monitor_transaction                 mst_scb_transaction;  
axi_monitor_transaction                 passthrough_monitor_transaction;  
axi_monitor_transaction                 passthrough_master_moniter_transaction_queue[$];  
xil_axi_uint                            passthrough_master_moniter_transaction_queue_size =0;  
axi_monitor_transaction                 passthrough_mst_scb_transaction;  
axi_monitor_transaction                 passthrough_slave_moniter_transaction_queue[$];  
xil_axi_uint                            passthrough_slave_moniter_transaction_queue_size =0;  
axi_monitor_transaction                 passthrough_slv_scb_transaction;  
axi_monitor_transaction                 slv_monitor_transaction;  
axi_monitor_transaction                 slave_moniter_transaction_queue[$];  
xil_axi_uint                            slave_moniter_transaction_queue_size =0;  
axi_monitor_transaction                 slv_scb_transaction;  
xil_axi_uint                           mst_agent_verbosity = 0;  
xil_axi_uint                           slv_agent_verbosity = 0;  
xil_axi_uint                           passthrough_agent_verbosity = 0;  
bit                                     clock;
bit                                     reset;
xil_axi_ulong                           mem_rd_addr;
xil_axi_ulong                           mem_wr_addr;
bit[32-1:0]                             write_data;
bit                                     write_strb[];
bit[32-1:0]                             read_data;
core_wrapper_v1_0_bfm_1_slave_0_0_slv_mem_t          slv_agent_0;
bit error_0;
bit done_0;
bit init_0;
core_wrapper_v1_0_bfm_1_slave_1_0_slv_mem_t          slv_agent_1;
bit error_1;
bit done_1;
bit init_1;

  `BD_WRAPPER DUT(
      .ARESETN(reset), 
.m_instr_INIT_AXI_TXN(init_0),
.m_instr_TXN_DONE(done_0),
.m_instr_ERROR(error_0),
.m_data_INIT_AXI_TXN(init_1),
.m_data_TXN_DONE(done_1),
.m_data_ERROR(error_1),
      .ACLK(clock) 
    ); 
  
initial begin
    slv_agent_0 = new("slave vip agent",DUT.`BD_INST_NAME.slave_0.inst.IF);
    slv_agent_0.vif_proxy.set_dummy_drive_type(XIL_AXI_VIF_DRIVE_NONE);
    slv_agent_0.set_agent_tag("Slave VIP");
    slv_agent_0.set_verbosity(slv_agent_verbosity);
    slv_agent_0.start_slave();
    slv_agent_1 = new("slave vip agent",DUT.`BD_INST_NAME.slave_1.inst.IF);
    slv_agent_1.vif_proxy.set_dummy_drive_type(XIL_AXI_VIF_DRIVE_NONE);
    slv_agent_1.set_agent_tag("Slave VIP");
    slv_agent_1.set_verbosity(slv_agent_verbosity);
    slv_agent_1.start_slave();
     $timeformat (-12, 1, " ps", 1);
  end
  initial begin
    reset <= 1'b0;
    #200ns;
    reset <= 1'b1;
    repeat (5) @(negedge clock); 
  end
  always #5 clock <= ~clock;
  initial begin
    init_0 = 0;
    #200ns;
    init_0 =1'b1;
    #20ns;
    init_0 = 1'b0;
    $display("EXAMPLE TEST m_instr:");
      wait( done_0 == 1'b1);
      $display("m_instr: PTGEN_TEST_FINISHED!");
      if ( error_0 ) begin
        $display("PTGEN_TEST: FAILED!");
      end else begin
        $display("PTGEN_TEST: PASSED!");
      end
    init_1 = 0;
    #200ns;
    init_1 =1'b1;
    #20ns;
    init_1 = 1'b0;
    $display("EXAMPLE TEST m_data:");
      wait( done_1 == 1'b1);
      $display("m_data: PTGEN_TEST_FINISHED!");
      if ( error_1 ) begin
        $display("PTGEN_TEST: FAILED!");
      end else begin
        $display("PTGEN_TEST: PASSED!");
      end
      #1ns;
      $finish;
  end
  initial begin
  #1;
    forever begin
      slv_agent_0.monitor.item_collected_port.get(slv_monitor_transaction);
      slave_moniter_transaction_queue.push_back(slv_monitor_transaction);
      slave_moniter_transaction_queue_size++;
    end
  end
  initial begin
  #1;
    forever begin
      slv_agent_1.monitor.item_collected_port.get(slv_monitor_transaction);
      slave_moniter_transaction_queue.push_back(slv_monitor_transaction);
      slave_moniter_transaction_queue_size++;
    end
  end

endmodule
