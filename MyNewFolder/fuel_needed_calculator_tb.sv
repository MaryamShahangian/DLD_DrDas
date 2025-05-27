`timescale 1ns / 1ps
module tb ();

    // Inputs
    logic [7:0] fuel_in_tank;
    logic [7:0] tank_capacity;

    // Output
    logic [7:0] fuel_needed;

    // Instantiate DUT (Device Under Test)
    fuel_needed_calculator dut (
        .fuel_in_tank(fuel_in_tank),
        .tank_capacity(tank_capacity),
        .fuel_needed(fuel_needed)
    );

    initial begin
        $display("Time | Fuel_in_tank | Tank_capacity | Fuel_needed");
        $monitor("%0t  |     %d       |      %d       |     %d", 
                 $time, fuel_in_tank, tank_capacity, fuel_needed);

        // Test Case 1: Tank empty
        fuel_in_tank = 8'd0;
        tank_capacity = 8'd40;
        #10;

        // Test Case 2: Tank half full
        fuel_in_tank = 8'd20;
        tank_capacity = 8'd50;
        #10;

        // Test Case 3: Tank almost full
        fuel_in_tank = 8'd19;
        tank_capacity = 8'd40;
        #10;

        // Test Case 4: Tank already full
        fuel_in_tank = 8'd23;
        tank_capacity = 8'd40;
        #10;

        // Test Case 5: Tank overfilled (for edge test)
        fuel_in_tank = 8'd14;
        tank_capacity = 8'd60;
        #10;

        $finish;
    end

endmodule
