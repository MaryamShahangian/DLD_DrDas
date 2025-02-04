`timescale 1ns / 1ps
module tb();

    // Input and Output Variables
    logic a, b;       // Inputs
    logic sum, carry; // Outputs

    // Instantiate the Half Adder module
    halfadder dut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    // Monitor signal values during execution
    initial begin
        $monitor("Time: %0t | a = %b, b = %b | sum = %b, carry = %b",
                 $time, a, b, sum, carry);
    end

    // Apply all possible input combinations
    initial begin
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        // End of simulation
        $finish;
    end

endmodule
