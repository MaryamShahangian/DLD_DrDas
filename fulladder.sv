module fulladder(
    input  logic a, b, c,
    output logic s, cout
);

    // Sum calculation using XOR
    assign s = a ^ b ^ c;

    // Carry-out calculation using AND & OR gates
    assign cout = (a & b) | (a & c) | (b & c);

endmodule



