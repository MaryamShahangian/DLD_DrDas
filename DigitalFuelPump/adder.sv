module cost_calculator (
    input  logic [7:0]  fuel_amount,      // Amount of fuel in liters
    input  logic [7:0]  price_per_liter,  // Price per liter
    output logic [15:0] total_cost        // Final cost
);

    logic [15:0] p0, p1, p2, p3, p4, p5, p6, p7;

    // Partial products by shifting
    assign p0 = fuel_amount[0] ? price_per_liter         : 16'b0;
    assign p1 = fuel_amount[1] ? (price_per_liter << 1)  : 16'b0;
    assign p2 = fuel_amount[2] ? (price_per_liter << 2)  : 16'b0;
    assign p3 = fuel_amount[3] ? (price_per_liter << 3)  : 16'b0;
    assign p4 = fuel_amount[4] ? (price_per_liter << 4)  : 16'b0;
    assign p5 = fuel_amount[5] ? (price_per_liter << 5)  : 16'b0;
    assign p6 = fuel_amount[6] ? (price_per_liter << 6)  : 16'b0;
    assign p7 = fuel_amount[7] ? (price_per_liter << 7)  : 16'b0;

    // Add all partial products (RTL-style)
    assign total_cost = p0 + p1 + p2 + p3 + p4 + p5 + p6 + p7;

endmodule
