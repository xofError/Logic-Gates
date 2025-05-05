
module testbench();
    
    reg a;
    reg b;
    wire c;
    
    myAND new_and(
       .a(a),
       .b(b),
       .c(c)
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
       .c(c)
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
       .c(c)
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
       .c(c)
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
       .c(c)
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
       .c(c)
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