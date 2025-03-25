`timescale 1ns / 1ps

module tb();
    logic [3:0] A, B;      // 4-bit inputs
    logic [3:0] Sum;      // 4-bit difference output
    logic Cout;            // Carry-out (borrow indicator)
    
    twos_complement_subtractor dut (
        .A(A),
        .B(B),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Test Cases Execution
    initial begin
        $monitor("Time=%0t | A=%b, B=%b | Sum=%b, Cout=%b", 
                 $time, A, B, Sum, Cout);

        // Test Cases
        A = 4'b0111; B = 4'b0101; #10;  // 7 - 5 = 2
        A = 4'b1010; B = 4'b0011; #10;  // 10 - 3 = 7
        A = 4'b0110; B = 4'b0111; #10;  // 6 - 7 = -1 
        A = 4'b1000; B = 4'b1000; #10;  // 8 - 8 = 0
        A = 4'b0101; B = 4'b0111; #10;  // 5 - 7 = -2 
        A = 4'b0010; B = 4'b0001; #10;  // 2 - 1 = 1
        A = 4'b0110; B = 4'b0011; #10;  // 6 - 3 = 3
        A = 4'b1001; B = 4'b0101; #10;  // 9 - 5 = 4
        A = 4'b0111; B = 4'b0011; #10;  // 7 - 3 = 4
        A = 4'b0100; B = 4'b0001; #10;  // 4 - 1 = 3
        A = 4'b1010; B = 4'b0011; #10;  // 10 - 3 = 7
        A = 4'b0110; B = 4'b0111; #10;  // 6 - 7 = -1 
        A = 4'b1000; B = 4'b1000; #10;  // 8 - 8 = 0
        A = 4'b0101; B = 4'b0111; #10;  // 5 - 7 = -2 
        A = 4'b0000; B = 4'b0001; #10;  // 0 - 1 = -1 
        A = 4'b0111; B = 4'b1001; #10;  // 7 - 9 = -2 
        A = 4'b1011; B = 4'b0100; #10;  // 11 - 4 = 7
        A = 4'b1100; B = 4'b0110; #10;  // 12 - 6 = 6

        // End simulation
        $finish;
    end
endmodule
