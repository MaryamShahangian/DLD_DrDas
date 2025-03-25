`timescale 1ns / 1ps
module tb();
    logic clk;
    logic reset;
    logic [3:0] bcd;
    logic [6:0] seg;

    // Instantiate the counter module
    bcd_counter_7seg dut (
        .clk(clk),
        .reset(reset),
        .bcd(bcd),
        .seg(seg)
    );

    // Clock generation: 10 ns period (100 MHz)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;

        // Let it run long enough to observe a full cycle (0 to 9)
        #200 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time = %0t ns | BCD = %0d | 7-Segment = %b", $time, bcd, seg);
    end

endmodule
    