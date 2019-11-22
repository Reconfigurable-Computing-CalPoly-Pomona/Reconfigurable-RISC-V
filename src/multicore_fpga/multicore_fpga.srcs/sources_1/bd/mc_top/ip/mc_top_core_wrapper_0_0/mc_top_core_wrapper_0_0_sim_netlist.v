// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sun Nov 17 19:13:24 2019
// Host        : Drew running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top mc_top_core_wrapper_0_0 -prefix
//               mc_top_core_wrapper_0_0_ mc_top_core_wrapper_0_0_sim_netlist.v
// Design      : mc_top_core_wrapper_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mc_top_core_wrapper_0_0_core_wrapper_v1_0
   (axi_rready_reg,
    axi_rready_reg_0,
    m_instr_bready,
    m_data_bready,
    m_instr_awaddr,
    m_instr_wdata,
    m_instr_araddr,
    axi_awvalid_reg,
    axi_arvalid_reg,
    axi_wvalid_reg,
    m_data_awaddr,
    m_data_wdata,
    m_data_araddr,
    axi_awvalid_reg_0,
    axi_arvalid_reg_0,
    axi_wvalid_reg_0,
    m_instr_wlast,
    m_data_wlast,
    m_instr_error,
    m_instr_txn_done,
    m_data_error,
    m_data_txn_done,
    m_instr_aresetn,
    m_data_aresetn,
    m_instr_rvalid,
    m_instr_rlast,
    m_data_rvalid,
    m_data_rlast,
    m_instr_aclk,
    m_data_aclk,
    m_instr_init_axi_txn,
    m_data_init_axi_txn,
    m_instr_bvalid,
    m_instr_awready,
    m_instr_arready,
    m_instr_wready,
    m_instr_rdata,
    m_data_bvalid,
    m_data_awready,
    m_data_arready,
    m_data_wready,
    m_data_rdata,
    m_instr_rresp,
    m_instr_bresp,
    m_data_rresp,
    m_data_bresp);
  output axi_rready_reg;
  output axi_rready_reg_0;
  output m_instr_bready;
  output m_data_bready;
  output [25:0]m_instr_awaddr;
  output [31:0]m_instr_wdata;
  output [25:0]m_instr_araddr;
  output axi_awvalid_reg;
  output axi_arvalid_reg;
  output axi_wvalid_reg;
  output [25:0]m_data_awaddr;
  output [31:0]m_data_wdata;
  output [25:0]m_data_araddr;
  output axi_awvalid_reg_0;
  output axi_arvalid_reg_0;
  output axi_wvalid_reg_0;
  output m_instr_wlast;
  output m_data_wlast;
  output m_instr_error;
  output m_instr_txn_done;
  output m_data_error;
  output m_data_txn_done;
  input m_instr_aresetn;
  input m_data_aresetn;
  input m_instr_rvalid;
  input m_instr_rlast;
  input m_data_rvalid;
  input m_data_rlast;
  input m_instr_aclk;
  input m_data_aclk;
  input m_instr_init_axi_txn;
  input m_data_init_axi_txn;
  input m_instr_bvalid;
  input m_instr_awready;
  input m_instr_arready;
  input m_instr_wready;
  input [31:0]m_instr_rdata;
  input m_data_bvalid;
  input m_data_awready;
  input m_data_arready;
  input m_data_wready;
  input [31:0]m_data_rdata;
  input [0:0]m_instr_rresp;
  input [0:0]m_instr_bresp;
  input [0:0]m_data_rresp;
  input [0:0]m_data_bresp;

  wire axi_arvalid_reg;
  wire axi_arvalid_reg_0;
  wire axi_awvalid_reg;
  wire axi_awvalid_reg_0;
  wire axi_rready_reg;
  wire axi_rready_reg_0;
  wire axi_wvalid_reg;
  wire axi_wvalid_reg_0;
  wire m_data_aclk;
  wire [25:0]m_data_araddr;
  wire m_data_aresetn;
  wire m_data_arready;
  wire [25:0]m_data_awaddr;
  wire m_data_awready;
  wire m_data_bready;
  wire [0:0]m_data_bresp;
  wire m_data_bvalid;
  wire m_data_error;
  wire m_data_init_axi_txn;
  wire [31:0]m_data_rdata;
  wire m_data_rlast;
  wire [0:0]m_data_rresp;
  wire m_data_rvalid;
  wire m_data_txn_done;
  wire [31:0]m_data_wdata;
  wire m_data_wlast;
  wire m_data_wready;
  wire m_instr_aclk;
  wire [25:0]m_instr_araddr;
  wire m_instr_aresetn;
  wire m_instr_arready;
  wire [25:0]m_instr_awaddr;
  wire m_instr_awready;
  wire m_instr_bready;
  wire [0:0]m_instr_bresp;
  wire m_instr_bvalid;
  wire m_instr_error;
  wire m_instr_init_axi_txn;
  wire [31:0]m_instr_rdata;
  wire m_instr_rlast;
  wire [0:0]m_instr_rresp;
  wire m_instr_rvalid;
  wire m_instr_txn_done;
  wire [31:0]m_instr_wdata;
  wire m_instr_wlast;
  wire m_instr_wready;

  mc_top_core_wrapper_0_0_core_wrapper_v1_0_m_data core_wrapper_v1_0_m_data_inst
       (.axi_arvalid_reg_0(axi_arvalid_reg_0),
        .axi_awvalid_reg_0(axi_awvalid_reg_0),
        .axi_bready_reg_0(m_data_bready),
        .axi_rready_reg_0(axi_rready_reg_0),
        .axi_wvalid_reg_0(axi_wvalid_reg_0),
        .m_data_aclk(m_data_aclk),
        .m_data_araddr(m_data_araddr),
        .m_data_aresetn(m_data_aresetn),
        .m_data_arready(m_data_arready),
        .m_data_awaddr(m_data_awaddr),
        .m_data_awready(m_data_awready),
        .m_data_bresp(m_data_bresp),
        .m_data_bvalid(m_data_bvalid),
        .m_data_error(m_data_error),
        .m_data_init_axi_txn(m_data_init_axi_txn),
        .m_data_rdata(m_data_rdata),
        .m_data_rlast(m_data_rlast),
        .m_data_rresp(m_data_rresp),
        .m_data_rvalid(m_data_rvalid),
        .m_data_txn_done(m_data_txn_done),
        .m_data_wdata(m_data_wdata),
        .m_data_wlast(m_data_wlast),
        .m_data_wready(m_data_wready));
  mc_top_core_wrapper_0_0_core_wrapper_v1_0_m_instr core_wrapper_v1_0_m_instr_inst
       (.axi_arvalid_reg_0(axi_arvalid_reg),
        .axi_awvalid_reg_0(axi_awvalid_reg),
        .axi_bready_reg_0(m_instr_bready),
        .axi_rready_reg_0(axi_rready_reg),
        .axi_wvalid_reg_0(axi_wvalid_reg),
        .m_instr_aclk(m_instr_aclk),
        .m_instr_araddr(m_instr_araddr),
        .m_instr_aresetn(m_instr_aresetn),
        .m_instr_arready(m_instr_arready),
        .m_instr_awaddr(m_instr_awaddr),
        .m_instr_awready(m_instr_awready),
        .m_instr_bresp(m_instr_bresp),
        .m_instr_bvalid(m_instr_bvalid),
        .m_instr_error(m_instr_error),
        .m_instr_init_axi_txn(m_instr_init_axi_txn),
        .m_instr_rdata(m_instr_rdata),
        .m_instr_rlast(m_instr_rlast),
        .m_instr_rresp(m_instr_rresp),
        .m_instr_rvalid(m_instr_rvalid),
        .m_instr_txn_done(m_instr_txn_done),
        .m_instr_wdata(m_instr_wdata),
        .m_instr_wlast(m_instr_wlast),
        .m_instr_wready(m_instr_wready));
endmodule

