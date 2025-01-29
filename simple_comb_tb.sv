`timescale 1ns / 1ps

module tb ();

   // Signal declarations
   logic  a;    // Input a
   logic  b;    // Input b
   logic  c;    // Input c
   logic  y;    // Output y
   
   // Instantiate the Device Under Test (DUT)
   simple_comb dut (
       .a(a),
       .b(b),
       .c(c),
       .y(y)
   );

   // Monitor signal values
   initial 
     begin
        $monitor("Time: %0t | a = %b, b = %b, c = %b, y = %b", $time, a, b, c, y);
     end

   // Apply all combinations of inputs to test the combinational circuit
   initial
     begin
        // Initialize inputs
        a = 0; b = 0; c = 0;

        // Apply all input combinations with delays
        #10 a = 0; b = 0; c = 0;  // Case 1
        #10 a = 0; b = 0; c = 1;  // Case 2
        #10 a = 0; b = 1; c = 0;  // Case 3
        #10 a = 0; b = 1; c = 1;  // Case 4
        #10 a = 1; b = 0; c = 0;  // Case 5
        #10 a = 1; b = 0; c = 1;  // Case 6
        #10 a = 1; b = 1; c = 0;  // Case 7
        #10 a = 1; b = 1; c = 1;  // Case 8

        // End simulation
        #10;
        $finish;
     end

endmodule
