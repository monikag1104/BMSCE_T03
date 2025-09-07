# Testbench for 8-bit Parallel Adder

This is the testbench for the *8-bit Parallel Adder* Tiny Tapeout project.  
It uses [cocotb](https://docs.cocotb.org/en/stable/) to drive the DUT and check the outputs.

## Design Name
8-bit Parallel Adder

## Working
The design implements an 8-bit parallel adder built using full-adder modules.  
- Inputs: two 8-bit numbers (x, y) and a carry-in (cin).  
- Outputs: an 8-bit sum (sum) and a carry-out (cout).  
- The addition is performed bit by bit with carry propagation across all stages.  

## Waveform
After running the simulation, you can open the generated tb.vcd file to observe:  
- Input signals (x, y, cin).  
- Output signals (sum, cout).  
- Carry propagation across the stages.  

Example command:
```sh
gtkwave tb.vcd tb.gtkw



### Block diagram 

+-------------------------------------+
       |          8-bit Parallel Adder        |
       |                                     |
  x[7:0] --->|                             |---> sum[7:0]
  y[7:0] --->|     Full Adder Chain         |
   cin  --->|  (stage0 ... stage7)          |---> cout
       +-------------------------------------+


#### io's
| Pin Type | Name              | Width | Description                            |
| -------- | ----------------- | ----- | -------------------------------------- |
| Input    | ui_in           | 8     | First 8-bit operand (x)                |
| Input    | uio_in          | 8     | Second 8-bit operand (y)               |
| Input    | cin             | 1     | Carry-in (from ui_in[0])             |
| Output   | uo_out          | 8     | 8-bit sum result                       |
| Output   | cout            | 1     | Final carry-out (from MSB)             |
| Others   | ena, clk, rst_n | 1     | Control/test signals (unused in logic) |


##### Setting up

1. Edit [Makefile](Makefile) and modify `PROJECT_SOURCES` to point to your Verilog files.
2. Edit [tb.v](tb.v) and replace `tt_um_example` with your module name.

###### How to run

To run the RTL simulation:

```sh
make -B
```

To run gatelevel simulation, first harden your project and copy '../runs/wokwi/results/final/verilog/gl/adder.v 'to 'gate_level_netlist.v.'

Then run:

```sh
make -B GATES=yes
```

####### How to view the VCD file

Using GTKWave
```sh
gtkwave tb.vcd tb.gtkw
```

Using Surfer
```sh
surfer tb.vcd
```
