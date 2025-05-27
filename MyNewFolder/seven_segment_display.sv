module seven_segment_display (
    input  logic [3:0] binary_in,     // 4-bit input digit (0 to 9)
    output logic [6:0] segments        // 7-segment output pattern
);

    always_comb begin
        case (binary_in)
            4'd0: segments = 7'b0111111;
            4'd1: segments = 7'b0000110;
            4'd2: segments = 7'b1011011;
            4'd3: segments = 7'b1001111;
            4'd4: segments = 7'b1100110;
            4'd5: segments = 7'b1101101;
            4'd6: segments = 7'b1111101;
            4'd7: segments = 7'b0000111;
            4'd8: segments = 7'b1111111;
            4'd9: segments = 7'b1101111;
            default: segments = 7'b0000000; // For invalid input
        endcase
    end

endmodule
