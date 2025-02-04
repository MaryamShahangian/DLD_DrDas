module halfadder(
    input  logic a, b,   // 1-bit inputs
    output logic sum,    // 1-bit sum output
    output logic carry   // 1-bit carry output
);

    // Sum is XOR of inputs
    assign sum = a ^ b;

    // Carry is AND of inputs
    assign carry = a & b;

endmodule
