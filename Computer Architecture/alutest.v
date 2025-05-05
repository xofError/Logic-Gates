
`timescale 1ns / 1ps

module tb_ALU_4Bit;

    reg [3:0] A, B;
    reg [1:0] sel;
    reg Cin;
    wire [3:0] D;
    wire Cout;

    // Instantiate the ALU
    ALU_4Bit uut (
        .A(A),
        .B(B),
        .sel(sel),
        .Cin(Cin),
        .D(D),
        .Cout(Cout)
    );

    initial begin
        $display("Time\tA\tB\tSel\tCin\t|\tD\tCout");
        $monitor("%0dns\t%b\t%b\t%02b\t%b\t|\t%b\t%b", $time, A, B, sel, Cin, D, Cout);
        
        // Test 1: Transfer A (B passed through mux)
        A = 4'b0110; B = 4'b0000; sel = 2'b00; Cin = 1'b0; #10;

        // Test 2: A + 1 (by adding 1 to A)
        A = 4'b0110; B = 4'b0000; sel = 2'b11; Cin = 1'b1; #10;

        // Test 3: A + B
        A = 4'b0011; B = 4'b0101; sel = 2'b00; Cin = 1'b0; #10;

        // Test 4: A + B + 1 (Add with carry)
        A = 4'b0011; B = 4'b0101; sel = 2'b00; Cin = 1'b1; #10;

        // Test 5: A + B' (Sub with borrow)
        A = 4'b0110; B = 4'b0011; sel = 2'b01; Cin = 1'b0; #10;

        // Test 6: A + B' + 1 (Subtraction)
        A = 4'b0110; B = 4'b0011; sel = 2'b01; Cin = 1'b1; #10;

        // Test 7: A - 1
        A = 4'b0110; B = 4'b1111; sel = 2'b11; Cin = 1'b0; #10;

        // End simulation
        $stop();
    end

endmodule
