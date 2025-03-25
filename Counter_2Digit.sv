module Counter_2Digit (
    input logic clk,       // Clock signal
    input logic reset,     // Reset signal
    output logic [3:0] ones, // One's place (0-9)
    output logic [3:0] tens  // Ten's place (0-9)
);

logic [6:0] count; // 7-bit counter (0 to 99)

// Counter logic: increments every clock cycle
always_ff @(posedge clk or posedge reset) begin
    if (reset)
        count <= 7'b0000000;  // Reset to 0
    else if (count == 7'b1100011) // 99 in decimal (binary 99)
        count <= 7'b0000000;  // Restart at 0
    else
        count <= count + 1;
end

// Extract ones and tens place from count
assign ones = count % 10; // Modulo 10 to get the ones digit
assign tens = count / 10; // Divide by 10 to get the tens digit

endmodule
