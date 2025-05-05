module full_adder (
    input a, b, cin,
    output sum, cout
);
    assign sum = (a ^ b) ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module two_bit_full_adder (
    input [1:0] A, B,
    input Cin,
    output [1:0] Sum,
    output Cout
);
    wire c1; // Carry between the first and second full adder

    // First 1-bit full adder
    full_adder FA0 (
        .a(A[0]), .b(B[0]), .cin(Cin),
        .sum(Sum[0]), .cout(c1)
    );

    // Second 1-bit full adder
    full_adder FA1 (
        .a(A[1]), .b(B[1]), .cin(c1),
        .sum(Sum[1]), .cout(Cout)
    );
endmodule

module testbench;
    reg [1:0] A, B;
    reg Cin;
    wire [1:0] Sum;
    wire Cout;

    two_bit_full_adder uut (
        .A(A), .B(B), .Cin(Cin),
        .Sum(Sum), .Cout(Cout)
    );

    initial begin
        A = 0 ;
        B = 0 ;
        Cin = 0;
        $monitor("A = %b, B = %b, Cin = %b | Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);
        #100;

        A = 2'b00; B = 2'b00; Cin = 0; #10;
        A = 2'b01; B = 2'b01; Cin = 0; #10;
        A = 2'b10; B = 2'b01; Cin = 0; #10;
        A = 2'b11; B = 2'b01; Cin = 1; #10;
        A = 2'b11; B = 2'b11; Cin = 1; #10;

        $stop();
    end
endmodule

