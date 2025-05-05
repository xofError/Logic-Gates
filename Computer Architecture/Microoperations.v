module logic_unit_4bit (
    input wire [3:0] A, B,
    input wire [1:0] sel,
    output reg [3:0] F
);

    always @(*) begin
        case (sel)
            2'b00: F = A & B;   // AND
            2'b01: F = A | B;   // OR
            2'b10: F = A ^ B;   // XOR
            2'b11: F = ~A;      // NOT A (complement)
            default: F = 4'b0000;
        endcase
    end

endmodule