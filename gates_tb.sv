
`timescale 1ns / 1ps
module tb ();

    // Signal declarations
    logic [3:0] a, b;   // 4-bit input buses
    logic [3:0] y1, y2, y3, y4, y5;  // 4-bit output buses

    // Instantiate the Device Under Test (DUT)
    gates dut (
        .a(a),
        .b(b),
        .y1(y1),
        .y2(y2),
        .y3(y3),
        .y4(y4),
        .y5(y5)
    );

    // Monitor signal values
    initial begin
        $monitor("Time: %0t | a = %b, b = %b | y1(AND) = %b, y2(OR) = %b, y3(XOR) = %b, y4(NAND) = %b, y5(NOR) = %b",
                 $time, a, b, y1, y2, y3, y4, y5);
    end

    // Apply different test cases
    initial begin
        // Initialize inputs
        a = 4'b0000; b = 4'b0000; #10;
        a = 4'b0001; b = 4'b0011; #10;
        a = 4'b0101; b = 4'b1010; #10;
        a = 4'b1100; b = 4'b1010; #10;
        a = 4'b1111; b = 4'b1111; #10;

        // End simulation
        #10;
        $finish;
    end

endmodule
