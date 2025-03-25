`timescale 1ns / 1ps

module tb();
    logic signed [3:0] A, B, B_xor;  // Changed to signed
    logic cin;
    logic signed [3:0] S;  // Changed to signed
    logic cout, overflow;

    // Instantiate the Signed 4-bit Full Adder/Subtractor
    FA_Sub_4bit dut (
        .A(A),
        .B(B),
        .cin(cin),
        .S(S),
        .cout(cout),
        .overflow(overflow)
    );

    // Capture the internal B_xor signal
    assign B_xor = B ^ {4{cin}};  // Corrected to 4-bit width

    // Test process
    initial begin
        $display("Time | A   | B   | Cin | B_xor | S   | Cout | Overflow");
        $monitor("%4t | %d | %d |  %b  |  %d   | %d |  %b   |  %b", 
         $time, $signed(A), $signed(B), cin, $signed(B_xor), $signed(S), cout, overflow);


        // Test Addition Cases (Signed)
        A = 4'sb0011; B = 4'sb0100; cin = 0; #10; // 3 + 4 = 7 (No Overflow)
        A = 4'sb0010; B = 4'sb0101; cin = 0; #10; 
        A = 4'sb0011; B = 4'sb0001; cin = 0; #10; // 3 + 1 = 4 (No Overflow)
        A = 4'sb1001; B = 4'sb1001; cin = 0; #10; // -7 + (-7) = -14 (Overflow)
        A = 4'sb0100; B = 4'sb0101; cin = 0; #10; // 4 + 5 = 9 (Overflow)

        // Test Subtraction Cases (Signed)
        A = 4'sb1010; B = 4'sb0110; cin = 1; #10; // -6 - 2 = -8 (No Overflow)
        A = 4'sb0001; B = 4'sb1011; cin = 1; #10; // 1 - (-5) = 6 (No Overflow)
        A = 4'sb0011; B = 4'sb1010; cin = 1; #10; // 3 - (-6) = 9 (Overflow)
        A = 4'sb0111; B = 4'sb1000; cin = 1; #10; // 7 - (-8) = 15 (Overflow)
        A = 4'sb1000; B = 4'sb0111; cin = 1; #10; // -8 - 7 = -15 (Overflow)
        A = 4'sb0110; B = 4'sb1011; cin = 1; #10; // 6 - (-5) = 11 (Overflow)

        $finish; // End simulation
    end
endmodule
