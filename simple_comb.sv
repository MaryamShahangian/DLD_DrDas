module simple_comb(
    input logic a,
    input logic b,
    input logic c,
    output logic y
);

// logical operation: a + (b * ~c)
assign y = a | (b & ~c); // OR, AND, and NOT operations

endmodule


