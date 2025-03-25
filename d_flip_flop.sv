module d_flip_flop (
    input logic clk, 
    input logic D, 
    output logic Q
);
    always_ff @(posedge clk) 
        Q <= D; 
endmodule
