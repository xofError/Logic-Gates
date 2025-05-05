`timescale 1ns / 1ps

module tb_logic_unit_4bit;

    reg [3:0] A, B;
    reg [1:0] sel;
    wire [3:0] F;

    // Instantiate the logic unit
    logic_unit_4bit uut (
        .A(A),
        .B(B),
        .sel(sel),
        .F(F)
    );

    initial begin
        $display("Time\tA\tB\tSel\t|\tF (Result)");
        $monitor("%0dns\t%b\t%b\t%02b\t|\t%b", $time, A, B, sel, F);

        // Test 1: AND
        A = 4'b1010; B = 4'b1100; sel = 2'b00; #10;

        // Test 2: OR
        A = 4'b1010; B = 4'b1100; sel = 2'b01; #10;

        // Test 3: XOR
        A = 4'b1010; B = 4'b1100; sel = 2'b10; #10;

        // Test 4: NOT A (complement)
        A = 4'b1010; B = 4'bxxxx; sel = 2'b11; #10;  // B is "don't care" here

        // Optional: finish simulation
        $stop();
    end

endmodule

