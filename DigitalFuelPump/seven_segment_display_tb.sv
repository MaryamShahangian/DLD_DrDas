`timescale 1ns / 1ps
module tb();

    logic [3:0] binary_in;
    logic [6:0] segments;

    // Instantiate the module under test (MUT)
    seven_segment_display dut (
        .binary_in(binary_in),
        .segments(segments)
    );

    initial begin
        // Test digits 0 through 9 and an invalid one (e.g., 10)
        for (int i = 0; i <= 10; i++) begin
            binary_in = i;
            #10; // wait 10ns
        end

        $finish;
    end

    // Display output for observation
    initial begin
        $monitor("Time = %0t | binary_in = %0d | Segment Output = %07b", 
                 $time, binary_in, segments);
    end

endmodule
