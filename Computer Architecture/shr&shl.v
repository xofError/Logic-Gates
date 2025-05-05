module shift_unit_4bit (
    input wire [3:0] A,
    output wire [3:0] shr,  // Shift right (logical) A into F
    output wire [3:0] shl   // Shift left (logical) A into F
);
    assign shr = A >> 1;
    assign shl = A << 1;
endmodule
