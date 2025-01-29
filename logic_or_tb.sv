`timescale 1ns / 1ps
module tb ();

   // Declare signals
   logic a;  // Input a
   logic b;  // Input b
   logic y;  // Output y
   logic clk; 

   // Instantiate the Device Under Test (DUT)
   logic_or dut (
       .a(a),
       .b(b),
       .y(y)
   );

   // 2 ns clock
   initial 
     begin	
        clk = 1'b1;
        forever #10 clk = ~clk;
     end

   initial
     begin
        // Apply fixed values instead of random
        #10  a = 0; b = 0;  // Expected y = 0
        #10  a = 0; b = 1;  // Expected y = 1
        #10  a = 1; b = 0;  // Expected y = 1
        #10  a = 1; b = 1;  // Expected y = 1
        #10  a = 0; b = 0;  // Expected y = 0
        #10  a = 1; b = 1;  // Expected y = 1

        // End simulation
        #20;
        $finish;
     end

   // Monitor outputs
   initial 
     begin
        $monitor("Time: %0t | a = %b, b = %b, y = %b", $time, a, b, y);
     end

endmodule
