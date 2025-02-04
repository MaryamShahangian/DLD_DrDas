`timescale 1ns / 1ps

module tb();

    // Testbench variables
    logic a, b, cin;
    logic s, cout;

    // Instantiate the Full Adder module
    FA uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    // Test process
    initial begin
        $display("Time | a | b | cin | s | cout");
        $monitor("%4t  | %b | %b |  %b  | %b |  %b", $time, a, b, cin, s, cout);
        
        // Test all possible input combinations
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        // End simulation
        $finish;
    end

endmodule
