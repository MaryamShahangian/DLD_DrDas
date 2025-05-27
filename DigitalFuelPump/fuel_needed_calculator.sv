module fuel_needed_calculator (
    input  logic [7:0] fuel_in_tank,
    input  logic [7:0] tank_capacity,
    output logic [7:0] fuel_needed
);

    logic [7:0] fuel_in_tank_complement;
    logic carry;

    assign fuel_in_tank_complement = ~fuel_in_tank + 1;
    assign {carry, fuel_needed} = tank_capacity + fuel_in_tank_complement;

endmodule
