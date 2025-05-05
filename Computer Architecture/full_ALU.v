module ALU_4bit_full (
    input wire [3:0] A, B,
    input wire [3:0] S,     // {S3, S2, S1, S0}
    input wire Cin,
    output wire [3:0] F
);
    wire [3:0] D;            // Arithmetic output
    wire [3:0] E;            // Logic output
    wire [3:0] shr, shl;     // Shift outputs

    //wire [3:0] mux_out;      // Output of final 4x1 mux for each bit

    // Arithmetic Unit (supports different ops based on S[1:0] and Cin)
    ALU_4Bit arithmetic_unit (
        .A(A),
        .B(B),
        .sel(S[1:0]),     // selects b, b', 0, 1
        .Cin(Cin),
        .D(D),
        .Cout()           // Cout is ignored for now
    );

    // Logic Unit
    logic_unit_4bit logic_unit (
        .A(A),
        .B(B),
        .sel(S[1:0]),
        .F(E)
    );

    // Shift Unit
    shift_unit_4bit shifter (
        .A(A),
        .shr(shr),
        .shl(shl)
    );

    // 4x1 MUX for each bit of the final output F
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : mux_loop
            mux4x1 final_mux (
                .a(D[i]),        // 00: Arithmetic
                .b(E[i]),        // 01: Logic
                .c(shr[i]),      // 10: Shift Right
                .d(shl[i]),      // 11: Shift Left
                .sel(S[3:2]),
                .out(F[i])
            );
        end
    endgenerate

endmodule
