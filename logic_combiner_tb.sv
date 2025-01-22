`timescale 1ns / 1ps

module tb ();

   // Signal declarations
   logic  a;    // Input a
   logic  b;    // Input b
   logic  c;    // Input c
   logic  y;    // Output y
   logic  clk;  // Clock signal
   
   // Instantiate the Device Under Test (DUT)
   logic_combiner dut (
       .a(a),
       .b(b),
       .c(c),
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
        $monitor("Time: %0t | a = %b, b = %b, c = %b, y = %b", $time, a, b, c, y);
     end

   // Apply random values to the inputs
   initial
     begin
        // Initialize inputs to avoid unknown values
        a = 0; b = 0; c = 0;
        
        // Generate random values for 10 clock cycles
        repeat (10) begin
            @(posedge clk);
            a = $random;
            b = $random;
            c = $random;
        end

        $finish; // End the simulation
     end

endmodule
