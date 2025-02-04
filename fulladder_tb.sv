`timescale 1ns / 1ps

module tb();

    // Input and Output Variables
    logic a, b, c;   // Inputs
    logic s, cout;   // Outputs

    // Instantiating the Full Adder module
    fulladder dut (
        .a(a),
        .b(b),
        .c(c),
        .s(s),
        .cout(cout)
    );

    // Displaying signal values during execution
    initial begin
        $monitor("Time: %0t | a = %b, b = %b, c = %b | s = %b, cout = %b",
                 $time, a, b, c, s, cout);
    end

    // Applying all possible input combinations
    initial begin
        a = 0; b = 0; c = 0; #10;
        a = 0; b = 0; c = 1; #10;
        a = 0; b = 1; c = 0; #10;
        a = 0; b = 1; c = 1; #10;
        a = 1; b = 0; c = 0; #10;
        a = 1; b = 0; c = 1; #10;
        a = 1; b = 1; c = 0; #10;
        a = 1; b = 1; c = 1; #10;

        // End of simulation
        $finish;
    end

endmodule
