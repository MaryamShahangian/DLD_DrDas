module traffic_light_controller (
    input logic clk,
    input logic reset,
    output logic [7:0] seg
);

    // Define states
    typedef enum logic [1:0] {
        GREEN  = 2'b00,
        YELLOW = 2'b01,
        RED    = 2'b10
    } state_t;

    // State register
    state_t current_state, next_state;

    // State transition logic (sequential)
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= GREEN; // Reset to Green state
        else
            current_state <= next_state;
    end

    // Next state logic (combinational)
    always_comb begin
        case (current_state)
            GREEN:  next_state = YELLOW;
            YELLOW: next_state = RED;
            RED:    next_state = GREEN;
            default: next_state = GREEN;
        endcase
    end

    // Output logic for 7-segment display
    always_comb begin
        case (current_state)
            GREEN:  seg = 8'b01110111; // 'G' on 7-segment
            YELLOW: seg = 8'b01110110; // 'Y' on 7-segment
            RED:    seg = 8'b00001110; // 'R' on 7-segment
            default: seg = 8'b00000000; // Off
        endcase
    end

endmodule