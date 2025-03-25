`timescale 1ns / 1ps

module tb();

    // Define test signals using SystemVerilog logic type
    logic [3:0] bcd;  // 4-bit input number (BCD)
    logic [6:0] seg;  // 7-Segment display output

    // Instantiate the module under test (DUT)
    SevenSegment dut (
        .bcd(bcd),
        .seg(seg)
    );

    // Test different input values
    initial begin
        $monitor("Time = %0t | bcd = %b | seg = %b", $time, bcd, seg);

        bcd = 4'b0000; #10; // Test number 0
        bcd = 4'b0001; #10; // Test number 1
        bcd = 4'b0010; #10; // Test number 2
        bcd = 4'b0011; #10; // Test number 3
        bcd = 4'b0100; #10; // Test number 4
        bcd = 4'b0101; #10; // Test number 5
        bcd = 4'b0110; #10; // Test number 6
        bcd = 4'b0111; #10; // Test number 7
        bcd = 4'b1000; #10; // Test number 8
        bcd = 4'b1001; #10; // Test number 9
        bcd = 4'b1010; #10; // Out-of-range value
        bcd = 4'b1111; #10; // Out-of-range value

        $finish; // End of simulation
    end

endmodule
