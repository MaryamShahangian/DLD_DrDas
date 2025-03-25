`timescale 1ns / 1ps
module tb ();

        logic clk;                  // Clock signal
        logic [3:0] D;              // 4-bit input data
        logic [3:0] Q;              // 4-bit output data
    
        // Instantiate the 4-bit register
        register_4bit dut (
            .clk(clk),
            .D(D),
            .Q(Q)
        );
    
        // Clock generation (10-time-unit period)
        always #5 clk = ~clk;
    
        initial begin
            // Initialize signals
            clk = 0;
            D = 4'b0000;    // Initial input value
            
            // Apply test values to D at different times
            #7  D = 4'b1010; // Apply 1010
            #10 D = 4'b1111; // Apply 1111
            #10 D = 4'b0101; // Apply 0101
            #10 D = 4'b0011; // Apply 0011
            #10 D = 4'b1000; // Apply 1000
            #10 D = 4'b0001; // Apply 0001
    
            #20 $finish; // End simulation
        end
    
        // Monitor and display values during simulation
        initial begin
            $monitor("Time=%0t | D=%b | Q=%b", $time, D, Q);
        end
    endmodule
    