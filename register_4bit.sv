module register_4bit (
    input logic clk,        // Clock signal
    input logic [3:0] D,    // 4-bit input
    output logic [3:0] Q    // 4-bit output
);
    always_ff @(posedge clk)
        Q <= D;  // Store the 4-bit value on the rising edge of the clock
endmodule
