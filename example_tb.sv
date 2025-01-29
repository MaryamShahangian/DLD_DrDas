`timescale 1ns / 1ps
module tb ();

   // Signal declarations
   logic  a;    // Input a
   logic  b;    // Input b
   logic  c;    // Input c
   logic  y;    // Output y
   
   // Instantiate the Device Under Test (DUT)
   example dut (
       .a(a),
       .b(b),
       .c(c),
       .y(y)
   );

   // Generate waveform to match the simulation output
   initial
     begin
        // Initialize inputs
        a = 0; b = 0; c = 0;

        // Generate a waveform that matches the given output
        #10 c = 1;  
        #20 b = 1; c = 0;  
        #10 c = 1;  
        #20 a = 1; b = 0; c = 0;  
        #10 c = 1;  
        #20 b = 1; c = 0;  
        #10 c = 1;  

        // End simulation
        #20;
        $finish;
     end

   // Monitor outputs
   initial
     begin
        $monitor("Time=%0t | a=%b | b=%b | c=%b | y=%b", $time, a, b, c, y);
     end

endmodule
