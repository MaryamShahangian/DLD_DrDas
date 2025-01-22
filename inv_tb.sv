
`timescale 1ns / 1ps
module tb ();

   logic a;  // Input to DUT
   logic y;  // Output from DUT

   // Instantiate the Device Under Test (DUT)
   inv dut (
       .a(a),
       .y(y)
   );

   // Test vectors
   initial begin
      // Case 1: a = 0
      a = 0;
      #10; // Wait for 10 time units
      if (y !== 1)
         $display("Error: For a = 0, y = %b (expected 1)", y);
      else
         $display("Pass: For a = 0, y = %b", y);

      // Case 2: a = 1
      a = 1;
      #10; // Wait for 10 time units
      if (y !== 0)
         $display("Error: For a = 1, y = %b (expected 0)", y);
      else
         $display("Pass: For a = 1, y = %b", y);

      $finish; // End simulation
   end

endmodule

