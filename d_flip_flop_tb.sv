`timescale 1ns / 1ps
module tb ();

      logic clk, D;      // Test signals
      logic Q;           // Flip-flop output
  
      // Instantiating the D flip-flop
      d_flip_flop uut (
          .clk(clk),
          .D(D),
          .Q(Q)
      );
  
      // Generating the clock signal (Period: 10 time units)
      always #5 clk = ~clk;
  
      initial begin
          // Initial values of signals
          clk = 0;
          D = 0;
  
          // Testing D value changes at different clock edges
          #7  D = 1;  // Changing the value of D
          #10 D = 0;  // Changing D again
          #10 D = 1;
          #15 D = 0;
          #6 D = 1;
          #10 D = 1;
          #10 D = 0;
  
          #20 $finish;  // End of simulation
      end
  
      // Display values during simulation
      initial begin
          $monitor("Time=%0t | D=%b | Q=%b", $time, D, Q);
      end
  endmodule
  