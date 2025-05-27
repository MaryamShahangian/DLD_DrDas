module fuel_counter (
    input  logic       clk,
    input  logic       reset,
    input  logic       start,
    input  logic       stop,
    output logic [7:0] fuel_amount
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            fuel_amount <= 8'd0;
        else if (start && !stop)
            fuel_amount <= fuel_amount + 1;
    end

endmodule
