module mux4x1 ( input wire a,                
                input wire b,                
                input wire c,                
                input wire d,                 
                input wire [1:0] sel,         // input sel used to select between a,b,c,d
                output wire out
                );             

   assign out = sel[1] ? (sel[0] ? d : c) : (sel[0] ? b : a);

endmodule

module full_adder( input wire a,
               	input wire b,
               	input wire cin,
               	output wire sum,
               	output wire cout
              );
  
	assign sum = a ^ b ^ cin;
	assign cout = (a & b) | (b & cin)  | (cin & a) ;

endmodule

module ALU_1Bit( input a,
           	 	 input b,
                 input [1:0] sel,
           		 input cin,
           		 output D,
           		 output cout
          		);
    wire b_not, mux_out;
    assign b_not = ~b;
  
    mux4x1 mux (
      	.a(b),         // constant 0 input (used for "Transfer A")
      	.b(b_not),
        .c(1'b0),
        .d(1'b1),      // used for increment (constant 1)
        .sel(sel),
        .out(mux_out)
    );

    full_adder fa (
        .a(a),
        .b(mux_out),
        .cin(cin),
      	.sum(D),
        .cout(cout)
    );  	
endmodule

module ALU_4Bit( input wire [3:0] A, B,
    			 input wire [1:0] sel,
    			 input wire Cin,
    			 output wire [3:0] D,
    			 output wire Cout
               );
      wire c1, c2, c3;

  ALU_1Bit alu0 (.a(A[0]), .b(B[0]), .sel(sel), .cin(Cin),  .D(D[0]), .cout(c1));
  ALU_1Bit alu1 (.a(A[1]), .b(B[1]), .sel(sel), .cin(c1),   .D(D[1]), .cout(c2));
  ALU_1Bit alu2 (.a(A[2]), .b(B[2]), .sel(sel), .cin(c2),   .D(D[2]), .cout(c3));
  ALU_1Bit alu3 (.a(A[3]), .b(B[3]), .sel(sel), .cin(c3),   .D(D[3]), .cout(Cout));

endmodule
