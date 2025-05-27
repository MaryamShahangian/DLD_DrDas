module fuel_fsm (
    input  logic clk,
    input  logic reset,
    input  logic start,
    input  logic [7:0] final_cost,
    output logic [6:0] seg_digit1,  // One’s place (LSB)
    output logic [6:0] seg_digit2,  // Ten’s place (MSB)
    output logic done
);

    typedef enum logic [1:0] {
        IDLE,
        COUNTING,
        DONE
    } state_t;

    state_t state, next_state;
    logic [7:0] current_value;
    logic [3:0] ones, tens;

    // FSM: current state
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // FSM: next state logic
    always_comb begin
        case (state)
            IDLE:      next_state = (start) ? COUNTING : IDLE;
            COUNTING:  next_state = (current_value == final_cost) ? DONE : COUNTING;
            DONE:      next_state = IDLE;
            default:   next_state = IDLE;
        endcase
    end

    // Counter logic and done flag
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_value <= 0;
            done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    current_value <= 0;
                    done <= 0;
                end
                COUNTING: begin
                    if (current_value < final_cost)
                        current_value <= current_value + 1;
                end
                DONE: begin
                    done <= 1;
                end
            endcase
        end
    end

    // Digit separation
    assign ones = current_value % 10;
    assign tens = current_value / 10;

    // 7-segment encoder
    function logic [6:0] seg7(input logic [3:0] digit);
        case (digit)
            4'd0: seg7 = 7'b0111111;
            4'd1: seg7 = 7'b0000110;
            4'd2: seg7 = 7'b1011011;
            4'd3: seg7 = 7'b1001111;
            4'd4: seg7 = 7'b1100110;
            4'd5: seg7 = 7'b1101101;
            4'd6: seg7 = 7'b1111101;
            4'd7: seg7 = 7'b0000111;
            4'd8: seg7 = 7'b1111111;
            4'd9: seg7 = 7'b1101111;
            default: seg7 = 7'b0000000;
        endcase
    endfunction

    // Assign segment outputs
    always_comb begin
        seg_digit1 = seg7(ones);
        seg_digit2 = seg7(tens);
    end

endmodule

