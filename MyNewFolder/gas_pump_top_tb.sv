`timescale 1ns / 1ps

module tb();

    logic clk, reset, start;
    logic [7:0] fuel_in_tank;
    logic [7:0] tank_capacity;
    logic [7:0] price_per_liter;
    logic [7:0] customer_credit;

    logic [7:0] fuel_to_add;
    logic [15:0] total_cost;
    logic [6:0] seg1, seg2;
    logic done;

    // Instantiate Top Module
    gas_pump_top dut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .fuel_in_tank(fuel_in_tank),
        .tank_capacity(tank_capacity),
        .price_per_liter(price_per_liter),
        .customer_credit(customer_credit),
        .fuel_to_add(fuel_to_add),
        .total_cost(total_cost),
        .seg_digit1(seg1),
        .seg_digit2(seg2),
        .done(done)
    );

    // Generate clock (10 ns period)
    always #5 clk = ~clk;

    initial begin
        // Init
        clk = 0;
        reset = 1;
        start = 0;
        fuel_in_tank = 8'd20;
        tank_capacity = 8'd60;
        price_per_liter = 8'd3;
        customer_credit = 8'd255;

        // Reset and start
        #10 reset = 0;
        #10 start = 1;
        #10 start = 0;

        // Wait until done signal goes high
        wait(done == 1);
        #50 $finish;
    end

    initial begin
        $monitor("Time=%0t | Fuel=%0d | Price=%0d | Add=%0d | Cost=%0d | Seg1=%b | Seg2=%b | Done=%b",
                 $time, fuel_in_tank, price_per_liter, fuel_to_add, total_cost, seg1, seg2, done);
    end

endmodule
