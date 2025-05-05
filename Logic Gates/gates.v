
module myOR(
   input a,
   input b,
   output c
);

or(c,a,b);

// C = A | B

endmodule

module myAND(
   input a,
   input b,
   output c
);

and(c,a,b);
// C = A & B

endmodule

module myNAND(
   input a,
   input b,
   output c
);

nand(c,a,b);
// C = ~(A & B)

endmodule

module myNOR(
   input a,
   input b,
   output c
);

nor(c,a,b);
// C = ~(A | B)

endmodule

module myXOR(
   input a,
   input b,
   output c
);

xor(c,a,b);
// C = A ^ B

endmodule

module myXNOR(
   input a,
   input b,
   output c
);

xnor(c,a,b);
// C = ~(A ^ B)

endmodule

module myNOT(
   input a,
   output b

);

not(b,a);
endmodule


module testbench();
    
    reg a;
    reg b;
    wire c;
    
    myAND new_and(
       .a(a),
       .b(b),
       .c(c1)
    );
    initial begin
        a=1;
        b=0;
        #100;
        a=1;
        b=1;
        #200;
        a=0;
        b=0;
        $stop();
    end
    
    myOR new_or(
       .a(a),
       .b(b),
       .c(c2)
    );
    initial begin
        a=1;
        b=0;
        #100;
        a=1;
        b=1;
        #200;
        a=0;
        b=0;
        $stop();
    end
    
    myNAND new_nand(
       .a(a),
       .b(b),
       .c(c3)
    );
    initial begin
        a=1;
        b=0;
        #100;
        a=1;
        b=1;
        #200;
        a=0;
        b=0;
        $stop();
    end
    
    myNOR new_nor(
       .a(a),
       .b(b),
       .c(c4)
    );
    initial begin
        a=1;
        b=0;
        #100;
        a=1;
        b=1;
        #200;
        a=0;
        b=0;
        $stop();
    end
    
    myXOR new_xor(
       .a(a),
       .b(b),
       .c(c5)
    );
    initial begin
        a=1;
        b=0;
        #100;
        a=1;
        b=1;
        #200;
        a=0;
        b=0;
        $stop();
    end
    
    myXNOR new_xnor(
       .a(a),
       .b(b),
       .c(c6)
    );
    initial begin
        a=1;
        b=0;
        #100;
        a=1;
        b=1;
        #200;
        a=0;
        b=0;
        $stop();
    end
endmodule

















