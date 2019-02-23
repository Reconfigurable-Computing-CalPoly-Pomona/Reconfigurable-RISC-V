//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ben Kueffler
// 
// Create Date: 02/17/2019 04:19:47 PM
// Design Name: 
// Module Name: axi_pkg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Contains types defined for the AXI 4 Protocol
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

package axi_defines;

  // Defines the burst type
  typedef enum logic [1:0] {
    FIXED = 0,
    INCR = 1,
    WRAP = 2
  } burst_t;

  // Defines the response type
  typedef enum logic [1:0] {
    OKAY = 0,
    EXOKAY = 1,
    SLVERR = 2,
    DECERR = 3
  } resp_t;

  // Defines the AW channel type
  typedef struct packed {
    logic valid;
    burst_t burst;
    logic [2:0] size;
    logic [7:0] len;
    logic [31:0] addr;
  } aw_t;

  // Defines the AR channel type
  typedef struct packed {
    logic valid;
    burst_t burst;
    logic [2:0] size;
    logic [7:0] len;
    logic [31:0] addr;
  } ar_t;

  // Defines the W channel type
  typedef struct packed {
    logic valid;
    logic last;
    logic [7:0] strb;
    logic [31:0] data;
  } w_t;

  // Defines the R channel type
  typedef struct packed {
    logic valid;
    logic last;
    logic [7:0] strb;
    logic [31:0] data;
  } r_t;

  // Defines the B channel type
  typedef struct packed {
    logic valid;
    resp_t resp;
  } b_t;

endpackage : axi_defines
