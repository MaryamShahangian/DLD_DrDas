`timescale 1ns / 1ps
module tb();
    logic clk;
    logic reset;
    logic [3:0] ones;
    logic [3:0] tens;

    // Instantiate the module under test
    Counter_2Digit uut (
        .clk(clk),
        .reset(reset),
        .ones(ones),
        .tens(tens)
    );

    // Generate clock signal
    always #5 clk = ~clk; // Toggle clock every 5ns

    initial begin
        $monitor("Time = %0t | Reset = %b | Tens = %d | Ones = %d", 
                 $time, reset, tens, ones);
        
        clk = 0; reset = 1; #10; // Apply reset
        reset = 0; #1000; // Let the counter run for a while
        
        $finish; // End simulation
    end

endmodule

    
    