module mc_top_core_wrapper_0_0_core_wrapper_v1_0_m_data
   (axi_bready_reg_0,
    axi_awvalid_reg_0,
    axi_rready_reg_0,
    axi_arvalid_reg_0,
    m_data_txn_done,
    m_data_error,
    m_data_wlast,
    axi_wvalid_reg_0,
    m_data_awaddr,
    m_data_wdata,
    m_data_araddr,
    m_data_init_axi_txn,
    m_data_aclk,
    m_data_aresetn,
    m_data_rvalid,
    m_data_rlast,
    m_data_awready,
    m_data_bvalid,
    m_data_arready,
    m_data_wready,
    m_data_rresp,
    m_data_bresp,
    m_data_rdata);
  output axi_bready_reg_0;
  output axi_awvalid_reg_0;
  output axi_rready_reg_0;
  output axi_arvalid_reg_0;
  output m_data_txn_done;
  output m_data_error;
  output m_data_wlast;
  output axi_wvalid_reg_0;
  output [25:0]m_data_awaddr;
  output [31:0]m_data_wdata;
  output [25:0]m_data_araddr;
  input m_data_init_axi_txn;
  input m_data_aclk;
  input m_data_aresetn;
  input m_data_rvalid;
  input m_data_rlast;
  input m_data_awready;
  input m_data_bvalid;
  input m_data_arready;
  input m_data_wready;
  input [0:0]m_data_rresp;
  input [0:0]m_data_bresp;
  input [31:0]m_data_rdata;

  wire ERROR_i_1__0_n_0;
  wire \FSM_sequential_mst_exec_state[0]_i_1__0_n_0 ;
  wire \FSM_sequential_mst_exec_state[1]_i_1__0_n_0 ;
  wire M_AXI_ARADDR_carry_i_1__0_n_0;
  wire M_AXI_ARADDR_carry_n_2;
  wire M_AXI_ARADDR_carry_n_3;
  wire M_AXI_AWADDR_carry_i_1__0_n_0;
  wire M_AXI_AWADDR_carry_n_2;
  wire M_AXI_AWADDR_carry_n_3;
  wire \axi_araddr[9]_i_2__0_n_0 ;
  wire [31:29]axi_araddr_reg;
  wire \axi_araddr_reg[13]_i_1__0_n_0 ;
  wire \axi_araddr_reg[13]_i_1__0_n_1 ;
  wire \axi_araddr_reg[13]_i_1__0_n_2 ;
  wire \axi_araddr_reg[13]_i_1__0_n_3 ;
  wire \axi_araddr_reg[13]_i_1__0_n_4 ;
  wire \axi_araddr_reg[13]_i_1__0_n_5 ;
  wire \axi_araddr_reg[13]_i_1__0_n_6 ;
  wire \axi_araddr_reg[13]_i_1__0_n_7 ;
  wire \axi_araddr_reg[17]_i_1__0_n_0 ;
  wire \axi_araddr_reg[17]_i_1__0_n_1 ;
  wire \axi_araddr_reg[17]_i_1__0_n_2 ;
  wire \axi_araddr_reg[17]_i_1__0_n_3 ;
  wire \axi_araddr_reg[17]_i_1__0_n_4 ;
  wire \axi_araddr_reg[17]_i_1__0_n_5 ;
  wire \axi_araddr_reg[17]_i_1__0_n_6 ;
  wire \axi_araddr_reg[17]_i_1__0_n_7 ;
  wire \axi_araddr_reg[21]_i_1__0_n_0 ;
  wire \axi_araddr_reg[21]_i_1__0_n_1 ;
  wire \axi_araddr_reg[21]_i_1__0_n_2 ;
  wire \axi_araddr_reg[21]_i_1__0_n_3 ;
  wire \axi_araddr_reg[21]_i_1__0_n_4 ;
  wire \axi_araddr_reg[21]_i_1__0_n_5 ;
  wire \axi_araddr_reg[21]_i_1__0_n_6 ;
  wire \axi_araddr_reg[21]_i_1__0_n_7 ;
  wire \axi_araddr_reg[25]_i_1__0_n_0 ;
  wire \axi_araddr_reg[25]_i_1__0_n_1 ;
  wire \axi_araddr_reg[25]_i_1__0_n_2 ;
  wire \axi_araddr_reg[25]_i_1__0_n_3 ;
  wire \axi_araddr_reg[25]_i_1__0_n_4 ;
  wire \axi_araddr_reg[25]_i_1__0_n_5 ;
  wire \axi_araddr_reg[25]_i_1__0_n_6 ;
  wire \axi_araddr_reg[25]_i_1__0_n_7 ;
  wire \axi_araddr_reg[28]_i_2__0_n_0 ;
  wire \axi_araddr_reg[28]_i_2__0_n_1 ;
  wire \axi_araddr_reg[28]_i_2__0_n_2 ;
  wire \axi_araddr_reg[28]_i_2__0_n_3 ;
  wire \axi_araddr_reg[28]_i_2__0_n_4 ;
  wire \axi_araddr_reg[28]_i_2__0_n_5 ;
  wire \axi_araddr_reg[28]_i_2__0_n_6 ;
  wire \axi_araddr_reg[28]_i_2__0_n_7 ;
  wire \axi_araddr_reg[30]_i_1__0_n_3 ;
  wire \axi_araddr_reg[30]_i_1__0_n_6 ;
  wire \axi_araddr_reg[30]_i_1__0_n_7 ;
  wire \axi_araddr_reg[9]_i_1__0_n_0 ;
  wire \axi_araddr_reg[9]_i_1__0_n_1 ;
  wire \axi_araddr_reg[9]_i_1__0_n_2 ;
  wire \axi_araddr_reg[9]_i_1__0_n_3 ;
  wire \axi_araddr_reg[9]_i_1__0_n_4 ;
  wire \axi_araddr_reg[9]_i_1__0_n_5 ;
  wire \axi_araddr_reg[9]_i_1__0_n_6 ;
  wire \axi_araddr_reg[9]_i_1__0_n_7 ;
  wire axi_arvalid0;
  wire axi_arvalid_i_1__0_n_0;
  wire axi_arvalid_reg_0;
  wire \axi_awaddr[28]_i_1__0_n_0 ;
  wire \axi_awaddr[9]_i_2__0_n_0 ;
  wire [31:29]axi_awaddr_reg;
  wire \axi_awaddr_reg[13]_i_1__0_n_0 ;
  wire \axi_awaddr_reg[13]_i_1__0_n_1 ;
  wire \axi_awaddr_reg[13]_i_1__0_n_2 ;
  wire \axi_awaddr_reg[13]_i_1__0_n_3 ;
  wire \axi_awaddr_reg[13]_i_1__0_n_4 ;
  wire \axi_awaddr_reg[13]_i_1__0_n_5 ;
  wire \axi_awaddr_reg[13]_i_1__0_n_6 ;
  wire \axi_awaddr_reg[13]_i_1__0_n_7 ;
  wire \axi_awaddr_reg[17]_i_1__0_n_0 ;
  wire \axi_awaddr_reg[17]_i_1__0_n_1 ;
  wire \axi_awaddr_reg[17]_i_1__0_n_2 ;
  wire \axi_awaddr_reg[17]_i_1__0_n_3 ;
  wire \axi_awaddr_reg[17]_i_1__0_n_4 ;
  wire \axi_awaddr_reg[17]_i_1__0_n_5 ;
  wire \axi_awaddr_reg[17]_i_1__0_n_6 ;
  wire \axi_awaddr_reg[17]_i_1__0_n_7 ;
  wire \axi_awaddr_reg[21]_i_1__0_n_0 ;
  wire \axi_awaddr_reg[21]_i_1__0_n_1 ;
  wire \axi_awaddr_reg[21]_i_1__0_n_2 ;
  wire \axi_awaddr_reg[21]_i_1__0_n_3 ;
  wire \axi_awaddr_reg[21]_i_1__0_n_4 ;
  wire \axi_awaddr_reg[21]_i_1__0_n_5 ;
  wire \axi_awaddr_reg[21]_i_1__0_n_6 ;
  wire \axi_awaddr_reg[21]_i_1__0_n_7 ;
  wire \axi_awaddr_reg[25]_i_1__0_n_0 ;
  wire \axi_awaddr_reg[25]_i_1__0_n_1 ;
  wire \axi_awaddr_reg[25]_i_1__0_n_2 ;
  wire \axi_awaddr_reg[25]_i_1__0_n_3 ;
  wire \axi_awaddr_reg[25]_i_1__0_n_4 ;
  wire \axi_awaddr_reg[25]_i_1__0_n_5 ;
  wire \axi_awaddr_reg[25]_i_1__0_n_6 ;
  wire \axi_awaddr_reg[25]_i_1__0_n_7 ;
  wire \axi_awaddr_reg[28]_i_3__0_n_0 ;
  wire \axi_awaddr_reg[28]_i_3__0_n_1 ;
  wire \axi_awaddr_reg[28]_i_3__0_n_2 ;
  wire \axi_awaddr_reg[28]_i_3__0_n_3 ;
  wire \axi_awaddr_reg[28]_i_3__0_n_4 ;
  wire \axi_awaddr_reg[28]_i_3__0_n_5 ;
  wire \axi_awaddr_reg[28]_i_3__0_n_6 ;
  wire \axi_awaddr_reg[28]_i_3__0_n_7 ;
  wire \axi_awaddr_reg[30]_i_1__0_n_3 ;
  wire \axi_awaddr_reg[30]_i_1__0_n_6 ;
  wire \axi_awaddr_reg[30]_i_1__0_n_7 ;
  wire \axi_awaddr_reg[9]_i_1__0_n_0 ;
  wire \axi_awaddr_reg[9]_i_1__0_n_1 ;
  wire \axi_awaddr_reg[9]_i_1__0_n_2 ;
  wire \axi_awaddr_reg[9]_i_1__0_n_3 ;
  wire \axi_awaddr_reg[9]_i_1__0_n_4 ;
  wire \axi_awaddr_reg[9]_i_1__0_n_5 ;
  wire \axi_awaddr_reg[9]_i_1__0_n_6 ;
  wire \axi_awaddr_reg[9]_i_1__0_n_7 ;
  wire axi_awvalid0;
  wire axi_awvalid_i_1__0_n_0;
  wire axi_awvalid_reg_0;
  wire axi_bready0;
  wire axi_bready_reg_0;
  wire axi_rready_i_1__0_n_0;
  wire axi_rready_reg_0;
  wire \axi_wdata[3]_i_2__0_n_0 ;
  wire \axi_wdata_reg[11]_i_1__0_n_0 ;
  wire \axi_wdata_reg[11]_i_1__0_n_1 ;
  wire \axi_wdata_reg[11]_i_1__0_n_2 ;
  wire \axi_wdata_reg[11]_i_1__0_n_3 ;
  wire \axi_wdata_reg[11]_i_1__0_n_4 ;
  wire \axi_wdata_reg[11]_i_1__0_n_5 ;
  wire \axi_wdata_reg[11]_i_1__0_n_6 ;
  wire \axi_wdata_reg[11]_i_1__0_n_7 ;
  wire \axi_wdata_reg[15]_i_1__0_n_0 ;
  wire \axi_wdata_reg[15]_i_1__0_n_1 ;
  wire \axi_wdata_reg[15]_i_1__0_n_2 ;
  wire \axi_wdata_reg[15]_i_1__0_n_3 ;
  wire \axi_wdata_reg[15]_i_1__0_n_4 ;
  wire \axi_wdata_reg[15]_i_1__0_n_5 ;
  wire \axi_wdata_reg[15]_i_1__0_n_6 ;
  wire \axi_wdata_reg[15]_i_1__0_n_7 ;
  wire \axi_wdata_reg[19]_i_1__0_n_0 ;
  wire \axi_wdata_reg[19]_i_1__0_n_1 ;
  wire \axi_wdata_reg[19]_i_1__0_n_2 ;
  wire \axi_wdata_reg[19]_i_1__0_n_3 ;
  wire \axi_wdata_reg[19]_i_1__0_n_4 ;
  wire \axi_wdata_reg[19]_i_1__0_n_5 ;
  wire \axi_wdata_reg[19]_i_1__0_n_6 ;
  wire \axi_wdata_reg[19]_i_1__0_n_7 ;
  wire \axi_wdata_reg[23]_i_1__0_n_0 ;
  wire \axi_wdata_reg[23]_i_1__0_n_1 ;
  wire \axi_wdata_reg[23]_i_1__0_n_2 ;
  wire \axi_wdata_reg[23]_i_1__0_n_3 ;
  wire \axi_wdata_reg[23]_i_1__0_n_4 ;
  wire \axi_wdata_reg[23]_i_1__0_n_5 ;
  wire \axi_wdata_reg[23]_i_1__0_n_6 ;
  wire \axi_wdata_reg[23]_i_1__0_n_7 ;
  wire \axi_wdata_reg[27]_i_1__0_n_0 ;
  wire \axi_wdata_reg[27]_i_1__0_n_1 ;
  wire \axi_wdata_reg[27]_i_1__0_n_2 ;
  wire \axi_wdata_reg[27]_i_1__0_n_3 ;
  wire \axi_wdata_reg[27]_i_1__0_n_4 ;
  wire \axi_wdata_reg[27]_i_1__0_n_5 ;
  wire \axi_wdata_reg[27]_i_1__0_n_6 ;
  wire \axi_wdata_reg[27]_i_1__0_n_7 ;
  wire \axi_wdata_reg[31]_i_2__0_n_1 ;
  wire \axi_wdata_reg[31]_i_2__0_n_2 ;
  wire \axi_wdata_reg[31]_i_2__0_n_3 ;
  wire \axi_wdata_reg[31]_i_2__0_n_4 ;
  wire \axi_wdata_reg[31]_i_2__0_n_5 ;
  wire \axi_wdata_reg[31]_i_2__0_n_6 ;
  wire \axi_wdata_reg[31]_i_2__0_n_7 ;
  wire \axi_wdata_reg[3]_i_1__0_n_0 ;
  wire \axi_wdata_reg[3]_i_1__0_n_1 ;
  wire \axi_wdata_reg[3]_i_1__0_n_2 ;
  wire \axi_wdata_reg[3]_i_1__0_n_3 ;
  wire \axi_wdata_reg[3]_i_1__0_n_4 ;
  wire \axi_wdata_reg[3]_i_1__0_n_5 ;
  wire \axi_wdata_reg[3]_i_1__0_n_6 ;
  wire \axi_wdata_reg[3]_i_1__0_n_7 ;
  wire \axi_wdata_reg[7]_i_1__0_n_0 ;
  wire \axi_wdata_reg[7]_i_1__0_n_1 ;
  wire \axi_wdata_reg[7]_i_1__0_n_2 ;
  wire \axi_wdata_reg[7]_i_1__0_n_3 ;
  wire \axi_wdata_reg[7]_i_1__0_n_4 ;
  wire \axi_wdata_reg[7]_i_1__0_n_5 ;
  wire \axi_wdata_reg[7]_i_1__0_n_6 ;
  wire \axi_wdata_reg[7]_i_1__0_n_7 ;
  wire axi_wlast0;
  wire axi_wlast_i_1__0_n_0;
  wire axi_wvalid_i_1__0_n_0;
  wire axi_wvalid_reg_0;
  wire burst_read_active;
  wire burst_read_active_i_1__0_n_0;
  wire burst_write_active;
  wire burst_write_active_i_1__0_n_0;
  wire compare_done;
  wire compare_done_i_1__0_n_0;
  wire compare_done_i_2__0_n_0;
  wire error_reg;
  wire error_reg_i_1__0_n_0;
  wire \expected_rdata[0]_i_3__0_n_0 ;
  wire [31:0]expected_rdata_reg;
  wire \expected_rdata_reg[0]_i_2__0_n_0 ;
  wire \expected_rdata_reg[0]_i_2__0_n_1 ;
  wire \expected_rdata_reg[0]_i_2__0_n_2 ;
  wire \expected_rdata_reg[0]_i_2__0_n_3 ;
  wire \expected_rdata_reg[0]_i_2__0_n_4 ;
  wire \expected_rdata_reg[0]_i_2__0_n_5 ;
  wire \expected_rdata_reg[0]_i_2__0_n_6 ;
  wire \expected_rdata_reg[0]_i_2__0_n_7 ;
  wire \expected_rdata_reg[12]_i_1__0_n_0 ;
  wire \expected_rdata_reg[12]_i_1__0_n_1 ;
  wire \expected_rdata_reg[12]_i_1__0_n_2 ;
  wire \expected_rdata_reg[12]_i_1__0_n_3 ;
  wire \expected_rdata_reg[12]_i_1__0_n_4 ;
  wire \expected_rdata_reg[12]_i_1__0_n_5 ;
  wire \expected_rdata_reg[12]_i_1__0_n_6 ;
  wire \expected_rdata_reg[12]_i_1__0_n_7 ;
  wire \expected_rdata_reg[16]_i_1__0_n_0 ;
  wire \expected_rdata_reg[16]_i_1__0_n_1 ;
  wire \expected_rdata_reg[16]_i_1__0_n_2 ;
  wire \expected_rdata_reg[16]_i_1__0_n_3 ;
  wire \expected_rdata_reg[16]_i_1__0_n_4 ;
  wire \expected_rdata_reg[16]_i_1__0_n_5 ;
  wire \expected_rdata_reg[16]_i_1__0_n_6 ;
  wire \expected_rdata_reg[16]_i_1__0_n_7 ;
  wire \expected_rdata_reg[20]_i_1__0_n_0 ;
  wire \expected_rdata_reg[20]_i_1__0_n_1 ;
  wire \expected_rdata_reg[20]_i_1__0_n_2 ;
  wire \expected_rdata_reg[20]_i_1__0_n_3 ;
  wire \expected_rdata_reg[20]_i_1__0_n_4 ;
  wire \expected_rdata_reg[20]_i_1__0_n_5 ;
  wire \expected_rdata_reg[20]_i_1__0_n_6 ;
  wire \expected_rdata_reg[20]_i_1__0_n_7 ;
  wire \expected_rdata_reg[24]_i_1__0_n_0 ;
  wire \expected_rdata_reg[24]_i_1__0_n_1 ;
  wire \expected_rdata_reg[24]_i_1__0_n_2 ;
  wire \expected_rdata_reg[24]_i_1__0_n_3 ;
  wire \expected_rdata_reg[24]_i_1__0_n_4 ;
  wire \expected_rdata_reg[24]_i_1__0_n_5 ;
  wire \expected_rdata_reg[24]_i_1__0_n_6 ;
  wire \expected_rdata_reg[24]_i_1__0_n_7 ;
  wire \expected_rdata_reg[28]_i_1__0_n_1 ;
  wire \expected_rdata_reg[28]_i_1__0_n_2 ;
  wire \expected_rdata_reg[28]_i_1__0_n_3 ;
  wire \expected_rdata_reg[28]_i_1__0_n_4 ;
  wire \expected_rdata_reg[28]_i_1__0_n_5 ;
  wire \expected_rdata_reg[28]_i_1__0_n_6 ;
  wire \expected_rdata_reg[28]_i_1__0_n_7 ;
  wire \expected_rdata_reg[4]_i_1__0_n_0 ;
  wire \expected_rdata_reg[4]_i_1__0_n_1 ;
  wire \expected_rdata_reg[4]_i_1__0_n_2 ;
  wire \expected_rdata_reg[4]_i_1__0_n_3 ;
  wire \expected_rdata_reg[4]_i_1__0_n_4 ;
  wire \expected_rdata_reg[4]_i_1__0_n_5 ;
  wire \expected_rdata_reg[4]_i_1__0_n_6 ;
  wire \expected_rdata_reg[4]_i_1__0_n_7 ;
  wire \expected_rdata_reg[8]_i_1__0_n_0 ;
  wire \expected_rdata_reg[8]_i_1__0_n_1 ;
  wire \expected_rdata_reg[8]_i_1__0_n_2 ;
  wire \expected_rdata_reg[8]_i_1__0_n_3 ;
  wire \expected_rdata_reg[8]_i_1__0_n_4 ;
  wire \expected_rdata_reg[8]_i_1__0_n_5 ;
  wire \expected_rdata_reg[8]_i_1__0_n_6 ;
  wire \expected_rdata_reg[8]_i_1__0_n_7 ;
  wire init_txn_ff;
  wire init_txn_ff2;
  wire m_data_aclk;
  wire [25:0]m_data_araddr;
  wire m_data_aresetn;
  wire m_data_arready;
  wire [25:0]m_data_awaddr;
  wire m_data_awready;
  wire [0:0]m_data_bresp;
  wire m_data_bvalid;
  wire m_data_error;
  wire m_data_init_axi_txn;
  wire [31:0]m_data_rdata;
  wire m_data_rlast;
  wire [0:0]m_data_rresp;
  wire m_data_rvalid;
  wire m_data_txn_done;
  wire [31:0]m_data_wdata;
  wire m_data_wlast;
  wire m_data_wready;
  wire [0:0]mst_exec_state;
  wire p_0_in;
  wire p_0_in3_in;
  wire [6:0]p_0_in__1;
  wire [6:0]p_0_in__2;
  wire [4:0]p_0_in__5;
  wire [4:0]p_0_in__6;
  wire p_13_in;
  wire p_7_in;
  wire p_9_in;
  wire read_burst_counter;
  wire \read_burst_counter_reg_n_0_[0] ;
  wire \read_burst_counter_reg_n_0_[1] ;
  wire \read_burst_counter_reg_n_0_[2] ;
  wire \read_burst_counter_reg_n_0_[3] ;
  wire \read_burst_counter_reg_n_0_[4] ;
  wire \read_burst_counter_reg_n_0_[5] ;
  wire read_index0;
  wire \read_index[2]_i_1__0_n_0 ;
  wire \read_index[4]_i_1__0_n_0 ;
  wire [4:0]read_index_reg__0;
  wire read_mismatch;
  wire read_mismatch0;
  wire read_mismatch1;
  wire read_mismatch1_carry__0_i_1__0_n_0;
  wire read_mismatch1_carry__0_i_2__0_n_0;
  wire read_mismatch1_carry__0_i_3__0_n_0;
  wire read_mismatch1_carry__0_i_4__0_n_0;
  wire read_mismatch1_carry__0_n_0;
  wire read_mismatch1_carry__0_n_1;
  wire read_mismatch1_carry__0_n_2;
  wire read_mismatch1_carry__0_n_3;
  wire read_mismatch1_carry__1_i_1__0_n_0;
  wire read_mismatch1_carry__1_i_2__0_n_0;
  wire read_mismatch1_carry__1_i_3__0_n_0;
  wire read_mismatch1_carry__1_n_2;
  wire read_mismatch1_carry__1_n_3;
  wire read_mismatch1_carry_i_1__0_n_0;
  wire read_mismatch1_carry_i_2__0_n_0;
  wire read_mismatch1_carry_i_3__0_n_0;
  wire read_mismatch1_carry_i_4__0_n_0;
  wire read_mismatch1_carry_n_0;
  wire read_mismatch1_carry_n_1;
  wire read_mismatch1_carry_n_2;
  wire read_mismatch1_carry_n_3;
  wire reads_done;
  wire reads_done2__0;
  wire reads_done_i_1__0_n_0;
  wire start_single_burst_read_i_1__0_n_0;
  wire start_single_burst_read_reg_n_0;
  wire start_single_burst_write_i_1__0_n_0;
  wire start_single_burst_write_reg_n_0;
  wire write_burst_counter;
  wire \write_burst_counter_reg_n_0_[0] ;
  wire \write_burst_counter_reg_n_0_[1] ;
  wire \write_burst_counter_reg_n_0_[2] ;
  wire \write_burst_counter_reg_n_0_[3] ;
  wire \write_burst_counter_reg_n_0_[4] ;
  wire \write_burst_counter_reg_n_0_[5] ;
  wire write_index0;
  wire \write_index[4]_i_1__0_n_0 ;
  wire [4:0]write_index_reg__0;
  wire writes_done;
  wire writes_done_i_1__0_n_0;
  wire [3:2]NLW_M_AXI_ARADDR_carry_CO_UNCONNECTED;
  wire [3:3]NLW_M_AXI_ARADDR_carry_O_UNCONNECTED;
  wire [3:2]NLW_M_AXI_AWADDR_carry_CO_UNCONNECTED;
  wire [3:3]NLW_M_AXI_AWADDR_carry_O_UNCONNECTED;
  wire [3:1]\NLW_axi_araddr_reg[30]_i_1__0_CO_UNCONNECTED ;
  wire [3:2]\NLW_axi_araddr_reg[30]_i_1__0_O_UNCONNECTED ;
  wire [3:1]\NLW_axi_awaddr_reg[30]_i_1__0_CO_UNCONNECTED ;
  wire [3:2]\NLW_axi_awaddr_reg[30]_i_1__0_O_UNCONNECTED ;
  wire [3:3]\NLW_axi_wdata_reg[31]_i_2__0_CO_UNCONNECTED ;
  wire [3:3]\NLW_expected_rdata_reg[28]_i_1__0_CO_UNCONNECTED ;
  wire [3:0]NLW_read_mismatch1_carry_O_UNCONNECTED;
  wire [3:0]NLW_read_mismatch1_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_read_mismatch1_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_read_mismatch1_carry__1_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'hBBBBFCFF88880000)) 
    ERROR_i_1__0
       (.I0(error_reg),
        .I1(mst_exec_state),
        .I2(init_txn_ff2),
        .I3(init_txn_ff),
        .I4(compare_done),
        .I5(m_data_error),
        .O(ERROR_i_1__0_n_0));
  FDRE ERROR_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(ERROR_i_1__0_n_0),
        .Q(m_data_error),
        .R(compare_done_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h3044304430773044)) 
    \FSM_sequential_mst_exec_state[0]_i_1__0 
       (.I0(writes_done),
        .I1(mst_exec_state),
        .I2(reads_done),
        .I3(compare_done),
        .I4(init_txn_ff),
        .I5(init_txn_ff2),
        .O(\FSM_sequential_mst_exec_state[0]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h38)) 
    \FSM_sequential_mst_exec_state[1]_i_1__0 
       (.I0(writes_done),
        .I1(mst_exec_state),
        .I2(compare_done),
        .O(\FSM_sequential_mst_exec_state[1]_i_1__0_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:00,INIT_WRITE:01,INIT_READ:10,INIT_COMPARE:11" *) 
  FDRE \FSM_sequential_mst_exec_state_reg[0] 
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_mst_exec_state[0]_i_1__0_n_0 ),
        .Q(mst_exec_state),
        .R(compare_done_i_1__0_n_0));
  (* FSM_ENCODED_STATES = "IDLE:00,INIT_WRITE:01,INIT_READ:10,INIT_COMPARE:11" *) 
  FDRE \FSM_sequential_mst_exec_state_reg[1] 
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_mst_exec_state[1]_i_1__0_n_0 ),
        .Q(compare_done),
        .R(compare_done_i_1__0_n_0));
  CARRY4 M_AXI_ARADDR_carry
       (.CI(1'b0),
        .CO({NLW_M_AXI_ARADDR_carry_CO_UNCONNECTED[3:2],M_AXI_ARADDR_carry_n_2,M_AXI_ARADDR_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,axi_araddr_reg[30],1'b0}),
        .O({NLW_M_AXI_ARADDR_carry_O_UNCONNECTED[3],m_data_araddr[25:23]}),
        .S({1'b0,axi_araddr_reg[31],M_AXI_ARADDR_carry_i_1__0_n_0,axi_araddr_reg[29]}));
  LUT1 #(
    .INIT(2'h1)) 
    M_AXI_ARADDR_carry_i_1__0
       (.I0(axi_araddr_reg[30]),
        .O(M_AXI_ARADDR_carry_i_1__0_n_0));
  CARRY4 M_AXI_AWADDR_carry
       (.CI(1'b0),
        .CO({NLW_M_AXI_AWADDR_carry_CO_UNCONNECTED[3:2],M_AXI_AWADDR_carry_n_2,M_AXI_AWADDR_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,axi_awaddr_reg[30],1'b0}),
        .O({NLW_M_AXI_AWADDR_carry_O_UNCONNECTED[3],m_data_awaddr[25:23]}),
        .S({1'b0,axi_awaddr_reg[31],M_AXI_AWADDR_carry_i_1__0_n_0,axi_awaddr_reg[29]}));
  LUT1 #(
    .INIT(2'h1)) 
    M_AXI_AWADDR_carry_i_1__0
       (.I0(axi_awaddr_reg[30]),
        .O(M_AXI_AWADDR_carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    \axi_araddr[28]_i_1__0 
       (.I0(axi_arvalid_reg_0),
        .I1(m_data_arready),
        .O(axi_arvalid0));
  LUT1 #(
    .INIT(2'h1)) 
    \axi_araddr[9]_i_2__0 
       (.I0(m_data_araddr[0]),
        .O(\axi_araddr[9]_i_2__0_n_0 ));
  FDRE \axi_araddr_reg[10] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[13]_i_1__0_n_7 ),
        .Q(m_data_araddr[4]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[11] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[13]_i_1__0_n_6 ),
        .Q(m_data_araddr[5]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[12] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[13]_i_1__0_n_5 ),
        .Q(m_data_araddr[6]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[13] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[13]_i_1__0_n_4 ),
        .Q(m_data_araddr[7]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_araddr_reg[13]_i_1__0 
       (.CI(\axi_araddr_reg[9]_i_1__0_n_0 ),
        .CO({\axi_araddr_reg[13]_i_1__0_n_0 ,\axi_araddr_reg[13]_i_1__0_n_1 ,\axi_araddr_reg[13]_i_1__0_n_2 ,\axi_araddr_reg[13]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[13]_i_1__0_n_4 ,\axi_araddr_reg[13]_i_1__0_n_5 ,\axi_araddr_reg[13]_i_1__0_n_6 ,\axi_araddr_reg[13]_i_1__0_n_7 }),
        .S(m_data_araddr[7:4]));
  FDRE \axi_araddr_reg[14] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[17]_i_1__0_n_7 ),
        .Q(m_data_araddr[8]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[15] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[17]_i_1__0_n_6 ),
        .Q(m_data_araddr[9]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[16] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[17]_i_1__0_n_5 ),
        .Q(m_data_araddr[10]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[17] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[17]_i_1__0_n_4 ),
        .Q(m_data_araddr[11]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_araddr_reg[17]_i_1__0 
       (.CI(\axi_araddr_reg[13]_i_1__0_n_0 ),
        .CO({\axi_araddr_reg[17]_i_1__0_n_0 ,\axi_araddr_reg[17]_i_1__0_n_1 ,\axi_araddr_reg[17]_i_1__0_n_2 ,\axi_araddr_reg[17]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[17]_i_1__0_n_4 ,\axi_araddr_reg[17]_i_1__0_n_5 ,\axi_araddr_reg[17]_i_1__0_n_6 ,\axi_araddr_reg[17]_i_1__0_n_7 }),
        .S(m_data_araddr[11:8]));
  FDRE \axi_araddr_reg[18] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[21]_i_1__0_n_7 ),
        .Q(m_data_araddr[12]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[19] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[21]_i_1__0_n_6 ),
        .Q(m_data_araddr[13]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[20] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[21]_i_1__0_n_5 ),
        .Q(m_data_araddr[14]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[21] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[21]_i_1__0_n_4 ),
        .Q(m_data_araddr[15]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_araddr_reg[21]_i_1__0 
       (.CI(\axi_araddr_reg[17]_i_1__0_n_0 ),
        .CO({\axi_araddr_reg[21]_i_1__0_n_0 ,\axi_araddr_reg[21]_i_1__0_n_1 ,\axi_araddr_reg[21]_i_1__0_n_2 ,\axi_araddr_reg[21]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[21]_i_1__0_n_4 ,\axi_araddr_reg[21]_i_1__0_n_5 ,\axi_araddr_reg[21]_i_1__0_n_6 ,\axi_araddr_reg[21]_i_1__0_n_7 }),
        .S(m_data_araddr[15:12]));
  FDRE \axi_araddr_reg[22] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[25]_i_1__0_n_7 ),
        .Q(m_data_araddr[16]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[23] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[25]_i_1__0_n_6 ),
        .Q(m_data_araddr[17]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[24] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[25]_i_1__0_n_5 ),
        .Q(m_data_araddr[18]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[25] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[25]_i_1__0_n_4 ),
        .Q(m_data_araddr[19]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_araddr_reg[25]_i_1__0 
       (.CI(\axi_araddr_reg[21]_i_1__0_n_0 ),
        .CO({\axi_araddr_reg[25]_i_1__0_n_0 ,\axi_araddr_reg[25]_i_1__0_n_1 ,\axi_araddr_reg[25]_i_1__0_n_2 ,\axi_araddr_reg[25]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[25]_i_1__0_n_4 ,\axi_araddr_reg[25]_i_1__0_n_5 ,\axi_araddr_reg[25]_i_1__0_n_6 ,\axi_araddr_reg[25]_i_1__0_n_7 }),
        .S(m_data_araddr[19:16]));
  FDRE \axi_araddr_reg[26] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[28]_i_2__0_n_7 ),
        .Q(m_data_araddr[20]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[27] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[28]_i_2__0_n_6 ),
        .Q(m_data_araddr[21]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[28] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[28]_i_2__0_n_5 ),
        .Q(m_data_araddr[22]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_araddr_reg[28]_i_2__0 
       (.CI(\axi_araddr_reg[25]_i_1__0_n_0 ),
        .CO({\axi_araddr_reg[28]_i_2__0_n_0 ,\axi_araddr_reg[28]_i_2__0_n_1 ,\axi_araddr_reg[28]_i_2__0_n_2 ,\axi_araddr_reg[28]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[28]_i_2__0_n_4 ,\axi_araddr_reg[28]_i_2__0_n_5 ,\axi_araddr_reg[28]_i_2__0_n_6 ,\axi_araddr_reg[28]_i_2__0_n_7 }),
        .S({axi_araddr_reg[29],m_data_araddr[22:20]}));
  FDRE \axi_araddr_reg[29] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[28]_i_2__0_n_4 ),
        .Q(axi_araddr_reg[29]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[30] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[30]_i_1__0_n_7 ),
        .Q(axi_araddr_reg[30]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_araddr_reg[30]_i_1__0 
       (.CI(\axi_araddr_reg[28]_i_2__0_n_0 ),
        .CO({\NLW_axi_araddr_reg[30]_i_1__0_CO_UNCONNECTED [3:1],\axi_araddr_reg[30]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_axi_araddr_reg[30]_i_1__0_O_UNCONNECTED [3:2],\axi_araddr_reg[30]_i_1__0_n_6 ,\axi_araddr_reg[30]_i_1__0_n_7 }),
        .S({1'b0,1'b0,axi_araddr_reg[31:30]}));
  FDRE \axi_araddr_reg[31] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[30]_i_1__0_n_6 ),
        .Q(axi_araddr_reg[31]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[6] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[9]_i_1__0_n_7 ),
        .Q(m_data_araddr[0]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[7] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[9]_i_1__0_n_6 ),
        .Q(m_data_araddr[1]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[8] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[9]_i_1__0_n_5 ),
        .Q(m_data_araddr[2]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_araddr_reg[9] 
       (.C(m_data_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[9]_i_1__0_n_4 ),
        .Q(m_data_araddr[3]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_araddr_reg[9]_i_1__0 
       (.CI(1'b0),
        .CO({\axi_araddr_reg[9]_i_1__0_n_0 ,\axi_araddr_reg[9]_i_1__0_n_1 ,\axi_araddr_reg[9]_i_1__0_n_2 ,\axi_araddr_reg[9]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\axi_araddr_reg[9]_i_1__0_n_4 ,\axi_araddr_reg[9]_i_1__0_n_5 ,\axi_araddr_reg[9]_i_1__0_n_6 ,\axi_araddr_reg[9]_i_1__0_n_7 }),
        .S({m_data_araddr[3:1],\axi_araddr[9]_i_2__0_n_0 }));
  LUT3 #(
    .INIT(8'h3A)) 
    axi_arvalid_i_1__0
       (.I0(start_single_burst_read_reg_n_0),
        .I1(m_data_arready),
        .I2(axi_arvalid_reg_0),
        .O(axi_arvalid_i_1__0_n_0));
  FDRE axi_arvalid_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(axi_arvalid_i_1__0_n_0),
        .Q(axi_arvalid_reg_0),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h4F)) 
    \axi_awaddr[28]_i_1__0 
       (.I0(init_txn_ff2),
        .I1(init_txn_ff),
        .I2(m_data_aresetn),
        .O(\axi_awaddr[28]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \axi_awaddr[28]_i_2__0 
       (.I0(axi_awvalid_reg_0),
        .I1(m_data_awready),
        .O(axi_awvalid0));
  LUT1 #(
    .INIT(2'h1)) 
    \axi_awaddr[9]_i_2__0 
       (.I0(m_data_awaddr[0]),
        .O(\axi_awaddr[9]_i_2__0_n_0 ));
  FDRE \axi_awaddr_reg[10] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[13]_i_1__0_n_7 ),
        .Q(m_data_awaddr[4]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[11] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[13]_i_1__0_n_6 ),
        .Q(m_data_awaddr[5]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[12] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[13]_i_1__0_n_5 ),
        .Q(m_data_awaddr[6]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[13] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[13]_i_1__0_n_4 ),
        .Q(m_data_awaddr[7]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_awaddr_reg[13]_i_1__0 
       (.CI(\axi_awaddr_reg[9]_i_1__0_n_0 ),
        .CO({\axi_awaddr_reg[13]_i_1__0_n_0 ,\axi_awaddr_reg[13]_i_1__0_n_1 ,\axi_awaddr_reg[13]_i_1__0_n_2 ,\axi_awaddr_reg[13]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_awaddr_reg[13]_i_1__0_n_4 ,\axi_awaddr_reg[13]_i_1__0_n_5 ,\axi_awaddr_reg[13]_i_1__0_n_6 ,\axi_awaddr_reg[13]_i_1__0_n_7 }),
        .S(m_data_awaddr[7:4]));
  FDRE \axi_awaddr_reg[14] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[17]_i_1__0_n_7 ),
        .Q(m_data_awaddr[8]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[15] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[17]_i_1__0_n_6 ),
        .Q(m_data_awaddr[9]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[16] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[17]_i_1__0_n_5 ),
        .Q(m_data_awaddr[10]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[17] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[17]_i_1__0_n_4 ),
        .Q(m_data_awaddr[11]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_awaddr_reg[17]_i_1__0 
       (.CI(\axi_awaddr_reg[13]_i_1__0_n_0 ),
        .CO({\axi_awaddr_reg[17]_i_1__0_n_0 ,\axi_awaddr_reg[17]_i_1__0_n_1 ,\axi_awaddr_reg[17]_i_1__0_n_2 ,\axi_awaddr_reg[17]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_awaddr_reg[17]_i_1__0_n_4 ,\axi_awaddr_reg[17]_i_1__0_n_5 ,\axi_awaddr_reg[17]_i_1__0_n_6 ,\axi_awaddr_reg[17]_i_1__0_n_7 }),
        .S(m_data_awaddr[11:8]));
  FDRE \axi_awaddr_reg[18] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[21]_i_1__0_n_7 ),
        .Q(m_data_awaddr[12]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[19] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[21]_i_1__0_n_6 ),
        .Q(m_data_awaddr[13]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[20] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[21]_i_1__0_n_5 ),
        .Q(m_data_awaddr[14]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[21] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[21]_i_1__0_n_4 ),
        .Q(m_data_awaddr[15]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_awaddr_reg[21]_i_1__0 
       (.CI(\axi_awaddr_reg[17]_i_1__0_n_0 ),
        .CO({\axi_awaddr_reg[21]_i_1__0_n_0 ,\axi_awaddr_reg[21]_i_1__0_n_1 ,\axi_awaddr_reg[21]_i_1__0_n_2 ,\axi_awaddr_reg[21]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_awaddr_reg[21]_i_1__0_n_4 ,\axi_awaddr_reg[21]_i_1__0_n_5 ,\axi_awaddr_reg[21]_i_1__0_n_6 ,\axi_awaddr_reg[21]_i_1__0_n_7 }),
        .S(m_data_awaddr[15:12]));
  FDRE \axi_awaddr_reg[22] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[25]_i_1__0_n_7 ),
        .Q(m_data_awaddr[16]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[23] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[25]_i_1__0_n_6 ),
        .Q(m_data_awaddr[17]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[24] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[25]_i_1__0_n_5 ),
        .Q(m_data_awaddr[18]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[25] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[25]_i_1__0_n_4 ),
        .Q(m_data_awaddr[19]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_awaddr_reg[25]_i_1__0 
       (.CI(\axi_awaddr_reg[21]_i_1__0_n_0 ),
        .CO({\axi_awaddr_reg[25]_i_1__0_n_0 ,\axi_awaddr_reg[25]_i_1__0_n_1 ,\axi_awaddr_reg[25]_i_1__0_n_2 ,\axi_awaddr_reg[25]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_awaddr_reg[25]_i_1__0_n_4 ,\axi_awaddr_reg[25]_i_1__0_n_5 ,\axi_awaddr_reg[25]_i_1__0_n_6 ,\axi_awaddr_reg[25]_i_1__0_n_7 }),
        .S(m_data_awaddr[19:16]));
  FDRE \axi_awaddr_reg[26] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[28]_i_3__0_n_7 ),
        .Q(m_data_awaddr[20]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[27] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[28]_i_3__0_n_6 ),
        .Q(m_data_awaddr[21]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[28] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[28]_i_3__0_n_5 ),
        .Q(m_data_awaddr[22]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_awaddr_reg[28]_i_3__0 
       (.CI(\axi_awaddr_reg[25]_i_1__0_n_0 ),
        .CO({\axi_awaddr_reg[28]_i_3__0_n_0 ,\axi_awaddr_reg[28]_i_3__0_n_1 ,\axi_awaddr_reg[28]_i_3__0_n_2 ,\axi_awaddr_reg[28]_i_3__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_awaddr_reg[28]_i_3__0_n_4 ,\axi_awaddr_reg[28]_i_3__0_n_5 ,\axi_awaddr_reg[28]_i_3__0_n_6 ,\axi_awaddr_reg[28]_i_3__0_n_7 }),
        .S({axi_awaddr_reg[29],m_data_awaddr[22:20]}));
  FDRE \axi_awaddr_reg[29] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[28]_i_3__0_n_4 ),
        .Q(axi_awaddr_reg[29]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[30] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[30]_i_1__0_n_7 ),
        .Q(axi_awaddr_reg[30]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_awaddr_reg[30]_i_1__0 
       (.CI(\axi_awaddr_reg[28]_i_3__0_n_0 ),
        .CO({\NLW_axi_awaddr_reg[30]_i_1__0_CO_UNCONNECTED [3:1],\axi_awaddr_reg[30]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_axi_awaddr_reg[30]_i_1__0_O_UNCONNECTED [3:2],\axi_awaddr_reg[30]_i_1__0_n_6 ,\axi_awaddr_reg[30]_i_1__0_n_7 }),
        .S({1'b0,1'b0,axi_awaddr_reg[31:30]}));
  FDRE \axi_awaddr_reg[31] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[30]_i_1__0_n_6 ),
        .Q(axi_awaddr_reg[31]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[6] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[9]_i_1__0_n_7 ),
        .Q(m_data_awaddr[0]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[7] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[9]_i_1__0_n_6 ),
        .Q(m_data_awaddr[1]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[8] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[9]_i_1__0_n_5 ),
        .Q(m_data_awaddr[2]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_awaddr_reg[9] 
       (.C(m_data_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[9]_i_1__0_n_4 ),
        .Q(m_data_awaddr[3]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_awaddr_reg[9]_i_1__0 
       (.CI(1'b0),
        .CO({\axi_awaddr_reg[9]_i_1__0_n_0 ,\axi_awaddr_reg[9]_i_1__0_n_1 ,\axi_awaddr_reg[9]_i_1__0_n_2 ,\axi_awaddr_reg[9]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\axi_awaddr_reg[9]_i_1__0_n_4 ,\axi_awaddr_reg[9]_i_1__0_n_5 ,\axi_awaddr_reg[9]_i_1__0_n_6 ,\axi_awaddr_reg[9]_i_1__0_n_7 }),
        .S({m_data_awaddr[3:1],\axi_awaddr[9]_i_2__0_n_0 }));
  LUT3 #(
    .INIT(8'h3A)) 
    axi_awvalid_i_1__0
       (.I0(start_single_burst_write_reg_n_0),
        .I1(m_data_awready),
        .I2(axi_awvalid_reg_0),
        .O(axi_awvalid_i_1__0_n_0));
  FDRE axi_awvalid_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(axi_awvalid_i_1__0_n_0),
        .Q(axi_awvalid_reg_0),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_bready_i_1__0
       (.I0(m_data_bvalid),
        .I1(axi_bready_reg_0),
        .O(axi_bready0));
  FDRE axi_bready_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(axi_bready0),
        .Q(axi_bready_reg_0),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h00B0B000B0B0B000)) 
    axi_rready_i_1__0
       (.I0(init_txn_ff2),
        .I1(init_txn_ff),
        .I2(m_data_aresetn),
        .I3(m_data_rvalid),
        .I4(axi_rready_reg_0),
        .I5(m_data_rlast),
        .O(axi_rready_i_1__0_n_0));
  FDRE axi_rready_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(axi_rready_i_1__0_n_0),
        .Q(axi_rready_reg_0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \axi_wdata[31]_i_1__0 
       (.I0(axi_wvalid_reg_0),
        .I1(m_data_wready),
        .O(p_13_in));
  LUT1 #(
    .INIT(2'h1)) 
    \axi_wdata[3]_i_2__0 
       (.I0(m_data_wdata[0]),
        .O(\axi_wdata[3]_i_2__0_n_0 ));
  FDSE \axi_wdata_reg[0] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[3]_i_1__0_n_7 ),
        .Q(m_data_wdata[0]),
        .S(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[10] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[11]_i_1__0_n_5 ),
        .Q(m_data_wdata[10]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[11] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[11]_i_1__0_n_4 ),
        .Q(m_data_wdata[11]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_wdata_reg[11]_i_1__0 
       (.CI(\axi_wdata_reg[7]_i_1__0_n_0 ),
        .CO({\axi_wdata_reg[11]_i_1__0_n_0 ,\axi_wdata_reg[11]_i_1__0_n_1 ,\axi_wdata_reg[11]_i_1__0_n_2 ,\axi_wdata_reg[11]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_wdata_reg[11]_i_1__0_n_4 ,\axi_wdata_reg[11]_i_1__0_n_5 ,\axi_wdata_reg[11]_i_1__0_n_6 ,\axi_wdata_reg[11]_i_1__0_n_7 }),
        .S(m_data_wdata[11:8]));
  FDRE \axi_wdata_reg[12] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[15]_i_1__0_n_7 ),
        .Q(m_data_wdata[12]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[13] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[15]_i_1__0_n_6 ),
        .Q(m_data_wdata[13]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[14] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[15]_i_1__0_n_5 ),
        .Q(m_data_wdata[14]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[15] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[15]_i_1__0_n_4 ),
        .Q(m_data_wdata[15]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_wdata_reg[15]_i_1__0 
       (.CI(\axi_wdata_reg[11]_i_1__0_n_0 ),
        .CO({\axi_wdata_reg[15]_i_1__0_n_0 ,\axi_wdata_reg[15]_i_1__0_n_1 ,\axi_wdata_reg[15]_i_1__0_n_2 ,\axi_wdata_reg[15]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_wdata_reg[15]_i_1__0_n_4 ,\axi_wdata_reg[15]_i_1__0_n_5 ,\axi_wdata_reg[15]_i_1__0_n_6 ,\axi_wdata_reg[15]_i_1__0_n_7 }),
        .S(m_data_wdata[15:12]));
  FDRE \axi_wdata_reg[16] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[19]_i_1__0_n_7 ),
        .Q(m_data_wdata[16]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[17] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[19]_i_1__0_n_6 ),
        .Q(m_data_wdata[17]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[18] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[19]_i_1__0_n_5 ),
        .Q(m_data_wdata[18]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[19] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[19]_i_1__0_n_4 ),
        .Q(m_data_wdata[19]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_wdata_reg[19]_i_1__0 
       (.CI(\axi_wdata_reg[15]_i_1__0_n_0 ),
        .CO({\axi_wdata_reg[19]_i_1__0_n_0 ,\axi_wdata_reg[19]_i_1__0_n_1 ,\axi_wdata_reg[19]_i_1__0_n_2 ,\axi_wdata_reg[19]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_wdata_reg[19]_i_1__0_n_4 ,\axi_wdata_reg[19]_i_1__0_n_5 ,\axi_wdata_reg[19]_i_1__0_n_6 ,\axi_wdata_reg[19]_i_1__0_n_7 }),
        .S(m_data_wdata[19:16]));
  FDRE \axi_wdata_reg[1] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[3]_i_1__0_n_6 ),
        .Q(m_data_wdata[1]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[20] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[23]_i_1__0_n_7 ),
        .Q(m_data_wdata[20]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[21] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[23]_i_1__0_n_6 ),
        .Q(m_data_wdata[21]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[22] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[23]_i_1__0_n_5 ),
        .Q(m_data_wdata[22]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[23] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[23]_i_1__0_n_4 ),
        .Q(m_data_wdata[23]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_wdata_reg[23]_i_1__0 
       (.CI(\axi_wdata_reg[19]_i_1__0_n_0 ),
        .CO({\axi_wdata_reg[23]_i_1__0_n_0 ,\axi_wdata_reg[23]_i_1__0_n_1 ,\axi_wdata_reg[23]_i_1__0_n_2 ,\axi_wdata_reg[23]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_wdata_reg[23]_i_1__0_n_4 ,\axi_wdata_reg[23]_i_1__0_n_5 ,\axi_wdata_reg[23]_i_1__0_n_6 ,\axi_wdata_reg[23]_i_1__0_n_7 }),
        .S(m_data_wdata[23:20]));
  FDRE \axi_wdata_reg[24] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[27]_i_1__0_n_7 ),
        .Q(m_data_wdata[24]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[25] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[27]_i_1__0_n_6 ),
        .Q(m_data_wdata[25]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[26] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[27]_i_1__0_n_5 ),
        .Q(m_data_wdata[26]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[27] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[27]_i_1__0_n_4 ),
        .Q(m_data_wdata[27]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_wdata_reg[27]_i_1__0 
       (.CI(\axi_wdata_reg[23]_i_1__0_n_0 ),
        .CO({\axi_wdata_reg[27]_i_1__0_n_0 ,\axi_wdata_reg[27]_i_1__0_n_1 ,\axi_wdata_reg[27]_i_1__0_n_2 ,\axi_wdata_reg[27]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_wdata_reg[27]_i_1__0_n_4 ,\axi_wdata_reg[27]_i_1__0_n_5 ,\axi_wdata_reg[27]_i_1__0_n_6 ,\axi_wdata_reg[27]_i_1__0_n_7 }),
        .S(m_data_wdata[27:24]));
  FDRE \axi_wdata_reg[28] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[31]_i_2__0_n_7 ),
        .Q(m_data_wdata[28]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[29] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[31]_i_2__0_n_6 ),
        .Q(m_data_wdata[29]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[2] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[3]_i_1__0_n_5 ),
        .Q(m_data_wdata[2]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[30] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[31]_i_2__0_n_5 ),
        .Q(m_data_wdata[30]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[31] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[31]_i_2__0_n_4 ),
        .Q(m_data_wdata[31]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_wdata_reg[31]_i_2__0 
       (.CI(\axi_wdata_reg[27]_i_1__0_n_0 ),
        .CO({\NLW_axi_wdata_reg[31]_i_2__0_CO_UNCONNECTED [3],\axi_wdata_reg[31]_i_2__0_n_1 ,\axi_wdata_reg[31]_i_2__0_n_2 ,\axi_wdata_reg[31]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_wdata_reg[31]_i_2__0_n_4 ,\axi_wdata_reg[31]_i_2__0_n_5 ,\axi_wdata_reg[31]_i_2__0_n_6 ,\axi_wdata_reg[31]_i_2__0_n_7 }),
        .S(m_data_wdata[31:28]));
  FDRE \axi_wdata_reg[3] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[3]_i_1__0_n_4 ),
        .Q(m_data_wdata[3]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_wdata_reg[3]_i_1__0 
       (.CI(1'b0),
        .CO({\axi_wdata_reg[3]_i_1__0_n_0 ,\axi_wdata_reg[3]_i_1__0_n_1 ,\axi_wdata_reg[3]_i_1__0_n_2 ,\axi_wdata_reg[3]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\axi_wdata_reg[3]_i_1__0_n_4 ,\axi_wdata_reg[3]_i_1__0_n_5 ,\axi_wdata_reg[3]_i_1__0_n_6 ,\axi_wdata_reg[3]_i_1__0_n_7 }),
        .S({m_data_wdata[3:1],\axi_wdata[3]_i_2__0_n_0 }));
  FDRE \axi_wdata_reg[4] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[7]_i_1__0_n_7 ),
        .Q(m_data_wdata[4]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[5] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[7]_i_1__0_n_6 ),
        .Q(m_data_wdata[5]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[6] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[7]_i_1__0_n_5 ),
        .Q(m_data_wdata[6]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[7] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[7]_i_1__0_n_4 ),
        .Q(m_data_wdata[7]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \axi_wdata_reg[7]_i_1__0 
       (.CI(\axi_wdata_reg[3]_i_1__0_n_0 ),
        .CO({\axi_wdata_reg[7]_i_1__0_n_0 ,\axi_wdata_reg[7]_i_1__0_n_1 ,\axi_wdata_reg[7]_i_1__0_n_2 ,\axi_wdata_reg[7]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_wdata_reg[7]_i_1__0_n_4 ,\axi_wdata_reg[7]_i_1__0_n_5 ,\axi_wdata_reg[7]_i_1__0_n_6 ,\axi_wdata_reg[7]_i_1__0_n_7 }),
        .S(m_data_wdata[7:4]));
  FDRE \axi_wdata_reg[8] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[11]_i_1__0_n_7 ),
        .Q(m_data_wdata[8]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \axi_wdata_reg[9] 
       (.C(m_data_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[11]_i_1__0_n_6 ),
        .Q(m_data_wdata[9]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hBFAA)) 
    axi_wlast_i_1__0
       (.I0(axi_wlast0),
        .I1(m_data_wready),
        .I2(axi_wvalid_reg_0),
        .I3(m_data_wlast),
        .O(axi_wlast_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    axi_wlast_i_2__0
       (.I0(p_13_in),
        .I1(write_index_reg__0[3]),
        .I2(write_index_reg__0[4]),
        .I3(write_index_reg__0[2]),
        .I4(write_index_reg__0[1]),
        .I5(write_index_reg__0[0]),
        .O(axi_wlast0));
  FDRE axi_wlast_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(axi_wlast_i_1__0_n_0),
        .Q(m_data_wlast),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h2EEE)) 
    axi_wvalid_i_1__0
       (.I0(start_single_burst_write_reg_n_0),
        .I1(axi_wvalid_reg_0),
        .I2(m_data_wready),
        .I3(m_data_wlast),
        .O(axi_wvalid_i_1__0_n_0));
  FDRE axi_wvalid_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(axi_wvalid_i_1__0_n_0),
        .Q(axi_wvalid_reg_0),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hBFFFAAAA)) 
    burst_read_active_i_1__0
       (.I0(start_single_burst_read_reg_n_0),
        .I1(m_data_rlast),
        .I2(axi_rready_reg_0),
        .I3(m_data_rvalid),
        .I4(burst_read_active),
        .O(burst_read_active_i_1__0_n_0));
  FDRE burst_read_active_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(burst_read_active_i_1__0_n_0),
        .Q(burst_read_active),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hBFAA)) 
    burst_write_active_i_1__0
       (.I0(start_single_burst_write_reg_n_0),
        .I1(m_data_bvalid),
        .I2(axi_bready_reg_0),
        .I3(burst_write_active),
        .O(burst_write_active_i_1__0_n_0));
  FDRE burst_write_active_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(burst_write_active_i_1__0_n_0),
        .Q(burst_write_active),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    compare_done_i_1__0
       (.I0(m_data_aresetn),
        .O(compare_done_i_1__0_n_0));
  LUT5 #(
    .INIT(32'hFFEFAA00)) 
    compare_done_i_2__0
       (.I0(mst_exec_state),
        .I1(init_txn_ff2),
        .I2(init_txn_ff),
        .I3(compare_done),
        .I4(m_data_txn_done),
        .O(compare_done_i_2__0_n_0));
  FDRE compare_done_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(compare_done_i_2__0_n_0),
        .Q(m_data_txn_done),
        .R(compare_done_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF888)) 
    error_reg_i_1__0
       (.I0(p_9_in),
        .I1(m_data_rresp),
        .I2(p_7_in),
        .I3(m_data_bresp),
        .I4(read_mismatch),
        .I5(error_reg),
        .O(error_reg_i_1__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    error_reg_i_2__0
       (.I0(axi_bready_reg_0),
        .I1(m_data_bvalid),
        .O(p_7_in));
  FDRE error_reg_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(error_reg_i_1__0_n_0),
        .Q(error_reg),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \expected_rdata[0]_i_1__0 
       (.I0(axi_rready_reg_0),
        .I1(m_data_rvalid),
        .O(p_9_in));
  LUT1 #(
    .INIT(2'h1)) 
    \expected_rdata[0]_i_3__0 
       (.I0(expected_rdata_reg[0]),
        .O(\expected_rdata[0]_i_3__0_n_0 ));
  FDSE \expected_rdata_reg[0] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[0]_i_2__0_n_7 ),
        .Q(expected_rdata_reg[0]),
        .S(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \expected_rdata_reg[0]_i_2__0 
       (.CI(1'b0),
        .CO({\expected_rdata_reg[0]_i_2__0_n_0 ,\expected_rdata_reg[0]_i_2__0_n_1 ,\expected_rdata_reg[0]_i_2__0_n_2 ,\expected_rdata_reg[0]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\expected_rdata_reg[0]_i_2__0_n_4 ,\expected_rdata_reg[0]_i_2__0_n_5 ,\expected_rdata_reg[0]_i_2__0_n_6 ,\expected_rdata_reg[0]_i_2__0_n_7 }),
        .S({expected_rdata_reg[3:1],\expected_rdata[0]_i_3__0_n_0 }));
  FDRE \expected_rdata_reg[10] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[8]_i_1__0_n_5 ),
        .Q(expected_rdata_reg[10]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[11] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[8]_i_1__0_n_4 ),
        .Q(expected_rdata_reg[11]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[12] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[12]_i_1__0_n_7 ),
        .Q(expected_rdata_reg[12]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \expected_rdata_reg[12]_i_1__0 
       (.CI(\expected_rdata_reg[8]_i_1__0_n_0 ),
        .CO({\expected_rdata_reg[12]_i_1__0_n_0 ,\expected_rdata_reg[12]_i_1__0_n_1 ,\expected_rdata_reg[12]_i_1__0_n_2 ,\expected_rdata_reg[12]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\expected_rdata_reg[12]_i_1__0_n_4 ,\expected_rdata_reg[12]_i_1__0_n_5 ,\expected_rdata_reg[12]_i_1__0_n_6 ,\expected_rdata_reg[12]_i_1__0_n_7 }),
        .S(expected_rdata_reg[15:12]));
  FDRE \expected_rdata_reg[13] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[12]_i_1__0_n_6 ),
        .Q(expected_rdata_reg[13]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[14] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[12]_i_1__0_n_5 ),
        .Q(expected_rdata_reg[14]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[15] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[12]_i_1__0_n_4 ),
        .Q(expected_rdata_reg[15]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[16] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[16]_i_1__0_n_7 ),
        .Q(expected_rdata_reg[16]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \expected_rdata_reg[16]_i_1__0 
       (.CI(\expected_rdata_reg[12]_i_1__0_n_0 ),
        .CO({\expected_rdata_reg[16]_i_1__0_n_0 ,\expected_rdata_reg[16]_i_1__0_n_1 ,\expected_rdata_reg[16]_i_1__0_n_2 ,\expected_rdata_reg[16]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\expected_rdata_reg[16]_i_1__0_n_4 ,\expected_rdata_reg[16]_i_1__0_n_5 ,\expected_rdata_reg[16]_i_1__0_n_6 ,\expected_rdata_reg[16]_i_1__0_n_7 }),
        .S(expected_rdata_reg[19:16]));
  FDRE \expected_rdata_reg[17] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[16]_i_1__0_n_6 ),
        .Q(expected_rdata_reg[17]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[18] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[16]_i_1__0_n_5 ),
        .Q(expected_rdata_reg[18]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[19] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[16]_i_1__0_n_4 ),
        .Q(expected_rdata_reg[19]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[1] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[0]_i_2__0_n_6 ),
        .Q(expected_rdata_reg[1]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[20] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[20]_i_1__0_n_7 ),
        .Q(expected_rdata_reg[20]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \expected_rdata_reg[20]_i_1__0 
       (.CI(\expected_rdata_reg[16]_i_1__0_n_0 ),
        .CO({\expected_rdata_reg[20]_i_1__0_n_0 ,\expected_rdata_reg[20]_i_1__0_n_1 ,\expected_rdata_reg[20]_i_1__0_n_2 ,\expected_rdata_reg[20]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\expected_rdata_reg[20]_i_1__0_n_4 ,\expected_rdata_reg[20]_i_1__0_n_5 ,\expected_rdata_reg[20]_i_1__0_n_6 ,\expected_rdata_reg[20]_i_1__0_n_7 }),
        .S(expected_rdata_reg[23:20]));
  FDRE \expected_rdata_reg[21] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[20]_i_1__0_n_6 ),
        .Q(expected_rdata_reg[21]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[22] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[20]_i_1__0_n_5 ),
        .Q(expected_rdata_reg[22]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[23] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[20]_i_1__0_n_4 ),
        .Q(expected_rdata_reg[23]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[24] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[24]_i_1__0_n_7 ),
        .Q(expected_rdata_reg[24]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \expected_rdata_reg[24]_i_1__0 
       (.CI(\expected_rdata_reg[20]_i_1__0_n_0 ),
        .CO({\expected_rdata_reg[24]_i_1__0_n_0 ,\expected_rdata_reg[24]_i_1__0_n_1 ,\expected_rdata_reg[24]_i_1__0_n_2 ,\expected_rdata_reg[24]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\expected_rdata_reg[24]_i_1__0_n_4 ,\expected_rdata_reg[24]_i_1__0_n_5 ,\expected_rdata_reg[24]_i_1__0_n_6 ,\expected_rdata_reg[24]_i_1__0_n_7 }),
        .S(expected_rdata_reg[27:24]));
  FDRE \expected_rdata_reg[25] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[24]_i_1__0_n_6 ),
        .Q(expected_rdata_reg[25]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[26] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[24]_i_1__0_n_5 ),
        .Q(expected_rdata_reg[26]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[27] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[24]_i_1__0_n_4 ),
        .Q(expected_rdata_reg[27]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[28] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[28]_i_1__0_n_7 ),
        .Q(expected_rdata_reg[28]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \expected_rdata_reg[28]_i_1__0 
       (.CI(\expected_rdata_reg[24]_i_1__0_n_0 ),
        .CO({\NLW_expected_rdata_reg[28]_i_1__0_CO_UNCONNECTED [3],\expected_rdata_reg[28]_i_1__0_n_1 ,\expected_rdata_reg[28]_i_1__0_n_2 ,\expected_rdata_reg[28]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\expected_rdata_reg[28]_i_1__0_n_4 ,\expected_rdata_reg[28]_i_1__0_n_5 ,\expected_rdata_reg[28]_i_1__0_n_6 ,\expected_rdata_reg[28]_i_1__0_n_7 }),
        .S(expected_rdata_reg[31:28]));
  FDRE \expected_rdata_reg[29] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[28]_i_1__0_n_6 ),
        .Q(expected_rdata_reg[29]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[2] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[0]_i_2__0_n_5 ),
        .Q(expected_rdata_reg[2]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[30] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[28]_i_1__0_n_5 ),
        .Q(expected_rdata_reg[30]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[31] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[28]_i_1__0_n_4 ),
        .Q(expected_rdata_reg[31]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[3] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[0]_i_2__0_n_4 ),
        .Q(expected_rdata_reg[3]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[4] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[4]_i_1__0_n_7 ),
        .Q(expected_rdata_reg[4]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \expected_rdata_reg[4]_i_1__0 
       (.CI(\expected_rdata_reg[0]_i_2__0_n_0 ),
        .CO({\expected_rdata_reg[4]_i_1__0_n_0 ,\expected_rdata_reg[4]_i_1__0_n_1 ,\expected_rdata_reg[4]_i_1__0_n_2 ,\expected_rdata_reg[4]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\expected_rdata_reg[4]_i_1__0_n_4 ,\expected_rdata_reg[4]_i_1__0_n_5 ,\expected_rdata_reg[4]_i_1__0_n_6 ,\expected_rdata_reg[4]_i_1__0_n_7 }),
        .S(expected_rdata_reg[7:4]));
  FDRE \expected_rdata_reg[5] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[4]_i_1__0_n_6 ),
        .Q(expected_rdata_reg[5]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[6] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[4]_i_1__0_n_5 ),
        .Q(expected_rdata_reg[6]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[7] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[4]_i_1__0_n_4 ),
        .Q(expected_rdata_reg[7]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \expected_rdata_reg[8] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[8]_i_1__0_n_7 ),
        .Q(expected_rdata_reg[8]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  CARRY4 \expected_rdata_reg[8]_i_1__0 
       (.CI(\expected_rdata_reg[4]_i_1__0_n_0 ),
        .CO({\expected_rdata_reg[8]_i_1__0_n_0 ,\expected_rdata_reg[8]_i_1__0_n_1 ,\expected_rdata_reg[8]_i_1__0_n_2 ,\expected_rdata_reg[8]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\expected_rdata_reg[8]_i_1__0_n_4 ,\expected_rdata_reg[8]_i_1__0_n_5 ,\expected_rdata_reg[8]_i_1__0_n_6 ,\expected_rdata_reg[8]_i_1__0_n_7 }),
        .S(expected_rdata_reg[11:8]));
  FDRE \expected_rdata_reg[9] 
       (.C(m_data_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[8]_i_1__0_n_6 ),
        .Q(expected_rdata_reg[9]),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE init_txn_ff2_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(init_txn_ff),
        .Q(init_txn_ff2),
        .R(compare_done_i_1__0_n_0));
  FDRE init_txn_ff_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(m_data_init_axi_txn),
        .Q(init_txn_ff),
        .R(compare_done_i_1__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \read_burst_counter[0]_i_1__0 
       (.I0(\read_burst_counter_reg_n_0_[0] ),
        .O(p_0_in__2[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \read_burst_counter[1]_i_1__0 
       (.I0(\read_burst_counter_reg_n_0_[0] ),
        .I1(\read_burst_counter_reg_n_0_[1] ),
        .O(p_0_in__2[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \read_burst_counter[2]_i_1__0 
       (.I0(\read_burst_counter_reg_n_0_[0] ),
        .I1(\read_burst_counter_reg_n_0_[1] ),
        .I2(\read_burst_counter_reg_n_0_[2] ),
        .O(p_0_in__2[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \read_burst_counter[3]_i_1__0 
       (.I0(\read_burst_counter_reg_n_0_[1] ),
        .I1(\read_burst_counter_reg_n_0_[0] ),
        .I2(\read_burst_counter_reg_n_0_[2] ),
        .I3(\read_burst_counter_reg_n_0_[3] ),
        .O(p_0_in__2[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \read_burst_counter[4]_i_1__0 
       (.I0(\read_burst_counter_reg_n_0_[2] ),
        .I1(\read_burst_counter_reg_n_0_[0] ),
        .I2(\read_burst_counter_reg_n_0_[1] ),
        .I3(\read_burst_counter_reg_n_0_[3] ),
        .I4(\read_burst_counter_reg_n_0_[4] ),
        .O(p_0_in__2[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \read_burst_counter[5]_i_1__0 
       (.I0(\read_burst_counter_reg_n_0_[3] ),
        .I1(\read_burst_counter_reg_n_0_[1] ),
        .I2(\read_burst_counter_reg_n_0_[0] ),
        .I3(\read_burst_counter_reg_n_0_[2] ),
        .I4(\read_burst_counter_reg_n_0_[4] ),
        .I5(\read_burst_counter_reg_n_0_[5] ),
        .O(p_0_in__2[5]));
  LUT3 #(
    .INIT(8'h08)) 
    \read_burst_counter[6]_i_1__0 
       (.I0(m_data_arready),
        .I1(axi_arvalid_reg_0),
        .I2(p_0_in),
        .O(read_burst_counter));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \read_burst_counter[6]_i_2__0 
       (.I0(\read_burst_counter_reg_n_0_[4] ),
        .I1(\read_burst_counter_reg_n_0_[2] ),
        .I2(\read_burst_counter_reg_n_0_[0] ),
        .I3(\read_burst_counter_reg_n_0_[1] ),
        .I4(\read_burst_counter_reg_n_0_[3] ),
        .I5(\read_burst_counter_reg_n_0_[5] ),
        .O(p_0_in__2[6]));
  FDRE \read_burst_counter_reg[0] 
       (.C(m_data_aclk),
        .CE(read_burst_counter),
        .D(p_0_in__2[0]),
        .Q(\read_burst_counter_reg_n_0_[0] ),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \read_burst_counter_reg[1] 
       (.C(m_data_aclk),
        .CE(read_burst_counter),
        .D(p_0_in__2[1]),
        .Q(\read_burst_counter_reg_n_0_[1] ),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \read_burst_counter_reg[2] 
       (.C(m_data_aclk),
        .CE(read_burst_counter),
        .D(p_0_in__2[2]),
        .Q(\read_burst_counter_reg_n_0_[2] ),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \read_burst_counter_reg[3] 
       (.C(m_data_aclk),
        .CE(read_burst_counter),
        .D(p_0_in__2[3]),
        .Q(\read_burst_counter_reg_n_0_[3] ),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \read_burst_counter_reg[4] 
       (.C(m_data_aclk),
        .CE(read_burst_counter),
        .D(p_0_in__2[4]),
        .Q(\read_burst_counter_reg_n_0_[4] ),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \read_burst_counter_reg[5] 
       (.C(m_data_aclk),
        .CE(read_burst_counter),
        .D(p_0_in__2[5]),
        .Q(\read_burst_counter_reg_n_0_[5] ),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \read_burst_counter_reg[6] 
       (.C(m_data_aclk),
        .CE(read_burst_counter),
        .D(p_0_in__2[6]),
        .Q(p_0_in),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \read_index[0]_i_1__0 
       (.I0(read_index_reg__0[0]),
        .O(p_0_in__5[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \read_index[1]_i_1__0 
       (.I0(read_index_reg__0[0]),
        .I1(read_index_reg__0[1]),
        .O(p_0_in__5[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \read_index[2]_i_1__0 
       (.I0(read_index_reg__0[0]),
        .I1(read_index_reg__0[1]),
        .I2(read_index_reg__0[2]),
        .O(\read_index[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \read_index[3]_i_1__0 
       (.I0(read_index_reg__0[1]),
        .I1(read_index_reg__0[0]),
        .I2(read_index_reg__0[2]),
        .I3(read_index_reg__0[3]),
        .O(p_0_in__5[3]));
  LUT4 #(
    .INIT(16'hFF4F)) 
    \read_index[4]_i_1__0 
       (.I0(init_txn_ff2),
        .I1(init_txn_ff),
        .I2(m_data_aresetn),
        .I3(start_single_burst_read_reg_n_0),
        .O(\read_index[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7FFF00000000)) 
    \read_index[4]_i_2__0 
       (.I0(read_index_reg__0[0]),
        .I1(read_index_reg__0[3]),
        .I2(read_index_reg__0[1]),
        .I3(read_index_reg__0[2]),
        .I4(read_index_reg__0[4]),
        .I5(p_9_in),
        .O(read_index0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \read_index[4]_i_3__0 
       (.I0(read_index_reg__0[2]),
        .I1(read_index_reg__0[0]),
        .I2(read_index_reg__0[1]),
        .I3(read_index_reg__0[3]),
        .I4(read_index_reg__0[4]),
        .O(p_0_in__5[4]));
  FDRE \read_index_reg[0] 
       (.C(m_data_aclk),
        .CE(read_index0),
        .D(p_0_in__5[0]),
        .Q(read_index_reg__0[0]),
        .R(\read_index[4]_i_1__0_n_0 ));
  FDRE \read_index_reg[1] 
       (.C(m_data_aclk),
        .CE(read_index0),
        .D(p_0_in__5[1]),
        .Q(read_index_reg__0[1]),
        .R(\read_index[4]_i_1__0_n_0 ));
  FDRE \read_index_reg[2] 
       (.C(m_data_aclk),
        .CE(read_index0),
        .D(\read_index[2]_i_1__0_n_0 ),
        .Q(read_index_reg__0[2]),
        .R(\read_index[4]_i_1__0_n_0 ));
  FDRE \read_index_reg[3] 
       (.C(m_data_aclk),
        .CE(read_index0),
        .D(p_0_in__5[3]),
        .Q(read_index_reg__0[3]),
        .R(\read_index[4]_i_1__0_n_0 ));
  FDRE \read_index_reg[4] 
       (.C(m_data_aclk),
        .CE(read_index0),
        .D(p_0_in__5[4]),
        .Q(read_index_reg__0[4]),
        .R(\read_index[4]_i_1__0_n_0 ));
  CARRY4 read_mismatch1_carry
       (.CI(1'b0),
        .CO({read_mismatch1_carry_n_0,read_mismatch1_carry_n_1,read_mismatch1_carry_n_2,read_mismatch1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O(NLW_read_mismatch1_carry_O_UNCONNECTED[3:0]),
        .S({read_mismatch1_carry_i_1__0_n_0,read_mismatch1_carry_i_2__0_n_0,read_mismatch1_carry_i_3__0_n_0,read_mismatch1_carry_i_4__0_n_0}));
  CARRY4 read_mismatch1_carry__0
       (.CI(read_mismatch1_carry_n_0),
        .CO({read_mismatch1_carry__0_n_0,read_mismatch1_carry__0_n_1,read_mismatch1_carry__0_n_2,read_mismatch1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O(NLW_read_mismatch1_carry__0_O_UNCONNECTED[3:0]),
        .S({read_mismatch1_carry__0_i_1__0_n_0,read_mismatch1_carry__0_i_2__0_n_0,read_mismatch1_carry__0_i_3__0_n_0,read_mismatch1_carry__0_i_4__0_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry__0_i_1__0
       (.I0(m_data_rdata[21]),
        .I1(expected_rdata_reg[21]),
        .I2(expected_rdata_reg[23]),
        .I3(m_data_rdata[23]),
        .I4(expected_rdata_reg[22]),
        .I5(m_data_rdata[22]),
        .O(read_mismatch1_carry__0_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry__0_i_2__0
       (.I0(m_data_rdata[18]),
        .I1(expected_rdata_reg[18]),
        .I2(expected_rdata_reg[20]),
        .I3(m_data_rdata[20]),
        .I4(expected_rdata_reg[19]),
        .I5(m_data_rdata[19]),
        .O(read_mismatch1_carry__0_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry__0_i_3__0
       (.I0(m_data_rdata[15]),
        .I1(expected_rdata_reg[15]),
        .I2(expected_rdata_reg[17]),
        .I3(m_data_rdata[17]),
        .I4(expected_rdata_reg[16]),
        .I5(m_data_rdata[16]),
        .O(read_mismatch1_carry__0_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry__0_i_4__0
       (.I0(m_data_rdata[12]),
        .I1(expected_rdata_reg[12]),
        .I2(expected_rdata_reg[14]),
        .I3(m_data_rdata[14]),
        .I4(expected_rdata_reg[13]),
        .I5(m_data_rdata[13]),
        .O(read_mismatch1_carry__0_i_4__0_n_0));
  CARRY4 read_mismatch1_carry__1
       (.CI(read_mismatch1_carry__0_n_0),
        .CO({NLW_read_mismatch1_carry__1_CO_UNCONNECTED[3],read_mismatch1,read_mismatch1_carry__1_n_2,read_mismatch1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b1,1'b1,1'b1}),
        .O(NLW_read_mismatch1_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,read_mismatch1_carry__1_i_1__0_n_0,read_mismatch1_carry__1_i_2__0_n_0,read_mismatch1_carry__1_i_3__0_n_0}));
  LUT4 #(
    .INIT(16'h9009)) 
    read_mismatch1_carry__1_i_1__0
       (.I0(m_data_rdata[30]),
        .I1(expected_rdata_reg[30]),
        .I2(m_data_rdata[31]),
        .I3(expected_rdata_reg[31]),
        .O(read_mismatch1_carry__1_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry__1_i_2__0
       (.I0(m_data_rdata[27]),
        .I1(expected_rdata_reg[27]),
        .I2(expected_rdata_reg[29]),
        .I3(m_data_rdata[29]),
        .I4(expected_rdata_reg[28]),
        .I5(m_data_rdata[28]),
        .O(read_mismatch1_carry__1_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry__1_i_3__0
       (.I0(m_data_rdata[24]),
        .I1(expected_rdata_reg[24]),
        .I2(expected_rdata_reg[26]),
        .I3(m_data_rdata[26]),
        .I4(expected_rdata_reg[25]),
        .I5(m_data_rdata[25]),
        .O(read_mismatch1_carry__1_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry_i_1__0
       (.I0(m_data_rdata[9]),
        .I1(expected_rdata_reg[9]),
        .I2(expected_rdata_reg[11]),
        .I3(m_data_rdata[11]),
        .I4(expected_rdata_reg[10]),
        .I5(m_data_rdata[10]),
        .O(read_mismatch1_carry_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry_i_2__0
       (.I0(m_data_rdata[6]),
        .I1(expected_rdata_reg[6]),
        .I2(expected_rdata_reg[8]),
        .I3(m_data_rdata[8]),
        .I4(expected_rdata_reg[7]),
        .I5(m_data_rdata[7]),
        .O(read_mismatch1_carry_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry_i_3__0
       (.I0(m_data_rdata[3]),
        .I1(expected_rdata_reg[3]),
        .I2(expected_rdata_reg[5]),
        .I3(m_data_rdata[5]),
        .I4(expected_rdata_reg[4]),
        .I5(m_data_rdata[4]),
        .O(read_mismatch1_carry_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry_i_4__0
       (.I0(m_data_rdata[0]),
        .I1(expected_rdata_reg[0]),
        .I2(expected_rdata_reg[2]),
        .I3(m_data_rdata[2]),
        .I4(expected_rdata_reg[1]),
        .I5(m_data_rdata[1]),
        .O(read_mismatch1_carry_i_4__0_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    read_mismatch_i_1__0
       (.I0(read_mismatch1),
        .I1(m_data_rvalid),
        .I2(axi_rready_reg_0),
        .O(read_mismatch0));
  FDRE read_mismatch_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(read_mismatch0),
        .Q(read_mismatch),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    reads_done_i_1__0
       (.I0(m_data_rvalid),
        .I1(axi_rready_reg_0),
        .I2(reads_done2__0),
        .I3(p_0_in),
        .I4(reads_done),
        .O(reads_done_i_1__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    reads_done_i_2__0
       (.I0(read_index_reg__0[4]),
        .I1(read_index_reg__0[1]),
        .I2(read_index_reg__0[0]),
        .I3(read_index_reg__0[3]),
        .I4(read_index_reg__0[2]),
        .O(reads_done2__0));
  FDRE reads_done_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(reads_done_i_1__0_n_0),
        .Q(reads_done),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF0FF00000100)) 
    start_single_burst_read_i_1__0
       (.I0(burst_read_active),
        .I1(axi_arvalid_reg_0),
        .I2(mst_exec_state),
        .I3(compare_done),
        .I4(reads_done),
        .I5(start_single_burst_read_reg_n_0),
        .O(start_single_burst_read_i_1__0_n_0));
  FDRE start_single_burst_read_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(start_single_burst_read_i_1__0_n_0),
        .Q(start_single_burst_read_reg_n_0),
        .R(compare_done_i_1__0_n_0));
  LUT6 #(
    .INIT(64'hFFFFF0FF00000100)) 
    start_single_burst_write_i_1__0
       (.I0(axi_awvalid_reg_0),
        .I1(burst_write_active),
        .I2(compare_done),
        .I3(mst_exec_state),
        .I4(writes_done),
        .I5(start_single_burst_write_reg_n_0),
        .O(start_single_burst_write_i_1__0_n_0));
  FDRE start_single_burst_write_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(start_single_burst_write_i_1__0_n_0),
        .Q(start_single_burst_write_reg_n_0),
        .R(compare_done_i_1__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \write_burst_counter[0]_i_1__0 
       (.I0(\write_burst_counter_reg_n_0_[0] ),
        .O(p_0_in__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \write_burst_counter[1]_i_1__0 
       (.I0(\write_burst_counter_reg_n_0_[0] ),
        .I1(\write_burst_counter_reg_n_0_[1] ),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \write_burst_counter[2]_i_1__0 
       (.I0(\write_burst_counter_reg_n_0_[0] ),
        .I1(\write_burst_counter_reg_n_0_[1] ),
        .I2(\write_burst_counter_reg_n_0_[2] ),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \write_burst_counter[3]_i_1__0 
       (.I0(\write_burst_counter_reg_n_0_[1] ),
        .I1(\write_burst_counter_reg_n_0_[0] ),
        .I2(\write_burst_counter_reg_n_0_[2] ),
        .I3(\write_burst_counter_reg_n_0_[3] ),
        .O(p_0_in__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \write_burst_counter[4]_i_1__0 
       (.I0(\write_burst_counter_reg_n_0_[2] ),
        .I1(\write_burst_counter_reg_n_0_[0] ),
        .I2(\write_burst_counter_reg_n_0_[1] ),
        .I3(\write_burst_counter_reg_n_0_[3] ),
        .I4(\write_burst_counter_reg_n_0_[4] ),
        .O(p_0_in__1[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \write_burst_counter[5]_i_1__0 
       (.I0(\write_burst_counter_reg_n_0_[3] ),
        .I1(\write_burst_counter_reg_n_0_[1] ),
        .I2(\write_burst_counter_reg_n_0_[0] ),
        .I3(\write_burst_counter_reg_n_0_[2] ),
        .I4(\write_burst_counter_reg_n_0_[4] ),
        .I5(\write_burst_counter_reg_n_0_[5] ),
        .O(p_0_in__1[5]));
  LUT3 #(
    .INIT(8'h08)) 
    \write_burst_counter[6]_i_1__0 
       (.I0(m_data_awready),
        .I1(axi_awvalid_reg_0),
        .I2(p_0_in3_in),
        .O(write_burst_counter));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \write_burst_counter[6]_i_2__0 
       (.I0(\write_burst_counter_reg_n_0_[4] ),
        .I1(\write_burst_counter_reg_n_0_[2] ),
        .I2(\write_burst_counter_reg_n_0_[0] ),
        .I3(\write_burst_counter_reg_n_0_[1] ),
        .I4(\write_burst_counter_reg_n_0_[3] ),
        .I5(\write_burst_counter_reg_n_0_[5] ),
        .O(p_0_in__1[6]));
  FDRE \write_burst_counter_reg[0] 
       (.C(m_data_aclk),
        .CE(write_burst_counter),
        .D(p_0_in__1[0]),
        .Q(\write_burst_counter_reg_n_0_[0] ),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \write_burst_counter_reg[1] 
       (.C(m_data_aclk),
        .CE(write_burst_counter),
        .D(p_0_in__1[1]),
        .Q(\write_burst_counter_reg_n_0_[1] ),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \write_burst_counter_reg[2] 
       (.C(m_data_aclk),
        .CE(write_burst_counter),
        .D(p_0_in__1[2]),
        .Q(\write_burst_counter_reg_n_0_[2] ),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \write_burst_counter_reg[3] 
       (.C(m_data_aclk),
        .CE(write_burst_counter),
        .D(p_0_in__1[3]),
        .Q(\write_burst_counter_reg_n_0_[3] ),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \write_burst_counter_reg[4] 
       (.C(m_data_aclk),
        .CE(write_burst_counter),
        .D(p_0_in__1[4]),
        .Q(\write_burst_counter_reg_n_0_[4] ),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \write_burst_counter_reg[5] 
       (.C(m_data_aclk),
        .CE(write_burst_counter),
        .D(p_0_in__1[5]),
        .Q(\write_burst_counter_reg_n_0_[5] ),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  FDRE \write_burst_counter_reg[6] 
       (.C(m_data_aclk),
        .CE(write_burst_counter),
        .D(p_0_in__1[6]),
        .Q(p_0_in3_in),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \write_index[0]_i_1__0 
       (.I0(write_index_reg__0[0]),
        .O(p_0_in__6[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \write_index[1]_i_1__0 
       (.I0(write_index_reg__0[0]),
        .I1(write_index_reg__0[1]),
        .O(p_0_in__6[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \write_index[2]_i_1__0 
       (.I0(write_index_reg__0[0]),
        .I1(write_index_reg__0[1]),
        .I2(write_index_reg__0[2]),
        .O(p_0_in__6[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \write_index[3]_i_1__0 
       (.I0(write_index_reg__0[1]),
        .I1(write_index_reg__0[0]),
        .I2(write_index_reg__0[2]),
        .I3(write_index_reg__0[3]),
        .O(p_0_in__6[3]));
  LUT4 #(
    .INIT(16'hFF4F)) 
    \write_index[4]_i_1__0 
       (.I0(init_txn_ff2),
        .I1(init_txn_ff),
        .I2(m_data_aresetn),
        .I3(start_single_burst_write_reg_n_0),
        .O(\write_index[4]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7FFF00000000)) 
    \write_index[4]_i_2__0 
       (.I0(write_index_reg__0[0]),
        .I1(write_index_reg__0[3]),
        .I2(write_index_reg__0[1]),
        .I3(write_index_reg__0[2]),
        .I4(write_index_reg__0[4]),
        .I5(p_13_in),
        .O(write_index0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \write_index[4]_i_3__0 
       (.I0(write_index_reg__0[2]),
        .I1(write_index_reg__0[0]),
        .I2(write_index_reg__0[1]),
        .I3(write_index_reg__0[3]),
        .I4(write_index_reg__0[4]),
        .O(p_0_in__6[4]));
  FDRE \write_index_reg[0] 
       (.C(m_data_aclk),
        .CE(write_index0),
        .D(p_0_in__6[0]),
        .Q(write_index_reg__0[0]),
        .R(\write_index[4]_i_1__0_n_0 ));
  FDRE \write_index_reg[1] 
       (.C(m_data_aclk),
        .CE(write_index0),
        .D(p_0_in__6[1]),
        .Q(write_index_reg__0[1]),
        .R(\write_index[4]_i_1__0_n_0 ));
  FDRE \write_index_reg[2] 
       (.C(m_data_aclk),
        .CE(write_index0),
        .D(p_0_in__6[2]),
        .Q(write_index_reg__0[2]),
        .R(\write_index[4]_i_1__0_n_0 ));
  FDRE \write_index_reg[3] 
       (.C(m_data_aclk),
        .CE(write_index0),
        .D(p_0_in__6[3]),
        .Q(write_index_reg__0[3]),
        .R(\write_index[4]_i_1__0_n_0 ));
  FDRE \write_index_reg[4] 
       (.C(m_data_aclk),
        .CE(write_index0),
        .D(p_0_in__6[4]),
        .Q(write_index_reg__0[4]),
        .R(\write_index[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFF80)) 
    writes_done_i_1__0
       (.I0(p_0_in3_in),
        .I1(axi_bready_reg_0),
        .I2(m_data_bvalid),
        .I3(writes_done),
        .O(writes_done_i_1__0_n_0));
  FDRE writes_done_reg
       (.C(m_data_aclk),
        .CE(1'b1),
        .D(writes_done_i_1__0_n_0),
        .Q(writes_done),
        .R(\axi_awaddr[28]_i_1__0_n_0 ));
endmodule

module mc_top_core_wrapper_0_0_core_wrapper_v1_0_m_instr
   (axi_bready_reg_0,
    axi_awvalid_reg_0,
    axi_rready_reg_0,
    axi_arvalid_reg_0,
    m_instr_txn_done,
    m_instr_error,
    m_instr_wlast,
    axi_wvalid_reg_0,
    m_instr_awaddr,
    m_instr_wdata,
    m_instr_araddr,
    m_instr_init_axi_txn,
    m_instr_aclk,
    m_instr_aresetn,
    m_instr_rvalid,
    m_instr_rlast,
    m_instr_awready,
    m_instr_bvalid,
    m_instr_arready,
    m_instr_wready,
    m_instr_rresp,
    m_instr_bresp,
    m_instr_rdata);
  output axi_bready_reg_0;
  output axi_awvalid_reg_0;
  output axi_rready_reg_0;
  output axi_arvalid_reg_0;
  output m_instr_txn_done;
  output m_instr_error;
  output m_instr_wlast;
  output axi_wvalid_reg_0;
  output [25:0]m_instr_awaddr;
  output [31:0]m_instr_wdata;
  output [25:0]m_instr_araddr;
  input m_instr_init_axi_txn;
  input m_instr_aclk;
  input m_instr_aresetn;
  input m_instr_rvalid;
  input m_instr_rlast;
  input m_instr_awready;
  input m_instr_bvalid;
  input m_instr_arready;
  input m_instr_wready;
  input [0:0]m_instr_rresp;
  input [0:0]m_instr_bresp;
  input [31:0]m_instr_rdata;

  wire ERROR_i_1_n_0;
  wire \FSM_sequential_mst_exec_state[0]_i_1_n_0 ;
  wire \FSM_sequential_mst_exec_state[1]_i_1_n_0 ;
  wire M_AXI_ARADDR_carry_i_1_n_0;
  wire M_AXI_ARADDR_carry_n_2;
  wire M_AXI_ARADDR_carry_n_3;
  wire M_AXI_AWADDR_carry_i_1_n_0;
  wire M_AXI_AWADDR_carry_n_2;
  wire M_AXI_AWADDR_carry_n_3;
  wire \axi_araddr[9]_i_2_n_0 ;
  wire [31:29]axi_araddr_reg;
  wire \axi_araddr_reg[13]_i_1_n_0 ;
  wire \axi_araddr_reg[13]_i_1_n_1 ;
  wire \axi_araddr_reg[13]_i_1_n_2 ;
  wire \axi_araddr_reg[13]_i_1_n_3 ;
  wire \axi_araddr_reg[13]_i_1_n_4 ;
  wire \axi_araddr_reg[13]_i_1_n_5 ;
  wire \axi_araddr_reg[13]_i_1_n_6 ;
  wire \axi_araddr_reg[13]_i_1_n_7 ;
  wire \axi_araddr_reg[17]_i_1_n_0 ;
  wire \axi_araddr_reg[17]_i_1_n_1 ;
  wire \axi_araddr_reg[17]_i_1_n_2 ;
  wire \axi_araddr_reg[17]_i_1_n_3 ;
  wire \axi_araddr_reg[17]_i_1_n_4 ;
  wire \axi_araddr_reg[17]_i_1_n_5 ;
  wire \axi_araddr_reg[17]_i_1_n_6 ;
  wire \axi_araddr_reg[17]_i_1_n_7 ;
  wire \axi_araddr_reg[21]_i_1_n_0 ;
  wire \axi_araddr_reg[21]_i_1_n_1 ;
  wire \axi_araddr_reg[21]_i_1_n_2 ;
  wire \axi_araddr_reg[21]_i_1_n_3 ;
  wire \axi_araddr_reg[21]_i_1_n_4 ;
  wire \axi_araddr_reg[21]_i_1_n_5 ;
  wire \axi_araddr_reg[21]_i_1_n_6 ;
  wire \axi_araddr_reg[21]_i_1_n_7 ;
  wire \axi_araddr_reg[25]_i_1_n_0 ;
  wire \axi_araddr_reg[25]_i_1_n_1 ;
  wire \axi_araddr_reg[25]_i_1_n_2 ;
  wire \axi_araddr_reg[25]_i_1_n_3 ;
  wire \axi_araddr_reg[25]_i_1_n_4 ;
  wire \axi_araddr_reg[25]_i_1_n_5 ;
  wire \axi_araddr_reg[25]_i_1_n_6 ;
  wire \axi_araddr_reg[25]_i_1_n_7 ;
  wire \axi_araddr_reg[28]_i_2_n_0 ;
  wire \axi_araddr_reg[28]_i_2_n_1 ;
  wire \axi_araddr_reg[28]_i_2_n_2 ;
  wire \axi_araddr_reg[28]_i_2_n_3 ;
  wire \axi_araddr_reg[28]_i_2_n_4 ;
  wire \axi_araddr_reg[28]_i_2_n_5 ;
  wire \axi_araddr_reg[28]_i_2_n_6 ;
  wire \axi_araddr_reg[28]_i_2_n_7 ;
  wire \axi_araddr_reg[30]_i_1_n_3 ;
  wire \axi_araddr_reg[30]_i_1_n_6 ;
  wire \axi_araddr_reg[30]_i_1_n_7 ;
  wire \axi_araddr_reg[9]_i_1_n_0 ;
  wire \axi_araddr_reg[9]_i_1_n_1 ;
  wire \axi_araddr_reg[9]_i_1_n_2 ;
  wire \axi_araddr_reg[9]_i_1_n_3 ;
  wire \axi_araddr_reg[9]_i_1_n_4 ;
  wire \axi_araddr_reg[9]_i_1_n_5 ;
  wire \axi_araddr_reg[9]_i_1_n_6 ;
  wire \axi_araddr_reg[9]_i_1_n_7 ;
  wire axi_arvalid0;
  wire axi_arvalid_i_1_n_0;
  wire axi_arvalid_reg_0;
  wire \axi_awaddr[28]_i_1_n_0 ;
  wire \axi_awaddr[9]_i_2_n_0 ;
  wire [31:29]axi_awaddr_reg;
  wire \axi_awaddr_reg[13]_i_1_n_0 ;
  wire \axi_awaddr_reg[13]_i_1_n_1 ;
  wire \axi_awaddr_reg[13]_i_1_n_2 ;
  wire \axi_awaddr_reg[13]_i_1_n_3 ;
  wire \axi_awaddr_reg[13]_i_1_n_4 ;
  wire \axi_awaddr_reg[13]_i_1_n_5 ;
  wire \axi_awaddr_reg[13]_i_1_n_6 ;
  wire \axi_awaddr_reg[13]_i_1_n_7 ;
  wire \axi_awaddr_reg[17]_i_1_n_0 ;
  wire \axi_awaddr_reg[17]_i_1_n_1 ;
  wire \axi_awaddr_reg[17]_i_1_n_2 ;
  wire \axi_awaddr_reg[17]_i_1_n_3 ;
  wire \axi_awaddr_reg[17]_i_1_n_4 ;
  wire \axi_awaddr_reg[17]_i_1_n_5 ;
  wire \axi_awaddr_reg[17]_i_1_n_6 ;
  wire \axi_awaddr_reg[17]_i_1_n_7 ;
  wire \axi_awaddr_reg[21]_i_1_n_0 ;
  wire \axi_awaddr_reg[21]_i_1_n_1 ;
  wire \axi_awaddr_reg[21]_i_1_n_2 ;
  wire \axi_awaddr_reg[21]_i_1_n_3 ;
  wire \axi_awaddr_reg[21]_i_1_n_4 ;
  wire \axi_awaddr_reg[21]_i_1_n_5 ;
  wire \axi_awaddr_reg[21]_i_1_n_6 ;
  wire \axi_awaddr_reg[21]_i_1_n_7 ;
  wire \axi_awaddr_reg[25]_i_1_n_0 ;
  wire \axi_awaddr_reg[25]_i_1_n_1 ;
  wire \axi_awaddr_reg[25]_i_1_n_2 ;
  wire \axi_awaddr_reg[25]_i_1_n_3 ;
  wire \axi_awaddr_reg[25]_i_1_n_4 ;
  wire \axi_awaddr_reg[25]_i_1_n_5 ;
  wire \axi_awaddr_reg[25]_i_1_n_6 ;
  wire \axi_awaddr_reg[25]_i_1_n_7 ;
  wire \axi_awaddr_reg[28]_i_3_n_0 ;
  wire \axi_awaddr_reg[28]_i_3_n_1 ;
  wire \axi_awaddr_reg[28]_i_3_n_2 ;
  wire \axi_awaddr_reg[28]_i_3_n_3 ;
  wire \axi_awaddr_reg[28]_i_3_n_4 ;
  wire \axi_awaddr_reg[28]_i_3_n_5 ;
  wire \axi_awaddr_reg[28]_i_3_n_6 ;
  wire \axi_awaddr_reg[28]_i_3_n_7 ;
  wire \axi_awaddr_reg[30]_i_1_n_3 ;
  wire \axi_awaddr_reg[30]_i_1_n_6 ;
  wire \axi_awaddr_reg[30]_i_1_n_7 ;
  wire \axi_awaddr_reg[9]_i_1_n_0 ;
  wire \axi_awaddr_reg[9]_i_1_n_1 ;
  wire \axi_awaddr_reg[9]_i_1_n_2 ;
  wire \axi_awaddr_reg[9]_i_1_n_3 ;
  wire \axi_awaddr_reg[9]_i_1_n_4 ;
  wire \axi_awaddr_reg[9]_i_1_n_5 ;
  wire \axi_awaddr_reg[9]_i_1_n_6 ;
  wire \axi_awaddr_reg[9]_i_1_n_7 ;
  wire axi_awvalid0;
  wire axi_awvalid_i_1_n_0;
  wire axi_awvalid_reg_0;
  wire axi_bready0;
  wire axi_bready_reg_0;
  wire axi_rready_i_1_n_0;
  wire axi_rready_reg_0;
  wire \axi_wdata[3]_i_2_n_0 ;
  wire \axi_wdata_reg[11]_i_1_n_0 ;
  wire \axi_wdata_reg[11]_i_1_n_1 ;
  wire \axi_wdata_reg[11]_i_1_n_2 ;
  wire \axi_wdata_reg[11]_i_1_n_3 ;
  wire \axi_wdata_reg[11]_i_1_n_4 ;
  wire \axi_wdata_reg[11]_i_1_n_5 ;
  wire \axi_wdata_reg[11]_i_1_n_6 ;
  wire \axi_wdata_reg[11]_i_1_n_7 ;
  wire \axi_wdata_reg[15]_i_1_n_0 ;
  wire \axi_wdata_reg[15]_i_1_n_1 ;
  wire \axi_wdata_reg[15]_i_1_n_2 ;
  wire \axi_wdata_reg[15]_i_1_n_3 ;
  wire \axi_wdata_reg[15]_i_1_n_4 ;
  wire \axi_wdata_reg[15]_i_1_n_5 ;
  wire \axi_wdata_reg[15]_i_1_n_6 ;
  wire \axi_wdata_reg[15]_i_1_n_7 ;
  wire \axi_wdata_reg[19]_i_1_n_0 ;
  wire \axi_wdata_reg[19]_i_1_n_1 ;
  wire \axi_wdata_reg[19]_i_1_n_2 ;
  wire \axi_wdata_reg[19]_i_1_n_3 ;
  wire \axi_wdata_reg[19]_i_1_n_4 ;
  wire \axi_wdata_reg[19]_i_1_n_5 ;
  wire \axi_wdata_reg[19]_i_1_n_6 ;
  wire \axi_wdata_reg[19]_i_1_n_7 ;
  wire \axi_wdata_reg[23]_i_1_n_0 ;
  wire \axi_wdata_reg[23]_i_1_n_1 ;
  wire \axi_wdata_reg[23]_i_1_n_2 ;
  wire \axi_wdata_reg[23]_i_1_n_3 ;
  wire \axi_wdata_reg[23]_i_1_n_4 ;
  wire \axi_wdata_reg[23]_i_1_n_5 ;
  wire \axi_wdata_reg[23]_i_1_n_6 ;
  wire \axi_wdata_reg[23]_i_1_n_7 ;
  wire \axi_wdata_reg[27]_i_1_n_0 ;
  wire \axi_wdata_reg[27]_i_1_n_1 ;
  wire \axi_wdata_reg[27]_i_1_n_2 ;
  wire \axi_wdata_reg[27]_i_1_n_3 ;
  wire \axi_wdata_reg[27]_i_1_n_4 ;
  wire \axi_wdata_reg[27]_i_1_n_5 ;
  wire \axi_wdata_reg[27]_i_1_n_6 ;
  wire \axi_wdata_reg[27]_i_1_n_7 ;
  wire \axi_wdata_reg[31]_i_2_n_1 ;
  wire \axi_wdata_reg[31]_i_2_n_2 ;
  wire \axi_wdata_reg[31]_i_2_n_3 ;
  wire \axi_wdata_reg[31]_i_2_n_4 ;
  wire \axi_wdata_reg[31]_i_2_n_5 ;
  wire \axi_wdata_reg[31]_i_2_n_6 ;
  wire \axi_wdata_reg[31]_i_2_n_7 ;
  wire \axi_wdata_reg[3]_i_1_n_0 ;
  wire \axi_wdata_reg[3]_i_1_n_1 ;
  wire \axi_wdata_reg[3]_i_1_n_2 ;
  wire \axi_wdata_reg[3]_i_1_n_3 ;
  wire \axi_wdata_reg[3]_i_1_n_4 ;
  wire \axi_wdata_reg[3]_i_1_n_5 ;
  wire \axi_wdata_reg[3]_i_1_n_6 ;
  wire \axi_wdata_reg[3]_i_1_n_7 ;
  wire \axi_wdata_reg[7]_i_1_n_0 ;
  wire \axi_wdata_reg[7]_i_1_n_1 ;
  wire \axi_wdata_reg[7]_i_1_n_2 ;
  wire \axi_wdata_reg[7]_i_1_n_3 ;
  wire \axi_wdata_reg[7]_i_1_n_4 ;
  wire \axi_wdata_reg[7]_i_1_n_5 ;
  wire \axi_wdata_reg[7]_i_1_n_6 ;
  wire \axi_wdata_reg[7]_i_1_n_7 ;
  wire axi_wlast0;
  wire axi_wlast_i_1_n_0;
  wire axi_wvalid_i_1_n_0;
  wire axi_wvalid_reg_0;
  wire burst_read_active;
  wire burst_read_active_i_1_n_0;
  wire burst_write_active;
  wire burst_write_active_i_1_n_0;
  wire compare_done;
  wire compare_done_i_1_n_0;
  wire compare_done_i_2_n_0;
  wire error_reg;
  wire error_reg_i_1_n_0;
  wire \expected_rdata[0]_i_3_n_0 ;
  wire [31:0]expected_rdata_reg;
  wire \expected_rdata_reg[0]_i_2_n_0 ;
  wire \expected_rdata_reg[0]_i_2_n_1 ;
  wire \expected_rdata_reg[0]_i_2_n_2 ;
  wire \expected_rdata_reg[0]_i_2_n_3 ;
  wire \expected_rdata_reg[0]_i_2_n_4 ;
  wire \expected_rdata_reg[0]_i_2_n_5 ;
  wire \expected_rdata_reg[0]_i_2_n_6 ;
  wire \expected_rdata_reg[0]_i_2_n_7 ;
  wire \expected_rdata_reg[12]_i_1_n_0 ;
  wire \expected_rdata_reg[12]_i_1_n_1 ;
  wire \expected_rdata_reg[12]_i_1_n_2 ;
  wire \expected_rdata_reg[12]_i_1_n_3 ;
  wire \expected_rdata_reg[12]_i_1_n_4 ;
  wire \expected_rdata_reg[12]_i_1_n_5 ;
  wire \expected_rdata_reg[12]_i_1_n_6 ;
  wire \expected_rdata_reg[12]_i_1_n_7 ;
  wire \expected_rdata_reg[16]_i_1_n_0 ;
  wire \expected_rdata_reg[16]_i_1_n_1 ;
  wire \expected_rdata_reg[16]_i_1_n_2 ;
  wire \expected_rdata_reg[16]_i_1_n_3 ;
  wire \expected_rdata_reg[16]_i_1_n_4 ;
  wire \expected_rdata_reg[16]_i_1_n_5 ;
  wire \expected_rdata_reg[16]_i_1_n_6 ;
  wire \expected_rdata_reg[16]_i_1_n_7 ;
  wire \expected_rdata_reg[20]_i_1_n_0 ;
  wire \expected_rdata_reg[20]_i_1_n_1 ;
  wire \expected_rdata_reg[20]_i_1_n_2 ;
  wire \expected_rdata_reg[20]_i_1_n_3 ;
  wire \expected_rdata_reg[20]_i_1_n_4 ;
  wire \expected_rdata_reg[20]_i_1_n_5 ;
  wire \expected_rdata_reg[20]_i_1_n_6 ;
  wire \expected_rdata_reg[20]_i_1_n_7 ;
  wire \expected_rdata_reg[24]_i_1_n_0 ;
  wire \expected_rdata_reg[24]_i_1_n_1 ;
  wire \expected_rdata_reg[24]_i_1_n_2 ;
  wire \expected_rdata_reg[24]_i_1_n_3 ;
  wire \expected_rdata_reg[24]_i_1_n_4 ;
  wire \expected_rdata_reg[24]_i_1_n_5 ;
  wire \expected_rdata_reg[24]_i_1_n_6 ;
  wire \expected_rdata_reg[24]_i_1_n_7 ;
  wire \expected_rdata_reg[28]_i_1_n_1 ;
  wire \expected_rdata_reg[28]_i_1_n_2 ;
  wire \expected_rdata_reg[28]_i_1_n_3 ;
  wire \expected_rdata_reg[28]_i_1_n_4 ;
  wire \expected_rdata_reg[28]_i_1_n_5 ;
  wire \expected_rdata_reg[28]_i_1_n_6 ;
  wire \expected_rdata_reg[28]_i_1_n_7 ;
  wire \expected_rdata_reg[4]_i_1_n_0 ;
  wire \expected_rdata_reg[4]_i_1_n_1 ;
  wire \expected_rdata_reg[4]_i_1_n_2 ;
  wire \expected_rdata_reg[4]_i_1_n_3 ;
  wire \expected_rdata_reg[4]_i_1_n_4 ;
  wire \expected_rdata_reg[4]_i_1_n_5 ;
  wire \expected_rdata_reg[4]_i_1_n_6 ;
  wire \expected_rdata_reg[4]_i_1_n_7 ;
  wire \expected_rdata_reg[8]_i_1_n_0 ;
  wire \expected_rdata_reg[8]_i_1_n_1 ;
  wire \expected_rdata_reg[8]_i_1_n_2 ;
  wire \expected_rdata_reg[8]_i_1_n_3 ;
  wire \expected_rdata_reg[8]_i_1_n_4 ;
  wire \expected_rdata_reg[8]_i_1_n_5 ;
  wire \expected_rdata_reg[8]_i_1_n_6 ;
  wire \expected_rdata_reg[8]_i_1_n_7 ;
  wire init_txn_ff;
  wire init_txn_ff2;
  wire m_instr_aclk;
  wire [25:0]m_instr_araddr;
  wire m_instr_aresetn;
  wire m_instr_arready;
  wire [25:0]m_instr_awaddr;
  wire m_instr_awready;
  wire [0:0]m_instr_bresp;
  wire m_instr_bvalid;
  wire m_instr_error;
  wire m_instr_init_axi_txn;
  wire [31:0]m_instr_rdata;
  wire m_instr_rlast;
  wire [0:0]m_instr_rresp;
  wire m_instr_rvalid;
  wire m_instr_txn_done;
  wire [31:0]m_instr_wdata;
  wire m_instr_wlast;
  wire m_instr_wready;
  wire [0:0]mst_exec_state;
  wire [6:0]p_0_in;
  wire p_0_in3_in;
  wire p_0_in_0;
  wire [6:0]p_0_in__0;
  wire [4:0]p_0_in__3;
  wire [4:0]p_0_in__4;
  wire p_13_in;
  wire p_7_in;
  wire p_9_in;
  wire read_burst_counter;
  wire \read_burst_counter_reg_n_0_[0] ;
  wire \read_burst_counter_reg_n_0_[1] ;
  wire \read_burst_counter_reg_n_0_[2] ;
  wire \read_burst_counter_reg_n_0_[3] ;
  wire \read_burst_counter_reg_n_0_[4] ;
  wire \read_burst_counter_reg_n_0_[5] ;
  wire read_index0;
  wire \read_index[2]_i_1_n_0 ;
  wire \read_index[4]_i_1_n_0 ;
  wire [4:0]read_index_reg__0;
  wire read_mismatch;
  wire read_mismatch0;
  wire read_mismatch1;
  wire read_mismatch1_carry__0_i_1_n_0;
  wire read_mismatch1_carry__0_i_2_n_0;
  wire read_mismatch1_carry__0_i_3_n_0;
  wire read_mismatch1_carry__0_i_4_n_0;
  wire read_mismatch1_carry__0_n_0;
  wire read_mismatch1_carry__0_n_1;
  wire read_mismatch1_carry__0_n_2;
  wire read_mismatch1_carry__0_n_3;
  wire read_mismatch1_carry__1_i_1_n_0;
  wire read_mismatch1_carry__1_i_2_n_0;
  wire read_mismatch1_carry__1_i_3_n_0;
  wire read_mismatch1_carry__1_n_2;
  wire read_mismatch1_carry__1_n_3;
  wire read_mismatch1_carry_i_1_n_0;
  wire read_mismatch1_carry_i_2_n_0;
  wire read_mismatch1_carry_i_3_n_0;
  wire read_mismatch1_carry_i_4_n_0;
  wire read_mismatch1_carry_n_0;
  wire read_mismatch1_carry_n_1;
  wire read_mismatch1_carry_n_2;
  wire read_mismatch1_carry_n_3;
  wire reads_done;
  wire reads_done2;
  wire reads_done_i_1_n_0;
  wire start_single_burst_read_i_1_n_0;
  wire start_single_burst_read_reg_n_0;
  wire start_single_burst_write_i_1_n_0;
  wire start_single_burst_write_reg_n_0;
  wire write_burst_counter;
  wire \write_burst_counter_reg_n_0_[0] ;
  wire \write_burst_counter_reg_n_0_[1] ;
  wire \write_burst_counter_reg_n_0_[2] ;
  wire \write_burst_counter_reg_n_0_[3] ;
  wire \write_burst_counter_reg_n_0_[4] ;
  wire \write_burst_counter_reg_n_0_[5] ;
  wire write_index0;
  wire \write_index[4]_i_1_n_0 ;
  wire [4:0]write_index_reg__0;
  wire writes_done;
  wire writes_done_i_1_n_0;
  wire [3:2]NLW_M_AXI_ARADDR_carry_CO_UNCONNECTED;
  wire [3:3]NLW_M_AXI_ARADDR_carry_O_UNCONNECTED;
  wire [3:2]NLW_M_AXI_AWADDR_carry_CO_UNCONNECTED;
  wire [3:3]NLW_M_AXI_AWADDR_carry_O_UNCONNECTED;
  wire [3:1]\NLW_axi_araddr_reg[30]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_axi_araddr_reg[30]_i_1_O_UNCONNECTED ;
  wire [3:1]\NLW_axi_awaddr_reg[30]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_axi_awaddr_reg[30]_i_1_O_UNCONNECTED ;
  wire [3:3]\NLW_axi_wdata_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_expected_rdata_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_read_mismatch1_carry_O_UNCONNECTED;
  wire [3:0]NLW_read_mismatch1_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_read_mismatch1_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_read_mismatch1_carry__1_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'hBBBBFCFF88880000)) 
    ERROR_i_1
       (.I0(error_reg),
        .I1(mst_exec_state),
        .I2(init_txn_ff2),
        .I3(init_txn_ff),
        .I4(compare_done),
        .I5(m_instr_error),
        .O(ERROR_i_1_n_0));
  FDRE ERROR_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(ERROR_i_1_n_0),
        .Q(m_instr_error),
        .R(compare_done_i_1_n_0));
  LUT6 #(
    .INIT(64'h3044304430773044)) 
    \FSM_sequential_mst_exec_state[0]_i_1 
       (.I0(writes_done),
        .I1(mst_exec_state),
        .I2(reads_done),
        .I3(compare_done),
        .I4(init_txn_ff),
        .I5(init_txn_ff2),
        .O(\FSM_sequential_mst_exec_state[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h38)) 
    \FSM_sequential_mst_exec_state[1]_i_1 
       (.I0(writes_done),
        .I1(mst_exec_state),
        .I2(compare_done),
        .O(\FSM_sequential_mst_exec_state[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:00,INIT_WRITE:01,INIT_READ:10,INIT_COMPARE:11" *) 
  FDRE \FSM_sequential_mst_exec_state_reg[0] 
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_mst_exec_state[0]_i_1_n_0 ),
        .Q(mst_exec_state),
        .R(compare_done_i_1_n_0));
  (* FSM_ENCODED_STATES = "IDLE:00,INIT_WRITE:01,INIT_READ:10,INIT_COMPARE:11" *) 
  FDRE \FSM_sequential_mst_exec_state_reg[1] 
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_mst_exec_state[1]_i_1_n_0 ),
        .Q(compare_done),
        .R(compare_done_i_1_n_0));
  CARRY4 M_AXI_ARADDR_carry
       (.CI(1'b0),
        .CO({NLW_M_AXI_ARADDR_carry_CO_UNCONNECTED[3:2],M_AXI_ARADDR_carry_n_2,M_AXI_ARADDR_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,axi_araddr_reg[30],1'b0}),
        .O({NLW_M_AXI_ARADDR_carry_O_UNCONNECTED[3],m_instr_araddr[25:23]}),
        .S({1'b0,axi_araddr_reg[31],M_AXI_ARADDR_carry_i_1_n_0,axi_araddr_reg[29]}));
  LUT1 #(
    .INIT(2'h1)) 
    M_AXI_ARADDR_carry_i_1
       (.I0(axi_araddr_reg[30]),
        .O(M_AXI_ARADDR_carry_i_1_n_0));
  CARRY4 M_AXI_AWADDR_carry
       (.CI(1'b0),
        .CO({NLW_M_AXI_AWADDR_carry_CO_UNCONNECTED[3:2],M_AXI_AWADDR_carry_n_2,M_AXI_AWADDR_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,axi_awaddr_reg[30],1'b0}),
        .O({NLW_M_AXI_AWADDR_carry_O_UNCONNECTED[3],m_instr_awaddr[25:23]}),
        .S({1'b0,axi_awaddr_reg[31],M_AXI_AWADDR_carry_i_1_n_0,axi_awaddr_reg[29]}));
  LUT1 #(
    .INIT(2'h1)) 
    M_AXI_AWADDR_carry_i_1
       (.I0(axi_awaddr_reg[30]),
        .O(M_AXI_AWADDR_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    \axi_araddr[28]_i_1 
       (.I0(axi_arvalid_reg_0),
        .I1(m_instr_arready),
        .O(axi_arvalid0));
  LUT1 #(
    .INIT(2'h1)) 
    \axi_araddr[9]_i_2 
       (.I0(m_instr_araddr[0]),
        .O(\axi_araddr[9]_i_2_n_0 ));
  FDRE \axi_araddr_reg[10] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[13]_i_1_n_7 ),
        .Q(m_instr_araddr[4]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[11] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[13]_i_1_n_6 ),
        .Q(m_instr_araddr[5]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[12] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[13]_i_1_n_5 ),
        .Q(m_instr_araddr[6]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[13] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[13]_i_1_n_4 ),
        .Q(m_instr_araddr[7]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[13]_i_1 
       (.CI(\axi_araddr_reg[9]_i_1_n_0 ),
        .CO({\axi_araddr_reg[13]_i_1_n_0 ,\axi_araddr_reg[13]_i_1_n_1 ,\axi_araddr_reg[13]_i_1_n_2 ,\axi_araddr_reg[13]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[13]_i_1_n_4 ,\axi_araddr_reg[13]_i_1_n_5 ,\axi_araddr_reg[13]_i_1_n_6 ,\axi_araddr_reg[13]_i_1_n_7 }),
        .S(m_instr_araddr[7:4]));
  FDRE \axi_araddr_reg[14] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[17]_i_1_n_7 ),
        .Q(m_instr_araddr[8]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[15] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[17]_i_1_n_6 ),
        .Q(m_instr_araddr[9]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[16] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[17]_i_1_n_5 ),
        .Q(m_instr_araddr[10]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[17] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[17]_i_1_n_4 ),
        .Q(m_instr_araddr[11]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[17]_i_1 
       (.CI(\axi_araddr_reg[13]_i_1_n_0 ),
        .CO({\axi_araddr_reg[17]_i_1_n_0 ,\axi_araddr_reg[17]_i_1_n_1 ,\axi_araddr_reg[17]_i_1_n_2 ,\axi_araddr_reg[17]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[17]_i_1_n_4 ,\axi_araddr_reg[17]_i_1_n_5 ,\axi_araddr_reg[17]_i_1_n_6 ,\axi_araddr_reg[17]_i_1_n_7 }),
        .S(m_instr_araddr[11:8]));
  FDRE \axi_araddr_reg[18] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[21]_i_1_n_7 ),
        .Q(m_instr_araddr[12]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[19] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[21]_i_1_n_6 ),
        .Q(m_instr_araddr[13]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[20] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[21]_i_1_n_5 ),
        .Q(m_instr_araddr[14]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[21] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[21]_i_1_n_4 ),
        .Q(m_instr_araddr[15]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[21]_i_1 
       (.CI(\axi_araddr_reg[17]_i_1_n_0 ),
        .CO({\axi_araddr_reg[21]_i_1_n_0 ,\axi_araddr_reg[21]_i_1_n_1 ,\axi_araddr_reg[21]_i_1_n_2 ,\axi_araddr_reg[21]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[21]_i_1_n_4 ,\axi_araddr_reg[21]_i_1_n_5 ,\axi_araddr_reg[21]_i_1_n_6 ,\axi_araddr_reg[21]_i_1_n_7 }),
        .S(m_instr_araddr[15:12]));
  FDRE \axi_araddr_reg[22] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[25]_i_1_n_7 ),
        .Q(m_instr_araddr[16]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[23] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[25]_i_1_n_6 ),
        .Q(m_instr_araddr[17]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[24] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[25]_i_1_n_5 ),
        .Q(m_instr_araddr[18]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[25] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[25]_i_1_n_4 ),
        .Q(m_instr_araddr[19]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[25]_i_1 
       (.CI(\axi_araddr_reg[21]_i_1_n_0 ),
        .CO({\axi_araddr_reg[25]_i_1_n_0 ,\axi_araddr_reg[25]_i_1_n_1 ,\axi_araddr_reg[25]_i_1_n_2 ,\axi_araddr_reg[25]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[25]_i_1_n_4 ,\axi_araddr_reg[25]_i_1_n_5 ,\axi_araddr_reg[25]_i_1_n_6 ,\axi_araddr_reg[25]_i_1_n_7 }),
        .S(m_instr_araddr[19:16]));
  FDRE \axi_araddr_reg[26] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[28]_i_2_n_7 ),
        .Q(m_instr_araddr[20]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[27] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[28]_i_2_n_6 ),
        .Q(m_instr_araddr[21]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[28] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[28]_i_2_n_5 ),
        .Q(m_instr_araddr[22]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[28]_i_2 
       (.CI(\axi_araddr_reg[25]_i_1_n_0 ),
        .CO({\axi_araddr_reg[28]_i_2_n_0 ,\axi_araddr_reg[28]_i_2_n_1 ,\axi_araddr_reg[28]_i_2_n_2 ,\axi_araddr_reg[28]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_araddr_reg[28]_i_2_n_4 ,\axi_araddr_reg[28]_i_2_n_5 ,\axi_araddr_reg[28]_i_2_n_6 ,\axi_araddr_reg[28]_i_2_n_7 }),
        .S({axi_araddr_reg[29],m_instr_araddr[22:20]}));
  FDRE \axi_araddr_reg[29] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[28]_i_2_n_4 ),
        .Q(axi_araddr_reg[29]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[30] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[30]_i_1_n_7 ),
        .Q(axi_araddr_reg[30]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[30]_i_1 
       (.CI(\axi_araddr_reg[28]_i_2_n_0 ),
        .CO({\NLW_axi_araddr_reg[30]_i_1_CO_UNCONNECTED [3:1],\axi_araddr_reg[30]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_axi_araddr_reg[30]_i_1_O_UNCONNECTED [3:2],\axi_araddr_reg[30]_i_1_n_6 ,\axi_araddr_reg[30]_i_1_n_7 }),
        .S({1'b0,1'b0,axi_araddr_reg[31:30]}));
  FDRE \axi_araddr_reg[31] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[30]_i_1_n_6 ),
        .Q(axi_araddr_reg[31]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[6] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[9]_i_1_n_7 ),
        .Q(m_instr_araddr[0]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[7] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[9]_i_1_n_6 ),
        .Q(m_instr_araddr[1]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[8] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[9]_i_1_n_5 ),
        .Q(m_instr_araddr[2]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_araddr_reg[9] 
       (.C(m_instr_aclk),
        .CE(axi_arvalid0),
        .D(\axi_araddr_reg[9]_i_1_n_4 ),
        .Q(m_instr_araddr[3]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_araddr_reg[9]_i_1 
       (.CI(1'b0),
        .CO({\axi_araddr_reg[9]_i_1_n_0 ,\axi_araddr_reg[9]_i_1_n_1 ,\axi_araddr_reg[9]_i_1_n_2 ,\axi_araddr_reg[9]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\axi_araddr_reg[9]_i_1_n_4 ,\axi_araddr_reg[9]_i_1_n_5 ,\axi_araddr_reg[9]_i_1_n_6 ,\axi_araddr_reg[9]_i_1_n_7 }),
        .S({m_instr_araddr[3:1],\axi_araddr[9]_i_2_n_0 }));
  LUT3 #(
    .INIT(8'h3A)) 
    axi_arvalid_i_1
       (.I0(start_single_burst_read_reg_n_0),
        .I1(m_instr_arready),
        .I2(axi_arvalid_reg_0),
        .O(axi_arvalid_i_1_n_0));
  FDRE axi_arvalid_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(axi_arvalid_i_1_n_0),
        .Q(axi_arvalid_reg_0),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h4F)) 
    \axi_awaddr[28]_i_1 
       (.I0(init_txn_ff2),
        .I1(init_txn_ff),
        .I2(m_instr_aresetn),
        .O(\axi_awaddr[28]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \axi_awaddr[28]_i_2 
       (.I0(axi_awvalid_reg_0),
        .I1(m_instr_awready),
        .O(axi_awvalid0));
  LUT1 #(
    .INIT(2'h1)) 
    \axi_awaddr[9]_i_2 
       (.I0(m_instr_awaddr[0]),
        .O(\axi_awaddr[9]_i_2_n_0 ));
  FDRE \axi_awaddr_reg[10] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[13]_i_1_n_7 ),
        .Q(m_instr_awaddr[4]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[11] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[13]_i_1_n_6 ),
        .Q(m_instr_awaddr[5]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[12] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[13]_i_1_n_5 ),
        .Q(m_instr_awaddr[6]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[13] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[13]_i_1_n_4 ),
        .Q(m_instr_awaddr[7]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_awaddr_reg[13]_i_1 
       (.CI(\axi_awaddr_reg[9]_i_1_n_0 ),
        .CO({\axi_awaddr_reg[13]_i_1_n_0 ,\axi_awaddr_reg[13]_i_1_n_1 ,\axi_awaddr_reg[13]_i_1_n_2 ,\axi_awaddr_reg[13]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_awaddr_reg[13]_i_1_n_4 ,\axi_awaddr_reg[13]_i_1_n_5 ,\axi_awaddr_reg[13]_i_1_n_6 ,\axi_awaddr_reg[13]_i_1_n_7 }),
        .S(m_instr_awaddr[7:4]));
  FDRE \axi_awaddr_reg[14] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[17]_i_1_n_7 ),
        .Q(m_instr_awaddr[8]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[15] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[17]_i_1_n_6 ),
        .Q(m_instr_awaddr[9]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[16] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[17]_i_1_n_5 ),
        .Q(m_instr_awaddr[10]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[17] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[17]_i_1_n_4 ),
        .Q(m_instr_awaddr[11]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_awaddr_reg[17]_i_1 
       (.CI(\axi_awaddr_reg[13]_i_1_n_0 ),
        .CO({\axi_awaddr_reg[17]_i_1_n_0 ,\axi_awaddr_reg[17]_i_1_n_1 ,\axi_awaddr_reg[17]_i_1_n_2 ,\axi_awaddr_reg[17]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_awaddr_reg[17]_i_1_n_4 ,\axi_awaddr_reg[17]_i_1_n_5 ,\axi_awaddr_reg[17]_i_1_n_6 ,\axi_awaddr_reg[17]_i_1_n_7 }),
        .S(m_instr_awaddr[11:8]));
  FDRE \axi_awaddr_reg[18] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[21]_i_1_n_7 ),
        .Q(m_instr_awaddr[12]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[19] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[21]_i_1_n_6 ),
        .Q(m_instr_awaddr[13]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[20] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[21]_i_1_n_5 ),
        .Q(m_instr_awaddr[14]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[21] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[21]_i_1_n_4 ),
        .Q(m_instr_awaddr[15]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_awaddr_reg[21]_i_1 
       (.CI(\axi_awaddr_reg[17]_i_1_n_0 ),
        .CO({\axi_awaddr_reg[21]_i_1_n_0 ,\axi_awaddr_reg[21]_i_1_n_1 ,\axi_awaddr_reg[21]_i_1_n_2 ,\axi_awaddr_reg[21]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_awaddr_reg[21]_i_1_n_4 ,\axi_awaddr_reg[21]_i_1_n_5 ,\axi_awaddr_reg[21]_i_1_n_6 ,\axi_awaddr_reg[21]_i_1_n_7 }),
        .S(m_instr_awaddr[15:12]));
  FDRE \axi_awaddr_reg[22] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[25]_i_1_n_7 ),
        .Q(m_instr_awaddr[16]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[23] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[25]_i_1_n_6 ),
        .Q(m_instr_awaddr[17]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[24] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[25]_i_1_n_5 ),
        .Q(m_instr_awaddr[18]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[25] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[25]_i_1_n_4 ),
        .Q(m_instr_awaddr[19]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_awaddr_reg[25]_i_1 
       (.CI(\axi_awaddr_reg[21]_i_1_n_0 ),
        .CO({\axi_awaddr_reg[25]_i_1_n_0 ,\axi_awaddr_reg[25]_i_1_n_1 ,\axi_awaddr_reg[25]_i_1_n_2 ,\axi_awaddr_reg[25]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_awaddr_reg[25]_i_1_n_4 ,\axi_awaddr_reg[25]_i_1_n_5 ,\axi_awaddr_reg[25]_i_1_n_6 ,\axi_awaddr_reg[25]_i_1_n_7 }),
        .S(m_instr_awaddr[19:16]));
  FDRE \axi_awaddr_reg[26] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[28]_i_3_n_7 ),
        .Q(m_instr_awaddr[20]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[27] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[28]_i_3_n_6 ),
        .Q(m_instr_awaddr[21]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[28] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[28]_i_3_n_5 ),
        .Q(m_instr_awaddr[22]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_awaddr_reg[28]_i_3 
       (.CI(\axi_awaddr_reg[25]_i_1_n_0 ),
        .CO({\axi_awaddr_reg[28]_i_3_n_0 ,\axi_awaddr_reg[28]_i_3_n_1 ,\axi_awaddr_reg[28]_i_3_n_2 ,\axi_awaddr_reg[28]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_awaddr_reg[28]_i_3_n_4 ,\axi_awaddr_reg[28]_i_3_n_5 ,\axi_awaddr_reg[28]_i_3_n_6 ,\axi_awaddr_reg[28]_i_3_n_7 }),
        .S({axi_awaddr_reg[29],m_instr_awaddr[22:20]}));
  FDRE \axi_awaddr_reg[29] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[28]_i_3_n_4 ),
        .Q(axi_awaddr_reg[29]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[30] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[30]_i_1_n_7 ),
        .Q(axi_awaddr_reg[30]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_awaddr_reg[30]_i_1 
       (.CI(\axi_awaddr_reg[28]_i_3_n_0 ),
        .CO({\NLW_axi_awaddr_reg[30]_i_1_CO_UNCONNECTED [3:1],\axi_awaddr_reg[30]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_axi_awaddr_reg[30]_i_1_O_UNCONNECTED [3:2],\axi_awaddr_reg[30]_i_1_n_6 ,\axi_awaddr_reg[30]_i_1_n_7 }),
        .S({1'b0,1'b0,axi_awaddr_reg[31:30]}));
  FDRE \axi_awaddr_reg[31] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[30]_i_1_n_6 ),
        .Q(axi_awaddr_reg[31]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[6] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[9]_i_1_n_7 ),
        .Q(m_instr_awaddr[0]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[7] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[9]_i_1_n_6 ),
        .Q(m_instr_awaddr[1]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[8] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[9]_i_1_n_5 ),
        .Q(m_instr_awaddr[2]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[9] 
       (.C(m_instr_aclk),
        .CE(axi_awvalid0),
        .D(\axi_awaddr_reg[9]_i_1_n_4 ),
        .Q(m_instr_awaddr[3]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_awaddr_reg[9]_i_1 
       (.CI(1'b0),
        .CO({\axi_awaddr_reg[9]_i_1_n_0 ,\axi_awaddr_reg[9]_i_1_n_1 ,\axi_awaddr_reg[9]_i_1_n_2 ,\axi_awaddr_reg[9]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\axi_awaddr_reg[9]_i_1_n_4 ,\axi_awaddr_reg[9]_i_1_n_5 ,\axi_awaddr_reg[9]_i_1_n_6 ,\axi_awaddr_reg[9]_i_1_n_7 }),
        .S({m_instr_awaddr[3:1],\axi_awaddr[9]_i_2_n_0 }));
  LUT3 #(
    .INIT(8'h3A)) 
    axi_awvalid_i_1
       (.I0(start_single_burst_write_reg_n_0),
        .I1(m_instr_awready),
        .I2(axi_awvalid_reg_0),
        .O(axi_awvalid_i_1_n_0));
  FDRE axi_awvalid_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(axi_awvalid_i_1_n_0),
        .Q(axi_awvalid_reg_0),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_bready_i_1
       (.I0(m_instr_bvalid),
        .I1(axi_bready_reg_0),
        .O(axi_bready0));
  FDRE axi_bready_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(axi_bready0),
        .Q(axi_bready_reg_0),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00B0B000B0B0B000)) 
    axi_rready_i_1
       (.I0(init_txn_ff2),
        .I1(init_txn_ff),
        .I2(m_instr_aresetn),
        .I3(m_instr_rvalid),
        .I4(axi_rready_reg_0),
        .I5(m_instr_rlast),
        .O(axi_rready_i_1_n_0));
  FDRE axi_rready_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(axi_rready_i_1_n_0),
        .Q(axi_rready_reg_0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \axi_wdata[31]_i_1 
       (.I0(axi_wvalid_reg_0),
        .I1(m_instr_wready),
        .O(p_13_in));
  LUT1 #(
    .INIT(2'h1)) 
    \axi_wdata[3]_i_2 
       (.I0(m_instr_wdata[0]),
        .O(\axi_wdata[3]_i_2_n_0 ));
  FDSE \axi_wdata_reg[0] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[3]_i_1_n_7 ),
        .Q(m_instr_wdata[0]),
        .S(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[10] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[11]_i_1_n_5 ),
        .Q(m_instr_wdata[10]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[11] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[11]_i_1_n_4 ),
        .Q(m_instr_wdata[11]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_wdata_reg[11]_i_1 
       (.CI(\axi_wdata_reg[7]_i_1_n_0 ),
        .CO({\axi_wdata_reg[11]_i_1_n_0 ,\axi_wdata_reg[11]_i_1_n_1 ,\axi_wdata_reg[11]_i_1_n_2 ,\axi_wdata_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_wdata_reg[11]_i_1_n_4 ,\axi_wdata_reg[11]_i_1_n_5 ,\axi_wdata_reg[11]_i_1_n_6 ,\axi_wdata_reg[11]_i_1_n_7 }),
        .S(m_instr_wdata[11:8]));
  FDRE \axi_wdata_reg[12] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[15]_i_1_n_7 ),
        .Q(m_instr_wdata[12]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[13] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[15]_i_1_n_6 ),
        .Q(m_instr_wdata[13]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[14] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[15]_i_1_n_5 ),
        .Q(m_instr_wdata[14]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[15] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[15]_i_1_n_4 ),
        .Q(m_instr_wdata[15]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_wdata_reg[15]_i_1 
       (.CI(\axi_wdata_reg[11]_i_1_n_0 ),
        .CO({\axi_wdata_reg[15]_i_1_n_0 ,\axi_wdata_reg[15]_i_1_n_1 ,\axi_wdata_reg[15]_i_1_n_2 ,\axi_wdata_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_wdata_reg[15]_i_1_n_4 ,\axi_wdata_reg[15]_i_1_n_5 ,\axi_wdata_reg[15]_i_1_n_6 ,\axi_wdata_reg[15]_i_1_n_7 }),
        .S(m_instr_wdata[15:12]));
  FDRE \axi_wdata_reg[16] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[19]_i_1_n_7 ),
        .Q(m_instr_wdata[16]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[17] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[19]_i_1_n_6 ),
        .Q(m_instr_wdata[17]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[18] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[19]_i_1_n_5 ),
        .Q(m_instr_wdata[18]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[19] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[19]_i_1_n_4 ),
        .Q(m_instr_wdata[19]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_wdata_reg[19]_i_1 
       (.CI(\axi_wdata_reg[15]_i_1_n_0 ),
        .CO({\axi_wdata_reg[19]_i_1_n_0 ,\axi_wdata_reg[19]_i_1_n_1 ,\axi_wdata_reg[19]_i_1_n_2 ,\axi_wdata_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_wdata_reg[19]_i_1_n_4 ,\axi_wdata_reg[19]_i_1_n_5 ,\axi_wdata_reg[19]_i_1_n_6 ,\axi_wdata_reg[19]_i_1_n_7 }),
        .S(m_instr_wdata[19:16]));
  FDRE \axi_wdata_reg[1] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[3]_i_1_n_6 ),
        .Q(m_instr_wdata[1]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[20] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[23]_i_1_n_7 ),
        .Q(m_instr_wdata[20]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[21] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[23]_i_1_n_6 ),
        .Q(m_instr_wdata[21]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[22] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[23]_i_1_n_5 ),
        .Q(m_instr_wdata[22]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[23] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[23]_i_1_n_4 ),
        .Q(m_instr_wdata[23]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_wdata_reg[23]_i_1 
       (.CI(\axi_wdata_reg[19]_i_1_n_0 ),
        .CO({\axi_wdata_reg[23]_i_1_n_0 ,\axi_wdata_reg[23]_i_1_n_1 ,\axi_wdata_reg[23]_i_1_n_2 ,\axi_wdata_reg[23]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_wdata_reg[23]_i_1_n_4 ,\axi_wdata_reg[23]_i_1_n_5 ,\axi_wdata_reg[23]_i_1_n_6 ,\axi_wdata_reg[23]_i_1_n_7 }),
        .S(m_instr_wdata[23:20]));
  FDRE \axi_wdata_reg[24] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[27]_i_1_n_7 ),
        .Q(m_instr_wdata[24]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[25] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[27]_i_1_n_6 ),
        .Q(m_instr_wdata[25]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[26] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[27]_i_1_n_5 ),
        .Q(m_instr_wdata[26]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[27] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[27]_i_1_n_4 ),
        .Q(m_instr_wdata[27]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_wdata_reg[27]_i_1 
       (.CI(\axi_wdata_reg[23]_i_1_n_0 ),
        .CO({\axi_wdata_reg[27]_i_1_n_0 ,\axi_wdata_reg[27]_i_1_n_1 ,\axi_wdata_reg[27]_i_1_n_2 ,\axi_wdata_reg[27]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_wdata_reg[27]_i_1_n_4 ,\axi_wdata_reg[27]_i_1_n_5 ,\axi_wdata_reg[27]_i_1_n_6 ,\axi_wdata_reg[27]_i_1_n_7 }),
        .S(m_instr_wdata[27:24]));
  FDRE \axi_wdata_reg[28] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[31]_i_2_n_7 ),
        .Q(m_instr_wdata[28]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[29] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[31]_i_2_n_6 ),
        .Q(m_instr_wdata[29]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[2] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[3]_i_1_n_5 ),
        .Q(m_instr_wdata[2]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[30] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[31]_i_2_n_5 ),
        .Q(m_instr_wdata[30]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[31] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[31]_i_2_n_4 ),
        .Q(m_instr_wdata[31]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_wdata_reg[31]_i_2 
       (.CI(\axi_wdata_reg[27]_i_1_n_0 ),
        .CO({\NLW_axi_wdata_reg[31]_i_2_CO_UNCONNECTED [3],\axi_wdata_reg[31]_i_2_n_1 ,\axi_wdata_reg[31]_i_2_n_2 ,\axi_wdata_reg[31]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_wdata_reg[31]_i_2_n_4 ,\axi_wdata_reg[31]_i_2_n_5 ,\axi_wdata_reg[31]_i_2_n_6 ,\axi_wdata_reg[31]_i_2_n_7 }),
        .S(m_instr_wdata[31:28]));
  FDRE \axi_wdata_reg[3] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[3]_i_1_n_4 ),
        .Q(m_instr_wdata[3]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_wdata_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\axi_wdata_reg[3]_i_1_n_0 ,\axi_wdata_reg[3]_i_1_n_1 ,\axi_wdata_reg[3]_i_1_n_2 ,\axi_wdata_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\axi_wdata_reg[3]_i_1_n_4 ,\axi_wdata_reg[3]_i_1_n_5 ,\axi_wdata_reg[3]_i_1_n_6 ,\axi_wdata_reg[3]_i_1_n_7 }),
        .S({m_instr_wdata[3:1],\axi_wdata[3]_i_2_n_0 }));
  FDRE \axi_wdata_reg[4] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[7]_i_1_n_7 ),
        .Q(m_instr_wdata[4]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[5] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[7]_i_1_n_6 ),
        .Q(m_instr_wdata[5]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[6] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[7]_i_1_n_5 ),
        .Q(m_instr_wdata[6]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[7] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[7]_i_1_n_4 ),
        .Q(m_instr_wdata[7]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \axi_wdata_reg[7]_i_1 
       (.CI(\axi_wdata_reg[3]_i_1_n_0 ),
        .CO({\axi_wdata_reg[7]_i_1_n_0 ,\axi_wdata_reg[7]_i_1_n_1 ,\axi_wdata_reg[7]_i_1_n_2 ,\axi_wdata_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\axi_wdata_reg[7]_i_1_n_4 ,\axi_wdata_reg[7]_i_1_n_5 ,\axi_wdata_reg[7]_i_1_n_6 ,\axi_wdata_reg[7]_i_1_n_7 }),
        .S(m_instr_wdata[7:4]));
  FDRE \axi_wdata_reg[8] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[11]_i_1_n_7 ),
        .Q(m_instr_wdata[8]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \axi_wdata_reg[9] 
       (.C(m_instr_aclk),
        .CE(p_13_in),
        .D(\axi_wdata_reg[11]_i_1_n_6 ),
        .Q(m_instr_wdata[9]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hBFAA)) 
    axi_wlast_i_1
       (.I0(axi_wlast0),
        .I1(m_instr_wready),
        .I2(axi_wvalid_reg_0),
        .I3(m_instr_wlast),
        .O(axi_wlast_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    axi_wlast_i_2
       (.I0(p_13_in),
        .I1(write_index_reg__0[3]),
        .I2(write_index_reg__0[4]),
        .I3(write_index_reg__0[2]),
        .I4(write_index_reg__0[1]),
        .I5(write_index_reg__0[0]),
        .O(axi_wlast0));
  FDRE axi_wlast_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(axi_wlast_i_1_n_0),
        .Q(m_instr_wlast),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h2EEE)) 
    axi_wvalid_i_1
       (.I0(start_single_burst_write_reg_n_0),
        .I1(axi_wvalid_reg_0),
        .I2(m_instr_wready),
        .I3(m_instr_wlast),
        .O(axi_wvalid_i_1_n_0));
  FDRE axi_wvalid_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(axi_wvalid_i_1_n_0),
        .Q(axi_wvalid_reg_0),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBFFFAAAA)) 
    burst_read_active_i_1
       (.I0(start_single_burst_read_reg_n_0),
        .I1(m_instr_rlast),
        .I2(axi_rready_reg_0),
        .I3(m_instr_rvalid),
        .I4(burst_read_active),
        .O(burst_read_active_i_1_n_0));
  FDRE burst_read_active_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(burst_read_active_i_1_n_0),
        .Q(burst_read_active),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hBFAA)) 
    burst_write_active_i_1
       (.I0(start_single_burst_write_reg_n_0),
        .I1(m_instr_bvalid),
        .I2(axi_bready_reg_0),
        .I3(burst_write_active),
        .O(burst_write_active_i_1_n_0));
  FDRE burst_write_active_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(burst_write_active_i_1_n_0),
        .Q(burst_write_active),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    compare_done_i_1
       (.I0(m_instr_aresetn),
        .O(compare_done_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFEFAA00)) 
    compare_done_i_2
       (.I0(mst_exec_state),
        .I1(init_txn_ff2),
        .I2(init_txn_ff),
        .I3(compare_done),
        .I4(m_instr_txn_done),
        .O(compare_done_i_2_n_0));
  FDRE compare_done_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(compare_done_i_2_n_0),
        .Q(m_instr_txn_done),
        .R(compare_done_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF888)) 
    error_reg_i_1
       (.I0(p_9_in),
        .I1(m_instr_rresp),
        .I2(p_7_in),
        .I3(m_instr_bresp),
        .I4(read_mismatch),
        .I5(error_reg),
        .O(error_reg_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    error_reg_i_2
       (.I0(axi_bready_reg_0),
        .I1(m_instr_bvalid),
        .O(p_7_in));
  FDRE error_reg_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(error_reg_i_1_n_0),
        .Q(error_reg),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \expected_rdata[0]_i_1 
       (.I0(axi_rready_reg_0),
        .I1(m_instr_rvalid),
        .O(p_9_in));
  LUT1 #(
    .INIT(2'h1)) 
    \expected_rdata[0]_i_3 
       (.I0(expected_rdata_reg[0]),
        .O(\expected_rdata[0]_i_3_n_0 ));
  FDSE \expected_rdata_reg[0] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[0]_i_2_n_7 ),
        .Q(expected_rdata_reg[0]),
        .S(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \expected_rdata_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\expected_rdata_reg[0]_i_2_n_0 ,\expected_rdata_reg[0]_i_2_n_1 ,\expected_rdata_reg[0]_i_2_n_2 ,\expected_rdata_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\expected_rdata_reg[0]_i_2_n_4 ,\expected_rdata_reg[0]_i_2_n_5 ,\expected_rdata_reg[0]_i_2_n_6 ,\expected_rdata_reg[0]_i_2_n_7 }),
        .S({expected_rdata_reg[3:1],\expected_rdata[0]_i_3_n_0 }));
  FDRE \expected_rdata_reg[10] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[8]_i_1_n_5 ),
        .Q(expected_rdata_reg[10]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[11] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[8]_i_1_n_4 ),
        .Q(expected_rdata_reg[11]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[12] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[12]_i_1_n_7 ),
        .Q(expected_rdata_reg[12]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \expected_rdata_reg[12]_i_1 
       (.CI(\expected_rdata_reg[8]_i_1_n_0 ),
        .CO({\expected_rdata_reg[12]_i_1_n_0 ,\expected_rdata_reg[12]_i_1_n_1 ,\expected_rdata_reg[12]_i_1_n_2 ,\expected_rdata_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\expected_rdata_reg[12]_i_1_n_4 ,\expected_rdata_reg[12]_i_1_n_5 ,\expected_rdata_reg[12]_i_1_n_6 ,\expected_rdata_reg[12]_i_1_n_7 }),
        .S(expected_rdata_reg[15:12]));
  FDRE \expected_rdata_reg[13] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[12]_i_1_n_6 ),
        .Q(expected_rdata_reg[13]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[14] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[12]_i_1_n_5 ),
        .Q(expected_rdata_reg[14]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[15] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[12]_i_1_n_4 ),
        .Q(expected_rdata_reg[15]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[16] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[16]_i_1_n_7 ),
        .Q(expected_rdata_reg[16]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \expected_rdata_reg[16]_i_1 
       (.CI(\expected_rdata_reg[12]_i_1_n_0 ),
        .CO({\expected_rdata_reg[16]_i_1_n_0 ,\expected_rdata_reg[16]_i_1_n_1 ,\expected_rdata_reg[16]_i_1_n_2 ,\expected_rdata_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\expected_rdata_reg[16]_i_1_n_4 ,\expected_rdata_reg[16]_i_1_n_5 ,\expected_rdata_reg[16]_i_1_n_6 ,\expected_rdata_reg[16]_i_1_n_7 }),
        .S(expected_rdata_reg[19:16]));
  FDRE \expected_rdata_reg[17] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[16]_i_1_n_6 ),
        .Q(expected_rdata_reg[17]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[18] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[16]_i_1_n_5 ),
        .Q(expected_rdata_reg[18]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[19] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[16]_i_1_n_4 ),
        .Q(expected_rdata_reg[19]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[1] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[0]_i_2_n_6 ),
        .Q(expected_rdata_reg[1]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[20] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[20]_i_1_n_7 ),
        .Q(expected_rdata_reg[20]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \expected_rdata_reg[20]_i_1 
       (.CI(\expected_rdata_reg[16]_i_1_n_0 ),
        .CO({\expected_rdata_reg[20]_i_1_n_0 ,\expected_rdata_reg[20]_i_1_n_1 ,\expected_rdata_reg[20]_i_1_n_2 ,\expected_rdata_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\expected_rdata_reg[20]_i_1_n_4 ,\expected_rdata_reg[20]_i_1_n_5 ,\expected_rdata_reg[20]_i_1_n_6 ,\expected_rdata_reg[20]_i_1_n_7 }),
        .S(expected_rdata_reg[23:20]));
  FDRE \expected_rdata_reg[21] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[20]_i_1_n_6 ),
        .Q(expected_rdata_reg[21]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[22] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[20]_i_1_n_5 ),
        .Q(expected_rdata_reg[22]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[23] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[20]_i_1_n_4 ),
        .Q(expected_rdata_reg[23]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[24] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[24]_i_1_n_7 ),
        .Q(expected_rdata_reg[24]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \expected_rdata_reg[24]_i_1 
       (.CI(\expected_rdata_reg[20]_i_1_n_0 ),
        .CO({\expected_rdata_reg[24]_i_1_n_0 ,\expected_rdata_reg[24]_i_1_n_1 ,\expected_rdata_reg[24]_i_1_n_2 ,\expected_rdata_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\expected_rdata_reg[24]_i_1_n_4 ,\expected_rdata_reg[24]_i_1_n_5 ,\expected_rdata_reg[24]_i_1_n_6 ,\expected_rdata_reg[24]_i_1_n_7 }),
        .S(expected_rdata_reg[27:24]));
  FDRE \expected_rdata_reg[25] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[24]_i_1_n_6 ),
        .Q(expected_rdata_reg[25]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[26] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[24]_i_1_n_5 ),
        .Q(expected_rdata_reg[26]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[27] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[24]_i_1_n_4 ),
        .Q(expected_rdata_reg[27]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[28] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[28]_i_1_n_7 ),
        .Q(expected_rdata_reg[28]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \expected_rdata_reg[28]_i_1 
       (.CI(\expected_rdata_reg[24]_i_1_n_0 ),
        .CO({\NLW_expected_rdata_reg[28]_i_1_CO_UNCONNECTED [3],\expected_rdata_reg[28]_i_1_n_1 ,\expected_rdata_reg[28]_i_1_n_2 ,\expected_rdata_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\expected_rdata_reg[28]_i_1_n_4 ,\expected_rdata_reg[28]_i_1_n_5 ,\expected_rdata_reg[28]_i_1_n_6 ,\expected_rdata_reg[28]_i_1_n_7 }),
        .S(expected_rdata_reg[31:28]));
  FDRE \expected_rdata_reg[29] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[28]_i_1_n_6 ),
        .Q(expected_rdata_reg[29]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[2] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[0]_i_2_n_5 ),
        .Q(expected_rdata_reg[2]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[30] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[28]_i_1_n_5 ),
        .Q(expected_rdata_reg[30]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[31] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[28]_i_1_n_4 ),
        .Q(expected_rdata_reg[31]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[3] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[0]_i_2_n_4 ),
        .Q(expected_rdata_reg[3]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[4] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[4]_i_1_n_7 ),
        .Q(expected_rdata_reg[4]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \expected_rdata_reg[4]_i_1 
       (.CI(\expected_rdata_reg[0]_i_2_n_0 ),
        .CO({\expected_rdata_reg[4]_i_1_n_0 ,\expected_rdata_reg[4]_i_1_n_1 ,\expected_rdata_reg[4]_i_1_n_2 ,\expected_rdata_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\expected_rdata_reg[4]_i_1_n_4 ,\expected_rdata_reg[4]_i_1_n_5 ,\expected_rdata_reg[4]_i_1_n_6 ,\expected_rdata_reg[4]_i_1_n_7 }),
        .S(expected_rdata_reg[7:4]));
  FDRE \expected_rdata_reg[5] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[4]_i_1_n_6 ),
        .Q(expected_rdata_reg[5]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[6] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[4]_i_1_n_5 ),
        .Q(expected_rdata_reg[6]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[7] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[4]_i_1_n_4 ),
        .Q(expected_rdata_reg[7]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \expected_rdata_reg[8] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[8]_i_1_n_7 ),
        .Q(expected_rdata_reg[8]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  CARRY4 \expected_rdata_reg[8]_i_1 
       (.CI(\expected_rdata_reg[4]_i_1_n_0 ),
        .CO({\expected_rdata_reg[8]_i_1_n_0 ,\expected_rdata_reg[8]_i_1_n_1 ,\expected_rdata_reg[8]_i_1_n_2 ,\expected_rdata_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\expected_rdata_reg[8]_i_1_n_4 ,\expected_rdata_reg[8]_i_1_n_5 ,\expected_rdata_reg[8]_i_1_n_6 ,\expected_rdata_reg[8]_i_1_n_7 }),
        .S(expected_rdata_reg[11:8]));
  FDRE \expected_rdata_reg[9] 
       (.C(m_instr_aclk),
        .CE(p_9_in),
        .D(\expected_rdata_reg[8]_i_1_n_6 ),
        .Q(expected_rdata_reg[9]),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE init_txn_ff2_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(init_txn_ff),
        .Q(init_txn_ff2),
        .R(compare_done_i_1_n_0));
  FDRE init_txn_ff_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(m_instr_init_axi_txn),
        .Q(init_txn_ff),
        .R(compare_done_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \read_burst_counter[0]_i_1 
       (.I0(\read_burst_counter_reg_n_0_[0] ),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \read_burst_counter[1]_i_1 
       (.I0(\read_burst_counter_reg_n_0_[0] ),
        .I1(\read_burst_counter_reg_n_0_[1] ),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \read_burst_counter[2]_i_1 
       (.I0(\read_burst_counter_reg_n_0_[0] ),
        .I1(\read_burst_counter_reg_n_0_[1] ),
        .I2(\read_burst_counter_reg_n_0_[2] ),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \read_burst_counter[3]_i_1 
       (.I0(\read_burst_counter_reg_n_0_[1] ),
        .I1(\read_burst_counter_reg_n_0_[0] ),
        .I2(\read_burst_counter_reg_n_0_[2] ),
        .I3(\read_burst_counter_reg_n_0_[3] ),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \read_burst_counter[4]_i_1 
       (.I0(\read_burst_counter_reg_n_0_[2] ),
        .I1(\read_burst_counter_reg_n_0_[0] ),
        .I2(\read_burst_counter_reg_n_0_[1] ),
        .I3(\read_burst_counter_reg_n_0_[3] ),
        .I4(\read_burst_counter_reg_n_0_[4] ),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \read_burst_counter[5]_i_1 
       (.I0(\read_burst_counter_reg_n_0_[3] ),
        .I1(\read_burst_counter_reg_n_0_[1] ),
        .I2(\read_burst_counter_reg_n_0_[0] ),
        .I3(\read_burst_counter_reg_n_0_[2] ),
        .I4(\read_burst_counter_reg_n_0_[4] ),
        .I5(\read_burst_counter_reg_n_0_[5] ),
        .O(p_0_in__0[5]));
  LUT3 #(
    .INIT(8'h08)) 
    \read_burst_counter[6]_i_1 
       (.I0(m_instr_arready),
        .I1(axi_arvalid_reg_0),
        .I2(p_0_in_0),
        .O(read_burst_counter));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \read_burst_counter[6]_i_2 
       (.I0(\read_burst_counter_reg_n_0_[4] ),
        .I1(\read_burst_counter_reg_n_0_[2] ),
        .I2(\read_burst_counter_reg_n_0_[0] ),
        .I3(\read_burst_counter_reg_n_0_[1] ),
        .I4(\read_burst_counter_reg_n_0_[3] ),
        .I5(\read_burst_counter_reg_n_0_[5] ),
        .O(p_0_in__0[6]));
  FDRE \read_burst_counter_reg[0] 
       (.C(m_instr_aclk),
        .CE(read_burst_counter),
        .D(p_0_in__0[0]),
        .Q(\read_burst_counter_reg_n_0_[0] ),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \read_burst_counter_reg[1] 
       (.C(m_instr_aclk),
        .CE(read_burst_counter),
        .D(p_0_in__0[1]),
        .Q(\read_burst_counter_reg_n_0_[1] ),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \read_burst_counter_reg[2] 
       (.C(m_instr_aclk),
        .CE(read_burst_counter),
        .D(p_0_in__0[2]),
        .Q(\read_burst_counter_reg_n_0_[2] ),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \read_burst_counter_reg[3] 
       (.C(m_instr_aclk),
        .CE(read_burst_counter),
        .D(p_0_in__0[3]),
        .Q(\read_burst_counter_reg_n_0_[3] ),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \read_burst_counter_reg[4] 
       (.C(m_instr_aclk),
        .CE(read_burst_counter),
        .D(p_0_in__0[4]),
        .Q(\read_burst_counter_reg_n_0_[4] ),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \read_burst_counter_reg[5] 
       (.C(m_instr_aclk),
        .CE(read_burst_counter),
        .D(p_0_in__0[5]),
        .Q(\read_burst_counter_reg_n_0_[5] ),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \read_burst_counter_reg[6] 
       (.C(m_instr_aclk),
        .CE(read_burst_counter),
        .D(p_0_in__0[6]),
        .Q(p_0_in_0),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \read_index[0]_i_1 
       (.I0(read_index_reg__0[0]),
        .O(p_0_in__3[0]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \read_index[1]_i_1 
       (.I0(read_index_reg__0[0]),
        .I1(read_index_reg__0[1]),
        .O(p_0_in__3[1]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \read_index[2]_i_1 
       (.I0(read_index_reg__0[0]),
        .I1(read_index_reg__0[1]),
        .I2(read_index_reg__0[2]),
        .O(\read_index[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \read_index[3]_i_1 
       (.I0(read_index_reg__0[1]),
        .I1(read_index_reg__0[0]),
        .I2(read_index_reg__0[2]),
        .I3(read_index_reg__0[3]),
        .O(p_0_in__3[3]));
  LUT4 #(
    .INIT(16'hFF4F)) 
    \read_index[4]_i_1 
       (.I0(init_txn_ff2),
        .I1(init_txn_ff),
        .I2(m_instr_aresetn),
        .I3(start_single_burst_read_reg_n_0),
        .O(\read_index[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7FFF00000000)) 
    \read_index[4]_i_2 
       (.I0(read_index_reg__0[0]),
        .I1(read_index_reg__0[3]),
        .I2(read_index_reg__0[1]),
        .I3(read_index_reg__0[2]),
        .I4(read_index_reg__0[4]),
        .I5(p_9_in),
        .O(read_index0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \read_index[4]_i_3 
       (.I0(read_index_reg__0[2]),
        .I1(read_index_reg__0[0]),
        .I2(read_index_reg__0[1]),
        .I3(read_index_reg__0[3]),
        .I4(read_index_reg__0[4]),
        .O(p_0_in__3[4]));
  FDRE \read_index_reg[0] 
       (.C(m_instr_aclk),
        .CE(read_index0),
        .D(p_0_in__3[0]),
        .Q(read_index_reg__0[0]),
        .R(\read_index[4]_i_1_n_0 ));
  FDRE \read_index_reg[1] 
       (.C(m_instr_aclk),
        .CE(read_index0),
        .D(p_0_in__3[1]),
        .Q(read_index_reg__0[1]),
        .R(\read_index[4]_i_1_n_0 ));
  FDRE \read_index_reg[2] 
       (.C(m_instr_aclk),
        .CE(read_index0),
        .D(\read_index[2]_i_1_n_0 ),
        .Q(read_index_reg__0[2]),
        .R(\read_index[4]_i_1_n_0 ));
  FDRE \read_index_reg[3] 
       (.C(m_instr_aclk),
        .CE(read_index0),
        .D(p_0_in__3[3]),
        .Q(read_index_reg__0[3]),
        .R(\read_index[4]_i_1_n_0 ));
  FDRE \read_index_reg[4] 
       (.C(m_instr_aclk),
        .CE(read_index0),
        .D(p_0_in__3[4]),
        .Q(read_index_reg__0[4]),
        .R(\read_index[4]_i_1_n_0 ));
  CARRY4 read_mismatch1_carry
       (.CI(1'b0),
        .CO({read_mismatch1_carry_n_0,read_mismatch1_carry_n_1,read_mismatch1_carry_n_2,read_mismatch1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O(NLW_read_mismatch1_carry_O_UNCONNECTED[3:0]),
        .S({read_mismatch1_carry_i_1_n_0,read_mismatch1_carry_i_2_n_0,read_mismatch1_carry_i_3_n_0,read_mismatch1_carry_i_4_n_0}));
  CARRY4 read_mismatch1_carry__0
       (.CI(read_mismatch1_carry_n_0),
        .CO({read_mismatch1_carry__0_n_0,read_mismatch1_carry__0_n_1,read_mismatch1_carry__0_n_2,read_mismatch1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O(NLW_read_mismatch1_carry__0_O_UNCONNECTED[3:0]),
        .S({read_mismatch1_carry__0_i_1_n_0,read_mismatch1_carry__0_i_2_n_0,read_mismatch1_carry__0_i_3_n_0,read_mismatch1_carry__0_i_4_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry__0_i_1
       (.I0(m_instr_rdata[21]),
        .I1(expected_rdata_reg[21]),
        .I2(expected_rdata_reg[23]),
        .I3(m_instr_rdata[23]),
        .I4(expected_rdata_reg[22]),
        .I5(m_instr_rdata[22]),
        .O(read_mismatch1_carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry__0_i_2
       (.I0(m_instr_rdata[18]),
        .I1(expected_rdata_reg[18]),
        .I2(expected_rdata_reg[20]),
        .I3(m_instr_rdata[20]),
        .I4(expected_rdata_reg[19]),
        .I5(m_instr_rdata[19]),
        .O(read_mismatch1_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry__0_i_3
       (.I0(m_instr_rdata[15]),
        .I1(expected_rdata_reg[15]),
        .I2(expected_rdata_reg[17]),
        .I3(m_instr_rdata[17]),
        .I4(expected_rdata_reg[16]),
        .I5(m_instr_rdata[16]),
        .O(read_mismatch1_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry__0_i_4
       (.I0(m_instr_rdata[12]),
        .I1(expected_rdata_reg[12]),
        .I2(expected_rdata_reg[14]),
        .I3(m_instr_rdata[14]),
        .I4(expected_rdata_reg[13]),
        .I5(m_instr_rdata[13]),
        .O(read_mismatch1_carry__0_i_4_n_0));
  CARRY4 read_mismatch1_carry__1
       (.CI(read_mismatch1_carry__0_n_0),
        .CO({NLW_read_mismatch1_carry__1_CO_UNCONNECTED[3],read_mismatch1,read_mismatch1_carry__1_n_2,read_mismatch1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b1,1'b1,1'b1}),
        .O(NLW_read_mismatch1_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,read_mismatch1_carry__1_i_1_n_0,read_mismatch1_carry__1_i_2_n_0,read_mismatch1_carry__1_i_3_n_0}));
  LUT4 #(
    .INIT(16'h9009)) 
    read_mismatch1_carry__1_i_1
       (.I0(m_instr_rdata[30]),
        .I1(expected_rdata_reg[30]),
        .I2(m_instr_rdata[31]),
        .I3(expected_rdata_reg[31]),
        .O(read_mismatch1_carry__1_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry__1_i_2
       (.I0(m_instr_rdata[27]),
        .I1(expected_rdata_reg[27]),
        .I2(expected_rdata_reg[29]),
        .I3(m_instr_rdata[29]),
        .I4(expected_rdata_reg[28]),
        .I5(m_instr_rdata[28]),
        .O(read_mismatch1_carry__1_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry__1_i_3
       (.I0(m_instr_rdata[24]),
        .I1(expected_rdata_reg[24]),
        .I2(expected_rdata_reg[26]),
        .I3(m_instr_rdata[26]),
        .I4(expected_rdata_reg[25]),
        .I5(m_instr_rdata[25]),
        .O(read_mismatch1_carry__1_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry_i_1
       (.I0(m_instr_rdata[9]),
        .I1(expected_rdata_reg[9]),
        .I2(expected_rdata_reg[11]),
        .I3(m_instr_rdata[11]),
        .I4(expected_rdata_reg[10]),
        .I5(m_instr_rdata[10]),
        .O(read_mismatch1_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry_i_2
       (.I0(m_instr_rdata[6]),
        .I1(expected_rdata_reg[6]),
        .I2(expected_rdata_reg[8]),
        .I3(m_instr_rdata[8]),
        .I4(expected_rdata_reg[7]),
        .I5(m_instr_rdata[7]),
        .O(read_mismatch1_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry_i_3
       (.I0(m_instr_rdata[3]),
        .I1(expected_rdata_reg[3]),
        .I2(expected_rdata_reg[5]),
        .I3(m_instr_rdata[5]),
        .I4(expected_rdata_reg[4]),
        .I5(m_instr_rdata[4]),
        .O(read_mismatch1_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    read_mismatch1_carry_i_4
       (.I0(m_instr_rdata[0]),
        .I1(expected_rdata_reg[0]),
        .I2(expected_rdata_reg[2]),
        .I3(m_instr_rdata[2]),
        .I4(expected_rdata_reg[1]),
        .I5(m_instr_rdata[1]),
        .O(read_mismatch1_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    read_mismatch_i_1
       (.I0(read_mismatch1),
        .I1(m_instr_rvalid),
        .I2(axi_rready_reg_0),
        .O(read_mismatch0));
  FDRE read_mismatch_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(read_mismatch0),
        .Q(read_mismatch),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    reads_done_i_1
       (.I0(m_instr_rvalid),
        .I1(axi_rready_reg_0),
        .I2(reads_done2),
        .I3(p_0_in_0),
        .I4(reads_done),
        .O(reads_done_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    reads_done_i_2
       (.I0(read_index_reg__0[4]),
        .I1(read_index_reg__0[1]),
        .I2(read_index_reg__0[0]),
        .I3(read_index_reg__0[3]),
        .I4(read_index_reg__0[2]),
        .O(reads_done2));
  FDRE reads_done_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(reads_done_i_1_n_0),
        .Q(reads_done),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF0FF00000100)) 
    start_single_burst_read_i_1
       (.I0(burst_read_active),
        .I1(axi_arvalid_reg_0),
        .I2(mst_exec_state),
        .I3(compare_done),
        .I4(reads_done),
        .I5(start_single_burst_read_reg_n_0),
        .O(start_single_burst_read_i_1_n_0));
  FDRE start_single_burst_read_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(start_single_burst_read_i_1_n_0),
        .Q(start_single_burst_read_reg_n_0),
        .R(compare_done_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFF0FF00000100)) 
    start_single_burst_write_i_1
       (.I0(axi_awvalid_reg_0),
        .I1(burst_write_active),
        .I2(compare_done),
        .I3(mst_exec_state),
        .I4(writes_done),
        .I5(start_single_burst_write_reg_n_0),
        .O(start_single_burst_write_i_1_n_0));
  FDRE start_single_burst_write_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(start_single_burst_write_i_1_n_0),
        .Q(start_single_burst_write_reg_n_0),
        .R(compare_done_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \write_burst_counter[0]_i_1 
       (.I0(\write_burst_counter_reg_n_0_[0] ),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \write_burst_counter[1]_i_1 
       (.I0(\write_burst_counter_reg_n_0_[0] ),
        .I1(\write_burst_counter_reg_n_0_[1] ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \write_burst_counter[2]_i_1 
       (.I0(\write_burst_counter_reg_n_0_[0] ),
        .I1(\write_burst_counter_reg_n_0_[1] ),
        .I2(\write_burst_counter_reg_n_0_[2] ),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \write_burst_counter[3]_i_1 
       (.I0(\write_burst_counter_reg_n_0_[1] ),
        .I1(\write_burst_counter_reg_n_0_[0] ),
        .I2(\write_burst_counter_reg_n_0_[2] ),
        .I3(\write_burst_counter_reg_n_0_[3] ),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \write_burst_counter[4]_i_1 
       (.I0(\write_burst_counter_reg_n_0_[2] ),
        .I1(\write_burst_counter_reg_n_0_[0] ),
        .I2(\write_burst_counter_reg_n_0_[1] ),
        .I3(\write_burst_counter_reg_n_0_[3] ),
        .I4(\write_burst_counter_reg_n_0_[4] ),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \write_burst_counter[5]_i_1 
       (.I0(\write_burst_counter_reg_n_0_[3] ),
        .I1(\write_burst_counter_reg_n_0_[1] ),
        .I2(\write_burst_counter_reg_n_0_[0] ),
        .I3(\write_burst_counter_reg_n_0_[2] ),
        .I4(\write_burst_counter_reg_n_0_[4] ),
        .I5(\write_burst_counter_reg_n_0_[5] ),
        .O(p_0_in[5]));
  LUT3 #(
    .INIT(8'h08)) 
    \write_burst_counter[6]_i_1 
       (.I0(m_instr_awready),
        .I1(axi_awvalid_reg_0),
        .I2(p_0_in3_in),
        .O(write_burst_counter));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \write_burst_counter[6]_i_2 
       (.I0(\write_burst_counter_reg_n_0_[4] ),
        .I1(\write_burst_counter_reg_n_0_[2] ),
        .I2(\write_burst_counter_reg_n_0_[0] ),
        .I3(\write_burst_counter_reg_n_0_[1] ),
        .I4(\write_burst_counter_reg_n_0_[3] ),
        .I5(\write_burst_counter_reg_n_0_[5] ),
        .O(p_0_in[6]));
  FDRE \write_burst_counter_reg[0] 
       (.C(m_instr_aclk),
        .CE(write_burst_counter),
        .D(p_0_in[0]),
        .Q(\write_burst_counter_reg_n_0_[0] ),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \write_burst_counter_reg[1] 
       (.C(m_instr_aclk),
        .CE(write_burst_counter),
        .D(p_0_in[1]),
        .Q(\write_burst_counter_reg_n_0_[1] ),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \write_burst_counter_reg[2] 
       (.C(m_instr_aclk),
        .CE(write_burst_counter),
        .D(p_0_in[2]),
        .Q(\write_burst_counter_reg_n_0_[2] ),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \write_burst_counter_reg[3] 
       (.C(m_instr_aclk),
        .CE(write_burst_counter),
        .D(p_0_in[3]),
        .Q(\write_burst_counter_reg_n_0_[3] ),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \write_burst_counter_reg[4] 
       (.C(m_instr_aclk),
        .CE(write_burst_counter),
        .D(p_0_in[4]),
        .Q(\write_burst_counter_reg_n_0_[4] ),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \write_burst_counter_reg[5] 
       (.C(m_instr_aclk),
        .CE(write_burst_counter),
        .D(p_0_in[5]),
        .Q(\write_burst_counter_reg_n_0_[5] ),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  FDRE \write_burst_counter_reg[6] 
       (.C(m_instr_aclk),
        .CE(write_burst_counter),
        .D(p_0_in[6]),
        .Q(p_0_in3_in),
        .R(\axi_awaddr[28]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \write_index[0]_i_1 
       (.I0(write_index_reg__0[0]),
        .O(p_0_in__4[0]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \write_index[1]_i_1 
       (.I0(write_index_reg__0[0]),
        .I1(write_index_reg__0[1]),
        .O(p_0_in__4[1]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \write_index[2]_i_1 
       (.I0(write_index_reg__0[0]),
        .I1(write_index_reg__0[1]),
        .I2(write_index_reg__0[2]),
        .O(p_0_in__4[2]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \write_index[3]_i_1 
       (.I0(write_index_reg__0[1]),
        .I1(write_index_reg__0[0]),
        .I2(write_index_reg__0[2]),
        .I3(write_index_reg__0[3]),
        .O(p_0_in__4[3]));
  LUT4 #(
    .INIT(16'hFF4F)) 
    \write_index[4]_i_1 
       (.I0(init_txn_ff2),
        .I1(init_txn_ff),
        .I2(m_instr_aresetn),
        .I3(start_single_burst_write_reg_n_0),
        .O(\write_index[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7FFF00000000)) 
    \write_index[4]_i_2 
       (.I0(write_index_reg__0[0]),
        .I1(write_index_reg__0[3]),
        .I2(write_index_reg__0[1]),
        .I3(write_index_reg__0[2]),
        .I4(write_index_reg__0[4]),
        .I5(p_13_in),
        .O(write_index0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \write_index[4]_i_3 
       (.I0(write_index_reg__0[2]),
        .I1(write_index_reg__0[0]),
        .I2(write_index_reg__0[1]),
        .I3(write_index_reg__0[3]),
        .I4(write_index_reg__0[4]),
        .O(p_0_in__4[4]));
  FDRE \write_index_reg[0] 
       (.C(m_instr_aclk),
        .CE(write_index0),
        .D(p_0_in__4[0]),
        .Q(write_index_reg__0[0]),
        .R(\write_index[4]_i_1_n_0 ));
  FDRE \write_index_reg[1] 
       (.C(m_instr_aclk),
        .CE(write_index0),
        .D(p_0_in__4[1]),
        .Q(write_index_reg__0[1]),
        .R(\write_index[4]_i_1_n_0 ));
  FDRE \write_index_reg[2] 
       (.C(m_instr_aclk),
        .CE(write_index0),
        .D(p_0_in__4[2]),
        .Q(write_index_reg__0[2]),
        .R(\write_index[4]_i_1_n_0 ));
  FDRE \write_index_reg[3] 
       (.C(m_instr_aclk),
        .CE(write_index0),
        .D(p_0_in__4[3]),
        .Q(write_index_reg__0[3]),
        .R(\write_index[4]_i_1_n_0 ));
  FDRE \write_index_reg[4] 
       (.C(m_instr_aclk),
        .CE(write_index0),
        .D(p_0_in__4[4]),
        .Q(write_index_reg__0[4]),
        .R(\write_index[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hFF80)) 
    writes_done_i_1
       (.I0(p_0_in3_in),
        .I1(axi_bready_reg_0),
        .I2(m_instr_bvalid),
        .I3(writes_done),
        .O(writes_done_i_1_n_0));
  FDRE writes_done_reg
       (.C(m_instr_aclk),
        .CE(1'b1),
        .D(writes_done_i_1_n_0),
        .Q(writes_done),
        .R(\axi_awaddr[28]_i_1_n_0 ));
endmodule

(* CHECK_LICENSE_TYPE = "mc_top_core_wrapper_0_0,core_wrapper_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "core_wrapper_v1_0,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module mc_top_core_wrapper_0_0
   (m_instr_awid,
    m_instr_awaddr,
    m_instr_awlen,
    m_instr_awsize,
    m_instr_awburst,
    m_instr_awlock,
    m_instr_awcache,
    m_instr_awprot,
    m_instr_awqos,
    m_instr_awuser,
    m_instr_awvalid,
    m_instr_awready,
    m_instr_wdata,
    m_instr_wstrb,
    m_instr_wlast,
    m_instr_wuser,
    m_instr_wvalid,
    m_instr_wready,
    m_instr_bid,
    m_instr_bresp,
    m_instr_buser,
    m_instr_bvalid,
    m_instr_bready,
    m_instr_arid,
    m_instr_araddr,
    m_instr_arlen,
    m_instr_arsize,
    m_instr_arburst,
    m_instr_arlock,
    m_instr_arcache,
    m_instr_arprot,
    m_instr_arqos,
    m_instr_aruser,
    m_instr_arvalid,
    m_instr_arready,
    m_instr_rid,
    m_instr_rdata,
    m_instr_rresp,
    m_instr_rlast,
    m_instr_ruser,
    m_instr_rvalid,
    m_instr_rready,
    m_instr_aclk,
    m_instr_aresetn,
    m_instr_init_axi_txn,
    m_instr_txn_done,
    m_instr_error,
    m_data_awid,
    m_data_awaddr,
    m_data_awlen,
    m_data_awsize,
    m_data_awburst,
    m_data_awlock,
    m_data_awcache,
    m_data_awprot,
    m_data_awqos,
    m_data_awuser,
    m_data_awvalid,
    m_data_awready,
    m_data_wdata,
    m_data_wstrb,
    m_data_wlast,
    m_data_wuser,
    m_data_wvalid,
    m_data_wready,
    m_data_bid,
    m_data_bresp,
    m_data_buser,
    m_data_bvalid,
    m_data_bready,
    m_data_arid,
    m_data_araddr,
    m_data_arlen,
    m_data_arsize,
    m_data_arburst,
    m_data_arlock,
    m_data_arcache,
    m_data_arprot,
    m_data_arqos,
    m_data_aruser,
    m_data_arvalid,
    m_data_arready,
    m_data_rid,
    m_data_rdata,
    m_data_rresp,
    m_data_rlast,
    m_data_ruser,
    m_data_rvalid,
    m_data_rready,
    m_data_aclk,
    m_data_aresetn,
    m_data_init_axi_txn,
    m_data_txn_done,
    m_data_error);
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWID" *) output [0:0]m_instr_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWADDR" *) output [31:0]m_instr_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWLEN" *) output [7:0]m_instr_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWSIZE" *) output [2:0]m_instr_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWBURST" *) output [1:0]m_instr_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWLOCK" *) output m_instr_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWCACHE" *) output [3:0]m_instr_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWPROT" *) output [2:0]m_instr_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWQOS" *) output [3:0]m_instr_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWUSER" *) output [0:0]m_instr_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWVALID" *) output m_instr_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr AWREADY" *) input m_instr_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr WDATA" *) output [31:0]m_instr_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr WSTRB" *) output [3:0]m_instr_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr WLAST" *) output m_instr_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr WUSER" *) output [0:0]m_instr_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr WVALID" *) output m_instr_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr WREADY" *) input m_instr_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr BID" *) input [0:0]m_instr_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr BRESP" *) input [1:0]m_instr_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr BUSER" *) input [0:0]m_instr_buser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr BVALID" *) input m_instr_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr BREADY" *) output m_instr_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARID" *) output [0:0]m_instr_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARADDR" *) output [31:0]m_instr_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARLEN" *) output [7:0]m_instr_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARSIZE" *) output [2:0]m_instr_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARBURST" *) output [1:0]m_instr_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARLOCK" *) output m_instr_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARCACHE" *) output [3:0]m_instr_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARPROT" *) output [2:0]m_instr_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARQOS" *) output [3:0]m_instr_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARUSER" *) output [0:0]m_instr_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARVALID" *) output m_instr_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr ARREADY" *) input m_instr_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr RID" *) input [0:0]m_instr_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr RDATA" *) input [31:0]m_instr_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr RRESP" *) input [1:0]m_instr_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr RLAST" *) input m_instr_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr RUSER" *) input [0:0]m_instr_ruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr RVALID" *) input m_instr_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_instr RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_instr, WIZ_DATA_WIDTH 32, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output m_instr_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_instr_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_instr_CLK, ASSOCIATED_BUSIF m_instr, ASSOCIATED_RESET m_instr_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0" *) input m_instr_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m_instr_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_instr_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input m_instr_aresetn;
  input m_instr_init_axi_txn;
  output m_instr_txn_done;
  output m_instr_error;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWID" *) output [0:0]m_data_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWADDR" *) output [31:0]m_data_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWLEN" *) output [7:0]m_data_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWSIZE" *) output [2:0]m_data_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWBURST" *) output [1:0]m_data_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWLOCK" *) output m_data_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWCACHE" *) output [3:0]m_data_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWPROT" *) output [2:0]m_data_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWQOS" *) output [3:0]m_data_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWUSER" *) output [0:0]m_data_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWVALID" *) output m_data_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data AWREADY" *) input m_data_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data WDATA" *) output [31:0]m_data_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data WSTRB" *) output [3:0]m_data_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data WLAST" *) output m_data_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data WUSER" *) output [0:0]m_data_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data WVALID" *) output m_data_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data WREADY" *) input m_data_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data BID" *) input [0:0]m_data_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data BRESP" *) input [1:0]m_data_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data BUSER" *) input [0:0]m_data_buser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data BVALID" *) input m_data_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data BREADY" *) output m_data_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARID" *) output [0:0]m_data_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARADDR" *) output [31:0]m_data_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARLEN" *) output [7:0]m_data_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARSIZE" *) output [2:0]m_data_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARBURST" *) output [1:0]m_data_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARLOCK" *) output m_data_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARCACHE" *) output [3:0]m_data_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARPROT" *) output [2:0]m_data_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARQOS" *) output [3:0]m_data_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARUSER" *) output [0:0]m_data_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARVALID" *) output m_data_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data ARREADY" *) input m_data_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data RID" *) input [0:0]m_data_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data RDATA" *) input [31:0]m_data_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data RRESP" *) input [1:0]m_data_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data RLAST" *) input m_data_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data RUSER" *) input [0:0]m_data_ruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data RVALID" *) input m_data_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_data RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_data, WIZ_DATA_WIDTH 32, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output m_data_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_data_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_data_CLK, ASSOCIATED_BUSIF m_data, ASSOCIATED_RESET m_data_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0" *) input m_data_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m_data_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_data_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input m_data_aresetn;
  input m_data_init_axi_txn;
  output m_data_txn_done;
  output m_data_error;

  wire \<const0> ;
  wire \<const1> ;
  wire m_data_aclk;
  wire [31:6]\^m_data_araddr ;
  wire m_data_aresetn;
  wire m_data_arready;
  wire m_data_arvalid;
  wire [31:6]\^m_data_awaddr ;
  wire m_data_awready;
  wire m_data_awvalid;
  wire m_data_bready;
  wire [1:0]m_data_bresp;
  wire m_data_bvalid;
  wire m_data_error;
  wire m_data_init_axi_txn;
  wire [31:0]m_data_rdata;
  wire m_data_rlast;
  wire m_data_rready;
  wire [1:0]m_data_rresp;
  wire m_data_rvalid;
  wire m_data_txn_done;
  wire [31:0]m_data_wdata;
  wire m_data_wlast;
  wire m_data_wready;
  wire m_data_wvalid;
  wire m_instr_aclk;
  wire [31:6]\^m_instr_araddr ;
  wire m_instr_aresetn;
  wire m_instr_arready;
  wire m_instr_arvalid;
  wire [31:6]\^m_instr_awaddr ;
  wire m_instr_awready;
  wire m_instr_awvalid;
  wire m_instr_bready;
  wire [1:0]m_instr_bresp;
  wire m_instr_bvalid;
  wire m_instr_error;
  wire m_instr_init_axi_txn;
  wire [31:0]m_instr_rdata;
  wire m_instr_rlast;
  wire m_instr_rready;
  wire [1:0]m_instr_rresp;
  wire m_instr_rvalid;
  wire m_instr_txn_done;
  wire [31:0]m_instr_wdata;
  wire m_instr_wlast;
  wire m_instr_wready;
  wire m_instr_wvalid;

  assign m_data_araddr[31:6] = \^m_data_araddr [31:6];
  assign m_data_araddr[5] = \<const0> ;
  assign m_data_araddr[4] = \<const0> ;
  assign m_data_araddr[3] = \<const0> ;
  assign m_data_araddr[2] = \<const0> ;
  assign m_data_araddr[1] = \<const0> ;
  assign m_data_araddr[0] = \<const0> ;
  assign m_data_arburst[1] = \<const0> ;
  assign m_data_arburst[0] = \<const1> ;
  assign m_data_arcache[3] = \<const0> ;
  assign m_data_arcache[2] = \<const0> ;
  assign m_data_arcache[1] = \<const1> ;
  assign m_data_arcache[0] = \<const0> ;
  assign m_data_arid[0] = \<const0> ;
  assign m_data_arlen[7] = \<const0> ;
  assign m_data_arlen[6] = \<const0> ;
  assign m_data_arlen[5] = \<const0> ;
  assign m_data_arlen[4] = \<const0> ;
  assign m_data_arlen[3] = \<const1> ;
  assign m_data_arlen[2] = \<const1> ;
  assign m_data_arlen[1] = \<const1> ;
  assign m_data_arlen[0] = \<const1> ;
  assign m_data_arlock = \<const0> ;
  assign m_data_arprot[2] = \<const0> ;
  assign m_data_arprot[1] = \<const0> ;
  assign m_data_arprot[0] = \<const0> ;
  assign m_data_arqos[3] = \<const0> ;
  assign m_data_arqos[2] = \<const0> ;
  assign m_data_arqos[1] = \<const0> ;
  assign m_data_arqos[0] = \<const0> ;
  assign m_data_arsize[2] = \<const0> ;
  assign m_data_arsize[1] = \<const1> ;
  assign m_data_arsize[0] = \<const0> ;
  assign m_data_aruser[0] = \<const1> ;
  assign m_data_awaddr[31:6] = \^m_data_awaddr [31:6];
  assign m_data_awaddr[5] = \<const0> ;
  assign m_data_awaddr[4] = \<const0> ;
  assign m_data_awaddr[3] = \<const0> ;
  assign m_data_awaddr[2] = \<const0> ;
  assign m_data_awaddr[1] = \<const0> ;
  assign m_data_awaddr[0] = \<const0> ;
  assign m_data_awburst[1] = \<const0> ;
  assign m_data_awburst[0] = \<const1> ;
  assign m_data_awcache[3] = \<const0> ;
  assign m_data_awcache[2] = \<const0> ;
  assign m_data_awcache[1] = \<const1> ;
  assign m_data_awcache[0] = \<const0> ;
  assign m_data_awid[0] = \<const0> ;
  assign m_data_awlen[7] = \<const0> ;
  assign m_data_awlen[6] = \<const0> ;
  assign m_data_awlen[5] = \<const0> ;
  assign m_data_awlen[4] = \<const0> ;
  assign m_data_awlen[3] = \<const1> ;
  assign m_data_awlen[2] = \<const1> ;
  assign m_data_awlen[1] = \<const1> ;
  assign m_data_awlen[0] = \<const1> ;
  assign m_data_awlock = \<const0> ;
  assign m_data_awprot[2] = \<const0> ;
  assign m_data_awprot[1] = \<const0> ;
  assign m_data_awprot[0] = \<const0> ;
  assign m_data_awqos[3] = \<const0> ;
  assign m_data_awqos[2] = \<const0> ;
  assign m_data_awqos[1] = \<const0> ;
  assign m_data_awqos[0] = \<const0> ;
  assign m_data_awsize[2] = \<const0> ;
  assign m_data_awsize[1] = \<const1> ;
  assign m_data_awsize[0] = \<const0> ;
  assign m_data_awuser[0] = \<const1> ;
  assign m_data_wstrb[3] = \<const1> ;
  assign m_data_wstrb[2] = \<const1> ;
  assign m_data_wstrb[1] = \<const1> ;
  assign m_data_wstrb[0] = \<const1> ;
  assign m_data_wuser[0] = \<const0> ;
  assign m_instr_araddr[31:6] = \^m_instr_araddr [31:6];
  assign m_instr_araddr[5] = \<const0> ;
  assign m_instr_araddr[4] = \<const0> ;
  assign m_instr_araddr[3] = \<const0> ;
  assign m_instr_araddr[2] = \<const0> ;
  assign m_instr_araddr[1] = \<const0> ;
  assign m_instr_araddr[0] = \<const0> ;
  assign m_instr_arburst[1] = \<const0> ;
  assign m_instr_arburst[0] = \<const1> ;
  assign m_instr_arcache[3] = \<const0> ;
  assign m_instr_arcache[2] = \<const0> ;
  assign m_instr_arcache[1] = \<const1> ;
  assign m_instr_arcache[0] = \<const0> ;
  assign m_instr_arid[0] = \<const0> ;
  assign m_instr_arlen[7] = \<const0> ;
  assign m_instr_arlen[6] = \<const0> ;
  assign m_instr_arlen[5] = \<const0> ;
  assign m_instr_arlen[4] = \<const0> ;
  assign m_instr_arlen[3] = \<const1> ;
  assign m_instr_arlen[2] = \<const1> ;
  assign m_instr_arlen[1] = \<const1> ;
  assign m_instr_arlen[0] = \<const1> ;
  assign m_instr_arlock = \<const0> ;
  assign m_instr_arprot[2] = \<const0> ;
  assign m_instr_arprot[1] = \<const0> ;
  assign m_instr_arprot[0] = \<const0> ;
  assign m_instr_arqos[3] = \<const0> ;
  assign m_instr_arqos[2] = \<const0> ;
  assign m_instr_arqos[1] = \<const0> ;
  assign m_instr_arqos[0] = \<const0> ;
  assign m_instr_arsize[2] = \<const0> ;
  assign m_instr_arsize[1] = \<const1> ;
  assign m_instr_arsize[0] = \<const0> ;
  assign m_instr_aruser[0] = \<const1> ;
  assign m_instr_awaddr[31:6] = \^m_instr_awaddr [31:6];
  assign m_instr_awaddr[5] = \<const0> ;
  assign m_instr_awaddr[4] = \<const0> ;
  assign m_instr_awaddr[3] = \<const0> ;
  assign m_instr_awaddr[2] = \<const0> ;
  assign m_instr_awaddr[1] = \<const0> ;
  assign m_instr_awaddr[0] = \<const0> ;
  assign m_instr_awburst[1] = \<const0> ;
  assign m_instr_awburst[0] = \<const1> ;
  assign m_instr_awcache[3] = \<const0> ;
  assign m_instr_awcache[2] = \<const0> ;
  assign m_instr_awcache[1] = \<const1> ;
  assign m_instr_awcache[0] = \<const0> ;
  assign m_instr_awid[0] = \<const0> ;
  assign m_instr_awlen[7] = \<const0> ;
  assign m_instr_awlen[6] = \<const0> ;
  assign m_instr_awlen[5] = \<const0> ;
  assign m_instr_awlen[4] = \<const0> ;
  assign m_instr_awlen[3] = \<const1> ;
  assign m_instr_awlen[2] = \<const1> ;
  assign m_instr_awlen[1] = \<const1> ;
  assign m_instr_awlen[0] = \<const1> ;
  assign m_instr_awlock = \<const0> ;
  assign m_instr_awprot[2] = \<const0> ;
  assign m_instr_awprot[1] = \<const0> ;
  assign m_instr_awprot[0] = \<const0> ;
  assign m_instr_awqos[3] = \<const0> ;
  assign m_instr_awqos[2] = \<const0> ;
  assign m_instr_awqos[1] = \<const0> ;
  assign m_instr_awqos[0] = \<const0> ;
  assign m_instr_awsize[2] = \<const0> ;
  assign m_instr_awsize[1] = \<const1> ;
  assign m_instr_awsize[0] = \<const0> ;
  assign m_instr_awuser[0] = \<const1> ;
  assign m_instr_wstrb[3] = \<const1> ;
  assign m_instr_wstrb[2] = \<const1> ;
  assign m_instr_wstrb[1] = \<const1> ;
  assign m_instr_wstrb[0] = \<const1> ;
  assign m_instr_wuser[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  mc_top_core_wrapper_0_0_core_wrapper_v1_0 inst
       (.axi_arvalid_reg(m_instr_arvalid),
        .axi_arvalid_reg_0(m_data_arvalid),
        .axi_awvalid_reg(m_instr_awvalid),
        .axi_awvalid_reg_0(m_data_awvalid),
        .axi_rready_reg(m_instr_rready),
        .axi_rready_reg_0(m_data_rready),
        .axi_wvalid_reg(m_instr_wvalid),
        .axi_wvalid_reg_0(m_data_wvalid),
        .m_data_aclk(m_data_aclk),
        .m_data_araddr(\^m_data_araddr ),
        .m_data_aresetn(m_data_aresetn),
        .m_data_arready(m_data_arready),
        .m_data_awaddr(\^m_data_awaddr ),
        .m_data_awready(m_data_awready),
        .m_data_bready(m_data_bready),
        .m_data_bresp(m_data_bresp[1]),
        .m_data_bvalid(m_data_bvalid),
        .m_data_error(m_data_error),
        .m_data_init_axi_txn(m_data_init_axi_txn),
        .m_data_rdata(m_data_rdata),
        .m_data_rlast(m_data_rlast),
        .m_data_rresp(m_data_rresp[1]),
        .m_data_rvalid(m_data_rvalid),
        .m_data_txn_done(m_data_txn_done),
        .m_data_wdata(m_data_wdata),
        .m_data_wlast(m_data_wlast),
        .m_data_wready(m_data_wready),
        .m_instr_aclk(m_instr_aclk),
        .m_instr_araddr(\^m_instr_araddr ),
        .m_instr_aresetn(m_instr_aresetn),
        .m_instr_arready(m_instr_arready),
        .m_instr_awaddr(\^m_instr_awaddr ),
        .m_instr_awready(m_instr_awready),
        .m_instr_bready(m_instr_bready),
        .m_instr_bresp(m_instr_bresp[1]),
        .m_instr_bvalid(m_instr_bvalid),
        .m_instr_error(m_instr_error),
        .m_instr_init_axi_txn(m_instr_init_axi_txn),
        .m_instr_rdata(m_instr_rdata),
        .m_instr_rlast(m_instr_rlast),
        .m_instr_rresp(m_instr_rresp[1]),
        .m_instr_rvalid(m_instr_rvalid),
        .m_instr_txn_done(m_instr_txn_done),
        .m_instr_wdata(m_instr_wdata),
        .m_instr_wlast(m_instr_wlast),
        .m_instr_wready(m_instr_wready));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
