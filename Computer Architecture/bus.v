// 4x1 MUX using gate-level modeling
module mux4x1_gate_level(
    input a, b, c, d,  // Data inputs
    input s0, s1,      // Select lines
    output y           // Output
);
    wire n1, n2, n3, n4, n5, n6;

    not (n1, s1);
    not (n2, s0);
    and (n3, a, n1, n2);
    and (n4, b, n1, s0);
    and (n5, c, s1, n2);
    and (n6, d, s1, s0);
    or (y, n3, n4, n5, n6);
endmodule


// 4-line Bus using 4 registers and 4 multiplexers
module bus(
    input [3:0] registerA,  // 4-bit Register A
    input [3:0] registerB,  // 4-bit Register B
    input [3:0] registerC,  // 4-bit Register C
    input [3:0] registerD,  // 4-bit Register D
    input select_x,         // Select MSB (s1)
    input select_y,         // Select LSB (s0)
    output [3:0] out        // Output
);

    // Each bit has its own MUX
    mux4x1_gate_level mux0 (
      .a(registerA[0]),
      .b(registerB[0]), 
      .c(registerC[0]),
      .d(registerD[0]),
      .s0(select_y),
      .s1(select_x), 
      .y(out[0])
    );

    mux4x1_gate_level mux1 (
      .a(registerA[1]),
      .b(registerB[1]), 
      .c(registerC[1]),
      .d(registerD[1]),
      .s0(select_y),
      .s1(select_x), 
      .y(out[1])
    );

    mux4x1_gate_level mux2 (
      .a(registerA[2]),
      .b(registerB[2]), 
      .c(registerC[2]),
      .d(registerD[2]),
      .s0(select_y),
      .s1(select_x), 
      .y(out[2])
    );

    mux4x1_gate_level mux3 (
      .a(registerA[3]),
      .b(registerB[3]), 
      .c(registerC[3]),
      .d(registerD[3]),
      .s0(select_y),
      .s1(select_x), 
      .y(out[3])
    );

endmodule


module testbench;
    reg [3:0] registerA, registerB, registerC, registerD;
    reg select_x, select_y;
    wire [3:0] out;

    bus uut (
        .registerA(registerA),
        .registerB(registerB),
        .registerC(registerC),
        .registerD(registerD),
        .select_x(select_x),
        .select_y(select_y),
        .out(out)
    );

    initial begin

        // Assign values to registers
        registerA = 4'b0001;  // 1
        registerB = 4'b0010;  // 2
        registerC = 4'b0100;  // 4
        registerD = 4'b1000;  // 8

        // Test all select values
        select_x = 0; select_y = 0; #10; // Should select register A (0001)
        select_x = 0; select_y = 1; #10; // Should select register B (0010)
        select_x = 1; select_y = 0; #10; // Should select register C (0100)
        select_x = 1; select_y = 1; #10; // Should select register D (1000)

        $stop();
    end
endmodule

