
module gas_pump_top(
    input  logic clk,                        // Clock for FSM
    input  logic reset,                      // Reset signal
    input  logic start,                      // Start animation
    input  logic [7:0] fuel_in_tank,         // Current fuel in tank
    input  logic [7:0] tank_capacity,        // Full tank capacity
    input  logic [7:0] price_per_liter,      // Fuel price
    input  logic [7:0] customer_credit,      // Customer available credit
    output logic [7:0] fuel_to_add,          // How much fuel needed
    output logic [15:0] total_cost,          // Final cost
    output logic [6:0] seg_digit1,           // 7-segment output digit 1 (one's)
    output logic [6:0] seg_digit2,           // 7-segment output digit 2 (ten's)
    output logic done                        // Done signal after animation
);

    // Internal wire
    logic [7:0] fuel_needed;

    // Calculate required fuel
    fuel_needed_calculator u_fuel_needed_calc (
        .fuel_in_tank(fuel_in_tank),
        .tank_capacity(tank_capacity),
        .fuel_needed(fuel_needed)
    );

    // Calculate total cost = fuel_needed * price_per_liter
    cost_calculator u_cost_calc (
        .fuel_amount(fuel_needed),
        .price_per_liter(price_per_liter),
        .total_cost(total_cost)
    );

    // Animated display using FSM
    fuel_fsm u_fsm_display (
        .clk(clk),
        .reset(reset),
        .start(start),
        .final_cost(total_cost[7:0]), // only showing lower byte
        .seg_digit1(seg_digit1),
        .seg_digit2(seg_digit2),
        .done(done)
    );

    // Output how much fuel to add
    assign fuel_to_add = fuel_needed;

endmodule
