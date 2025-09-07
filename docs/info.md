<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project implements an 8-bit parallel adder using a chain of *full adder modules*.
Each full adder takes two input bits (x[i] and y[i]) and a carry-in, producing a sum bit and a carry-out.
The carry-out from each stage is connected to the next stage, allowing proper carry propagation across all 8 bits.
The final result is an 8-bit sum along with a carry-out.
This is a combinational circuit (no clock required).


## How to test

1. Compile the design* using the provided Makefile:
   bash
   make
   This runs iverilog to compile src/adder.v and tb/adder_tb.v.
2. Run the simulation:
   bash
   vvp adder_tb.vvp
3. View the waveform:
   bash
   gtkwave waves.vcd
4. The testbench (adder_tb.v) already includes several test cases, such as:
   12 + 7 without carry-in
   240 + 15 + 1 with carry-in  
   Alternating bit patterns (10101010 + 01010101)
   Overflow case (255 + 1)


## External hardware

This project does not require any external hardware.

It is designed to run purely in simulation.
On Tiny Tapeout silicon, the inputs can be provided via GPIOs, and the sum/carry will appear on output pins.

