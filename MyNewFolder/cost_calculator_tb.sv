`timescale 1ns / 1ps
module tb();

    logic [7:0] fuel_amount;
    logic [7:0] price_per_liter;
    logic [15:0] total_cost;

    // Instantiate the cost_calculator module
    cost_calculator dut (
        .fuel_amount(fuel_amount),
        .price_per_liter(price_per_liter),
        .total_cost(total_cost)
    );

    initial begin
        // Test case 1
        fuel_amount = 8'd10;
        price_per_liter = 8'd5;
        #10;

        // Test case 2
        fuel_amount = 8'd20;
        price_per_liter = 8'd3;
        #10;

        // Test case 3
        fuel_amount = 8'd15;
        price_per_liter = 8'd4;
        #10;

        // End of simulation
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | Fuel=%0d L | Price/L=%0d | Total Cost=$%0d", 
                 $time, fuel_amount, price_per_liter, total_cost);
    end

endmodule
