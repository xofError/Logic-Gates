`timescale 1ns / 1ps

module tb_ALU_4bit_full;

    reg [3:0] A, B;
    reg [3:0] S;    // S[3:2] = MUX select, S[1:0] = operation select
    reg Cin;
    wire [3:0] F;

    // Instantiate the full ALU
    ALU_4bit_full uut (
        .A(A),
        .B(B),
        .S(S),
        .Cin(Cin),
        .F(F)
    );

    initial begin
        $display("Time\tA\tB\tS\tCin\t|\tF");
        $monitor("%0dns\t%b\t%b\t%04b\t%b\t|\t%b", $time, A, B, S, Cin, F);

        // Test case 1: Arithmetic - A + B
        A = 4'b0101; B = 4'b0011; Cin = 1'b0;
        S = 4'b0000; #10;  // {00=Arithmetic, 00=select B}

        // Test case 2: Arithmetic - A + ~B
        S = 4'b0001; #10;

        // Test case 3: Arithmetic - A + 0
        S = 4'b0010; #10;

        // Test case 4: Arithmetic - A + 1
        S = 4'b0011; Cin = 1'b1; #10;

        // Test case 5: Logic - A AND B
        S = 4'b0100; #10;

        // Test case 6: Logic - A OR B
        S = 4'b0101; #10;

        // Test case 7: Logic - A XOR B
        S = 4'b0110; #10;

        // Test case 8: Logic - NOT A
        S = 4'b0111; #10;

        // Test case 9: Shift Right A
        S = 4'b1000; #10;

        // Test case 10: Shift Left A
        S = 4'b1100; #10;

        $stop();
    end

endmodule

