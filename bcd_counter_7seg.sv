module bcd_counter_7seg (
    input logic clk,
    input logic reset,
    output logic [3:0] bcd,      // 4-bit BCD output (0 to 9)
    output logic [6:0] seg       // 7-segment output
);

    // BCD counter: counts from 0 to 9 and then resets to 0
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            bcd <= 4'd0;
        else if (bcd == 4'd9)
            bcd <= 4'd0;
        else
            bcd <= bcd + 1;
    end

    // Convert BCD value to 7-segment pattern using case
    always_comb begin
        case (bcd)
            4'd0: seg = 7'b1111110; // 0
            4'd1: seg = 7'b0110000; // 1
            4'd2: seg = 7'b1101101; // 2
            4'd3: seg = 7'b1111001; // 3
            4'd4: seg = 7'b0110011; // 4
            4'd5: seg = 7'b1011011; // 5
            4'd6: seg = 7'b1011111; // 6
            4'd7: seg = 7'b1110000; // 7
            4'd8: seg = 7'b1111111; // 8
            4'd9: seg = 7'b1111011; // 9
            default: seg = 7'b0000000; // off
        endcase
    end

endmodule
