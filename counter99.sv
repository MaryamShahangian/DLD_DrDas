module counter99 (
    input logic clk,
    input logic reset,
    output logic [6:0] count // 7-bit counter to count up to 99
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            count <= 7'b0000000; // Reset to 0
        else if (count >= 7'd99) // Reset at 99
            count <= 7'b0000000;
        else
            count <= count + 7'd1; // Ensure full 7-bit addition
    end
endmodule
