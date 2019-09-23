`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 02/22/2019 05:32:31 PM
// Design Name: 
// Module Name: axi_interface
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:
// Creates an interface for an AXI bus
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

import axi_defines::*;

interface axi_inf #();

  aw_t aw;
  ar_t ar;
  w_t w;
  r_t r;
  b_t b;
  logic awready;
  logic arready;
  logic rready;
  logic wready;
  logic bready;

  modport master (
    input r,
    input b,
    input arready,
    input awready,
    input wready,
    output aw,
    output ar,
    output w,
    output rready,
    output bready
  );

  modport slave (
    input aw,
    input ar,
    input w,
    input rready,
    input bready,
    output r,
    output b,
    output arready,
    output awready,
    output wready
  );
endinterface : axi_inf
