module BCD_to_7Segment (
    input logic [3:0] bcd,   // 4-bit BCD input (0 to 9)
    output logic [6:0] seg   // 7-Segment output
);

always_comb begin
    case (bcd)
        4'b0000: seg = 7'b1111110; // 0
        4'b0001: seg = 7'b0110000; // 1
        4'b0010: seg = 7'b1101101; // 2
        4'b0011: seg = 7'b1111001; // 3
        4'b0100: seg = 7'b0110011; // 4
        4'b0101: seg = 7'b1011011; // 5
        4'b0110: seg = 7'b1011111; // 6
        4'b0111: seg = 7'b1110000; // 7
        4'b1000: seg = 7'b1111111; // 8
        4'b1001: seg = 7'b1111011; // 9
        default: seg = 7'b0000000; // Turn off display
    endcase
end

endmodule
