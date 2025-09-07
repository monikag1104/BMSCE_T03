// Testbench for 8-bit Parallel Adder
// Using Icarus Verilog + cocotb compatibility

`timescale 1ns / 1ps
`default_nettype none

module adder_tb;

    // Testbench signals
    reg  [7:0] x, y;
    reg        cin;
    wire [7:0] sum;
    wire       cout;

    // DUT instantiation
    adder dut (
        .x(x),
        .y(y),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Dump file for GTKWave
    initial begin
        $dumpfile("waves.vcd");
        $dumpvars(0, adder_tb);
    end

    // Stimulus
    initial begin
        // Test 1: 12 + 7
        x = 8'b00001100; y = 8'b00000111; cin = 1'b0;
        #15;

        // Test 2: 240 + 15 + carry-in
        x = 8'b11110000; y = 8'b00001111; cin = 1'b1;
        #15;

        // Test 3: Alternating pattern
        x = 8'b10101010; y = 8'b01010101; cin = 1'b0;
        #15;

        // Test 4: Overflow case
        x = 8'b11111111; y = 8'b00000001; cin = 1'b0;
        #15;

        $finish;
    end

endmodule
