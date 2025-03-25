module twos_complement_subtractor (
    input  logic [3:0] A,
    input  logic [3:0] B,  
    output logic [3:0] Sum,  
    output logic Cout         
);

    // Internal Signals (NOT in module ports)
    logic [3:0] B_complement;  // 2s complement of B

    // Step 1: Compute Twos Complement of B (Invert B and Add 1)
    assign B_complement = ~B + 4'b0001;

    // Step 2: Perform Addition of A and -B (B_complement)
    assign {Cout, Sum} = A + B_complement;


endmodule
