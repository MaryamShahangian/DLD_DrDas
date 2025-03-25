module full_adder (
    input  logic a, b, cin,
    output logic sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule


module FA_Sub_4bit (
    input  logic signed [3:0] A, B,  // Signed 4-bit inputs
    input  logic cin,  // Controls addition/subtraction
    output logic signed [3:0] S,  // Signed result
    output logic cout,
    output logic overflow
);
    logic C0, C1, C2, C3; // Carry signals
    logic signed [3:0] B_xor; // XORed B values

    // XOR B with cin for Two's Complement Subtraction
    assign B_xor = B ^ {4{cin}}; // cin = 0 → B stays same, cin = 1 → B is inverted

    // Full Adder Instances
    full_adder FA0 (.a(A[0]), .b(B_xor[0]), .cin(cin), .sum(S[0]), .cout(C0));
    full_adder FA1 (.a(A[1]), .b(B_xor[1]), .cin(C0), .sum(S[1]), .cout(C1));
    full_adder FA2 (.a(A[2]), .b(B_xor[2]), .cin(C1), .sum(S[2]), .cout(C2));
    full_adder FA3 (.a(A[3]), .b(B_xor[3]), .cin(C2), .sum(S[3]), .cout(C3));

    // Final Carry Out
    assign cout = C3;

    // Overflow Detection (C3 XOR C2)
    assign overflow = C3 ^ C2;

endmodule
