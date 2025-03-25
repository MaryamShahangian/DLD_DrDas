`timescale 1ns / 1ps
module tb();

    logic clk;          
    logic reset;        
    logic [3:0] count;  

    counter dut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );
    
     // Generate clock signal (50% duty cycle)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;  // Apply reset
        #20 reset = 0;  // Release reset
        #100 $finish;  // End simulation
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | Reset=%b | Count=%b", $time, reset, count);
    end
endmodule
