`timescale 1ns / 1ps

module tb ();

   // Signal declarations
   logic  a;    // Input a
   logic  b;    // Input b
   logic  y;    // Output y
   logic  clk;  // Clock signal
   
   // Instantiate the Device Under Test (DUT)
   logic_and dut (
       .a(a),
       .b(b),
       .y(y)
   );

   // Generate a 2 ns clock signal
   initial 
     begin	
        clk = 1'b1;
        forever #10 clk = ~clk;  // Clock period = 20 ns
     end

   // Monitor signal values
   initial 
     begin
        $monitor("Time: %0t | a = %b, b = %b, y = %b", $time, a, b, y);
     end

   // Apply all combinations of inputs to test the AND gate
   initial
     begin
        // Initialize inputs
        a = 0; b = 0;

        // Test all possible combinations of a and b
        @(posedge clk) a = 0; b = 0;  // Case 1: a = 0, b = 0
        @(posedge clk) a = 0; b = 1;  // Case 2: a = 0, b = 1
        @(posedge clk) a = 1; b = 0;  // Case 3: a = 1, b = 0
        @(posedge clk) a = 1; b = 1;  // Case 4: a = 1, b = 1

        // End simulation
        @(posedge clk);
        $finish;
     end

endmodule
