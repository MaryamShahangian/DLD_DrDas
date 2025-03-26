`timescale 1ns/1ps
module tb();

    // Testbench signals
    logic clk;
    logic reset;
    logic [7:0] seg;

    // Instantiate the DUT (Device Under Test)
    traffic_light_controller dut (
        .clk(clk),
        .reset(reset),
        .seg(seg)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period (100 MHz clock)
    end

    // Test procedure
    initial begin
        // Initialize signals
        reset = 1;
        #10; // Hold reset for 10ns
        reset = 0;

        // Monitor the output for 5 cycles (50ns, since each state lasts 10ns)
        $monitor("Time=%0t | Reset=%b | Seg=%b (State: %s)", 
                 $time, reset, seg, 
                 (seg == 8'b01110111) ? "GREEN" : 
                 (seg == 8'b01110110) ? "YELLOW" : 
                 (seg == 8'b00001110) ? "RED" : "UNKNOWN");

        #50; // Run for 5 cycles (10ns per cycle)
        $finish;
    end

endmodule