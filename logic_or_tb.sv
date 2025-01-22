`timescale 1ns / 1ps
module tb ();

   // Declare signals
   logic a;  // Input a
   logic b;  // Input b
   logic y;  // Output y
   logic        clk; 

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
    
	#20  a = $random;	
	#0   b = $random;	

	#10  a = $random;	
	#0   b = $random;	

	#20  a = $random;	
	#0   b = $random;	

	#20  a = $random;	
	#0   b = $random;	

	#10  a = $random;	
	#0   b = $random;	

	#20  a = $random;	
	#0   b = $random;		

	#20  a = $random;	
	#0   b = $random;	

	#30  a = $random;	
	#0   b = $random;	

	#20  a = $random;	
	#0   b = $random;	

	#20  a = $random;	
	#0   b = $random;	

	#30  a = $random;	
	#0   b = $random;		
	
     end

   
endmodule
