
`timescale 1 ns / 1 ps

	module core_wrapper_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Master Bus Interface m_instr
		parameter  C_m_instr_TARGET_SLAVE_BASE_ADDR	= 32'h40000000,
		parameter integer C_m_instr_BURST_LEN	= 16,
		parameter integer C_m_instr_ID_WIDTH	= 1,
		parameter integer C_m_instr_ADDR_WIDTH	= 32,
		parameter integer C_m_instr_DATA_WIDTH	= 32,
		parameter integer C_m_instr_AWUSER_WIDTH	= 0,
		parameter integer C_m_instr_ARUSER_WIDTH	= 0,
		parameter integer C_m_instr_WUSER_WIDTH	= 0,
		parameter integer C_m_instr_RUSER_WIDTH	= 0,
		parameter integer C_m_instr_BUSER_WIDTH	= 0,

		// Parameters of Axi Master Bus Interface m_data
		parameter  C_m_data_TARGET_SLAVE_BASE_ADDR	= 32'h40000000,
		parameter integer C_m_data_BURST_LEN	= 16,
		parameter integer C_m_data_ID_WIDTH	= 1,
		parameter integer C_m_data_ADDR_WIDTH	= 32,
		parameter integer C_m_data_DATA_WIDTH	= 32,
		parameter integer C_m_data_AWUSER_WIDTH	= 0,
		parameter integer C_m_data_ARUSER_WIDTH	= 0,
		parameter integer C_m_data_WUSER_WIDTH	= 0,
		parameter integer C_m_data_RUSER_WIDTH	= 0,
		parameter integer C_m_data_BUSER_WIDTH	= 0
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Master Bus Interface m_instr
		input wire  m_instr_init_axi_txn,
		output wire  m_instr_txn_done,
		output wire  m_instr_error,
		input wire  m_instr_aclk,
		input wire  m_instr_aresetn,
		output wire [C_m_instr_ID_WIDTH-1 : 0] m_instr_awid,
		output wire [C_m_instr_ADDR_WIDTH-1 : 0] m_instr_awaddr,
		output wire [7 : 0] m_instr_awlen,
		output wire [2 : 0] m_instr_awsize,
		output wire [1 : 0] m_instr_awburst,
		output wire  m_instr_awlock,
		output wire [3 : 0] m_instr_awcache,
		output wire [2 : 0] m_instr_awprot,
		output wire [3 : 0] m_instr_awqos,
		output wire [C_m_instr_AWUSER_WIDTH-1 : 0] m_instr_awuser,
		output wire  m_instr_awvalid,
		input wire  m_instr_awready,
		output wire [C_m_instr_DATA_WIDTH-1 : 0] m_instr_wdata,
		output wire [C_m_instr_DATA_WIDTH/8-1 : 0] m_instr_wstrb,
		output wire  m_instr_wlast,
		output wire [C_m_instr_WUSER_WIDTH-1 : 0] m_instr_wuser,
		output wire  m_instr_wvalid,
		input wire  m_instr_wready,
		input wire [C_m_instr_ID_WIDTH-1 : 0] m_instr_bid,
		input wire [1 : 0] m_instr_bresp,
		input wire [C_m_instr_BUSER_WIDTH-1 : 0] m_instr_buser,
		input wire  m_instr_bvalid,
		output wire  m_instr_bready,
		output wire [C_m_instr_ID_WIDTH-1 : 0] m_instr_arid,
		output wire [C_m_instr_ADDR_WIDTH-1 : 0] m_instr_araddr,
		output wire [7 : 0] m_instr_arlen,
		output wire [2 : 0] m_instr_arsize,
		output wire [1 : 0] m_instr_arburst,
		output wire  m_instr_arlock,
		output wire [3 : 0] m_instr_arcache,
		output wire [2 : 0] m_instr_arprot,
		output wire [3 : 0] m_instr_arqos,
		output wire [C_m_instr_ARUSER_WIDTH-1 : 0] m_instr_aruser,
		output wire  m_instr_arvalid,
		input wire  m_instr_arready,
		input wire [C_m_instr_ID_WIDTH-1 : 0] m_instr_rid,
		input wire [C_m_instr_DATA_WIDTH-1 : 0] m_instr_rdata,
		input wire [1 : 0] m_instr_rresp,
		input wire  m_instr_rlast,
		input wire [C_m_instr_RUSER_WIDTH-1 : 0] m_instr_ruser,
		input wire  m_instr_rvalid,
		output wire  m_instr_rready,

		// Ports of Axi Master Bus Interface m_data
		input wire  m_data_init_axi_txn,
		output wire  m_data_txn_done,
		output wire  m_data_error,
		input wire  m_data_aclk,
		input wire  m_data_aresetn,
		output wire [C_m_data_ID_WIDTH-1 : 0] m_data_awid,
		output wire [C_m_data_ADDR_WIDTH-1 : 0] m_data_awaddr,
		output wire [7 : 0] m_data_awlen,
		output wire [2 : 0] m_data_awsize,
		output wire [1 : 0] m_data_awburst,
		output wire  m_data_awlock,
		output wire [3 : 0] m_data_awcache,
		output wire [2 : 0] m_data_awprot,
		output wire [3 : 0] m_data_awqos,
		output wire [C_m_data_AWUSER_WIDTH-1 : 0] m_data_awuser,
		output wire  m_data_awvalid,
		input wire  m_data_awready,
		output wire [C_m_data_DATA_WIDTH-1 : 0] m_data_wdata,
		output wire [C_m_data_DATA_WIDTH/8-1 : 0] m_data_wstrb,
		output wire  m_data_wlast,
		output wire [C_m_data_WUSER_WIDTH-1 : 0] m_data_wuser,
		output wire  m_data_wvalid,
		input wire  m_data_wready,
		input wire [C_m_data_ID_WIDTH-1 : 0] m_data_bid,
		input wire [1 : 0] m_data_bresp,
		input wire [C_m_data_BUSER_WIDTH-1 : 0] m_data_buser,
		input wire  m_data_bvalid,
		output wire  m_data_bready,
		output wire [C_m_data_ID_WIDTH-1 : 0] m_data_arid,
		output wire [C_m_data_ADDR_WIDTH-1 : 0] m_data_araddr,
		output wire [7 : 0] m_data_arlen,
		output wire [2 : 0] m_data_arsize,
		output wire [1 : 0] m_data_arburst,
		output wire  m_data_arlock,
		output wire [3 : 0] m_data_arcache,
		output wire [2 : 0] m_data_arprot,
		output wire [3 : 0] m_data_arqos,
		output wire [C_m_data_ARUSER_WIDTH-1 : 0] m_data_aruser,
		output wire  m_data_arvalid,
		input wire  m_data_arready,
		input wire [C_m_data_ID_WIDTH-1 : 0] m_data_rid,
		input wire [C_m_data_DATA_WIDTH-1 : 0] m_data_rdata,
		input wire [1 : 0] m_data_rresp,
		input wire  m_data_rlast,
		input wire [C_m_data_RUSER_WIDTH-1 : 0] m_data_ruser,
		input wire  m_data_rvalid,
		output wire  m_data_rready
	);
// Instantiation of Axi Bus Interface m_instr
	core_wrapper_v1_0_m_instr # ( 
		.C_M_TARGET_SLAVE_BASE_ADDR(C_m_instr_TARGET_SLAVE_BASE_ADDR),
		.C_M_AXI_BURST_LEN(C_m_instr_BURST_LEN),
		.C_M_AXI_ID_WIDTH(C_m_instr_ID_WIDTH),
		.C_M_AXI_ADDR_WIDTH(C_m_instr_ADDR_WIDTH),
		.C_M_AXI_DATA_WIDTH(C_m_instr_DATA_WIDTH),
		.C_M_AXI_AWUSER_WIDTH(C_m_instr_AWUSER_WIDTH),
		.C_M_AXI_ARUSER_WIDTH(C_m_instr_ARUSER_WIDTH),
		.C_M_AXI_WUSER_WIDTH(C_m_instr_WUSER_WIDTH),
		.C_M_AXI_RUSER_WIDTH(C_m_instr_RUSER_WIDTH),
		.C_M_AXI_BUSER_WIDTH(C_m_instr_BUSER_WIDTH)
	) core_wrapper_v1_0_m_instr_inst (
		.INIT_AXI_TXN(m_instr_init_axi_txn),
		.TXN_DONE(m_instr_txn_done),
		.ERROR(m_instr_error),
		.M_AXI_ACLK(m_instr_aclk),
		.M_AXI_ARESETN(m_instr_aresetn),
		.M_AXI_AWID(m_instr_awid),
		.M_AXI_AWADDR(m_instr_awaddr),
		.M_AXI_AWLEN(m_instr_awlen),
		.M_AXI_AWSIZE(m_instr_awsize),
		.M_AXI_AWBURST(m_instr_awburst),
		.M_AXI_AWLOCK(m_instr_awlock),
		.M_AXI_AWCACHE(m_instr_awcache),
		.M_AXI_AWPROT(m_instr_awprot),
		.M_AXI_AWQOS(m_instr_awqos),
		.M_AXI_AWUSER(m_instr_awuser),
		.M_AXI_AWVALID(m_instr_awvalid),
		.M_AXI_AWREADY(m_instr_awready),
		.M_AXI_WDATA(m_instr_wdata),
		.M_AXI_WSTRB(m_instr_wstrb),
		.M_AXI_WLAST(m_instr_wlast),
		.M_AXI_WUSER(m_instr_wuser),
		.M_AXI_WVALID(m_instr_wvalid),
		.M_AXI_WREADY(m_instr_wready),
		.M_AXI_BID(m_instr_bid),
		.M_AXI_BRESP(m_instr_bresp),
		.M_AXI_BUSER(m_instr_buser),
		.M_AXI_BVALID(m_instr_bvalid),
		.M_AXI_BREADY(m_instr_bready),
		.M_AXI_ARID(m_instr_arid),
		.M_AXI_ARADDR(m_instr_araddr),
		.M_AXI_ARLEN(m_instr_arlen),
		.M_AXI_ARSIZE(m_instr_arsize),
		.M_AXI_ARBURST(m_instr_arburst),
		.M_AXI_ARLOCK(m_instr_arlock),
		.M_AXI_ARCACHE(m_instr_arcache),
		.M_AXI_ARPROT(m_instr_arprot),
		.M_AXI_ARQOS(m_instr_arqos),
		.M_AXI_ARUSER(m_instr_aruser),
		.M_AXI_ARVALID(m_instr_arvalid),
		.M_AXI_ARREADY(m_instr_arready),
		.M_AXI_RID(m_instr_rid),
		.M_AXI_RDATA(m_instr_rdata),
		.M_AXI_RRESP(m_instr_rresp),
		.M_AXI_RLAST(m_instr_rlast),
		.M_AXI_RUSER(m_instr_ruser),
		.M_AXI_RVALID(m_instr_rvalid),
		.M_AXI_RREADY(m_instr_rready)
	);

// Instantiation of Axi Bus Interface m_data
	core_wrapper_v1_0_m_data # ( 
		.C_M_TARGET_SLAVE_BASE_ADDR(C_m_data_TARGET_SLAVE_BASE_ADDR),
		.C_M_AXI_BURST_LEN(C_m_data_BURST_LEN),
		.C_M_AXI_ID_WIDTH(C_m_data_ID_WIDTH),
		.C_M_AXI_ADDR_WIDTH(C_m_data_ADDR_WIDTH),
		.C_M_AXI_DATA_WIDTH(C_m_data_DATA_WIDTH),
		.C_M_AXI_AWUSER_WIDTH(C_m_data_AWUSER_WIDTH),
		.C_M_AXI_ARUSER_WIDTH(C_m_data_ARUSER_WIDTH),
		.C_M_AXI_WUSER_WIDTH(C_m_data_WUSER_WIDTH),
		.C_M_AXI_RUSER_WIDTH(C_m_data_RUSER_WIDTH),
		.C_M_AXI_BUSER_WIDTH(C_m_data_BUSER_WIDTH)
	) core_wrapper_v1_0_m_data_inst (
		.INIT_AXI_TXN(m_data_init_axi_txn),
		.TXN_DONE(m_data_txn_done),
		.ERROR(m_data_error),
		.M_AXI_ACLK(m_data_aclk),
		.M_AXI_ARESETN(m_data_aresetn),
		.M_AXI_AWID(m_data_awid),
		.M_AXI_AWADDR(m_data_awaddr),
		.M_AXI_AWLEN(m_data_awlen),
		.M_AXI_AWSIZE(m_data_awsize),
		.M_AXI_AWBURST(m_data_awburst),
		.M_AXI_AWLOCK(m_data_awlock),
		.M_AXI_AWCACHE(m_data_awcache),
		.M_AXI_AWPROT(m_data_awprot),
		.M_AXI_AWQOS(m_data_awqos),
		.M_AXI_AWUSER(m_data_awuser),
		.M_AXI_AWVALID(m_data_awvalid),
		.M_AXI_AWREADY(m_data_awready),
		.M_AXI_WDATA(m_data_wdata),
		.M_AXI_WSTRB(m_data_wstrb),
		.M_AXI_WLAST(m_data_wlast),
		.M_AXI_WUSER(m_data_wuser),
		.M_AXI_WVALID(m_data_wvalid),
		.M_AXI_WREADY(m_data_wready),
		.M_AXI_BID(m_data_bid),
		.M_AXI_BRESP(m_data_bresp),
		.M_AXI_BUSER(m_data_buser),
		.M_AXI_BVALID(m_data_bvalid),
		.M_AXI_BREADY(m_data_bready),
		.M_AXI_ARID(m_data_arid),
		.M_AXI_ARADDR(m_data_araddr),
		.M_AXI_ARLEN(m_data_arlen),
		.M_AXI_ARSIZE(m_data_arsize),
		.M_AXI_ARBURST(m_data_arburst),
		.M_AXI_ARLOCK(m_data_arlock),
		.M_AXI_ARCACHE(m_data_arcache),
		.M_AXI_ARPROT(m_data_arprot),
		.M_AXI_ARQOS(m_data_arqos),
		.M_AXI_ARUSER(m_data_aruser),
		.M_AXI_ARVALID(m_data_arvalid),
		.M_AXI_ARREADY(m_data_arready),
		.M_AXI_RID(m_data_rid),
		.M_AXI_RDATA(m_data_rdata),
		.M_AXI_RRESP(m_data_rresp),
		.M_AXI_RLAST(m_data_rlast),
		.M_AXI_RUSER(m_data_ruser),
		.M_AXI_RVALID(m_data_rvalid),
		.M_AXI_RREADY(m_data_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
