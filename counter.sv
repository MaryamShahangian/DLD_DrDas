module counter (
    input logic clk,         // Clock signal
    input logic reset,       // Active-high reset signal
    output logic [3:0] count // 4-bit counter output
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset) 
            count <= 4'b0000; // Reset counter to 0
        else 
            count <= count + 1; // Increment counter
    end

endmodule
