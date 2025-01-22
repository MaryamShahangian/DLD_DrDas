module logic_combiner(input logic a, b, c, output logic y);

    assign y = a + (b & c); // y = a + b.c
    
endmodule
