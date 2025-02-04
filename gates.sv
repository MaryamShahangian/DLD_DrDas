module gates(
    input  logic [3:0] a, b,
    output logic [3:0] y1, y2, y3, y4, y5
);

/* Five different two-input logic
   gates acting on 4-bit buses */

assign y1 = a & b;   // AND operation
assign y2 = a | b;   // OR operation
assign y3 = a ^ b;   // XOR operation
assign y4 = ~(a & b); // NAND operation
assign y5 = ~(a | b); // NOR operation

endmodule
