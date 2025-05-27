module cost_calculator (
    input  logic [7:0]  fuel_amount,      // Amount of fuel in liters
    input  logic [7:0]  price_per_liter,  // Price per liter
    output logic [15:0] total_cost        // Final cost
);

    assign total_cost = fuel_amount * price_per_liter; // Cost = liters × price per liter

endmodule
