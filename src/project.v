/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_yourgithub_8bit_adder (
    input  wire [7:0] ui_in,    // Operand A
    output wire [7:0] uo_out,   // Sum output
    input  wire [7:0] uio_in,   // Operand B
    output wire [7:0] uio_out,  // Not used
    output wire [7:0] uio_oe,   // Not used
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

  assign { /* cout ignored */ , uo_out } = ui_in + uio_in;

  assign uio_out = 8'b0;
  assign uio_oe  = 8'b0;

  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
