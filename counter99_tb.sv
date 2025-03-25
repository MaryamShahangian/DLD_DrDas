`timescale 1ns / 1ps
module tb();

    logic clk;          
    logic reset;        
    logic [6:0] count;  

    counter99 dut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );
    
    // Generate clock signal (50% duty cycle)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;  // Apply reset
        #10 reset = 0;  // Release reset
        #1000 $finish;  // Extend time to ensure full range is tested
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | Reset=%b | Count=%d", $time, reset, count);
    end
endmodule
