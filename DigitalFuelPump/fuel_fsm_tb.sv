`timescale 1ns / 1ps

module tb();

    logic clk, reset, start;
    logic [7:0] final_cost;
    logic [6:0] seg_digit1, seg_digit2;
    logic done;

    // Instantiate your FSM module
    fuel_fsm dut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .final_cost(final_cost),
        .seg_digit1(seg_digit1),
        .seg_digit2(seg_digit2),
        .done(done)
    );

    // Clock generation: 10ns period (100 MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        start = 0;
        final_cost = 8'd25; // we want to display from 0 to 25

        // Apply reset
        #20 reset = 0;

        // Start display
        #10 start = 1;
        #10 start = 0;

        // Wait until done
        wait (done == 1);
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | Reset=%b | Start=%b | FinalCost=%0d | Seg1=%b | Seg2=%b | Done=%b",
                 $time, reset, start, final_cost, seg_digit1, seg_digit2, done);
    end

endmodule
