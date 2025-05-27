`timescale 1ns / 1ps
module tb ();

    // Testbench variables
    logic clk, reset, start, stop;
    logic [7:0] fuel_amount;
    
    // Instantiate the fuel_counter module
    fuel_counter dut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .stop(stop),
        .fuel_amount(fuel_amount)
    );

    // Clock generation
    always #5 clk = ~clk; // Clock period: 10 nanoseconds

    initial begin
        // Initial values
        clk = 0;
        reset = 1;
        start = 0;
        stop = 0;
        
        // Keep reset active
        #10 reset = 0; // Deactivate reset after 10ns
        
        // Start fuel counting
        #10 start = 1;
        #50 stop = 1;  // Stop after 50ns
        
        // Test stop and restart behavior
        #20 stop = 0;
        #30 start = 0;
        
        // End of simulation
        #50 $finish;
    end

    // Monitor signal values
    initial begin
        $monitor("Time=%0t | Reset=%b | Start=%b | Stop=%b | Fuel=%d", 
                 $time, reset, start, stop, fuel_amount);
    end

endmodule
