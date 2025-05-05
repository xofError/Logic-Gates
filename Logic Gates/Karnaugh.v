
module K1(
   input a,
   input b,
   input c,
   input d,
   output f

);

assign f = (~b & c) | (~a & b & d) | (a & ~c & ~d);

endmodule

module K2(
   input a,
   input b,
   input c,
   input d,
   input e,
   output f
);

assign f = (b&e) | (~a&~b&c&~e) | (~a&~c&d&e) | (a&~c&d&~e);

endmodule

module kmapTest();
    reg a;
    reg b;
    reg c;
    reg d;
    reg e;
    wire f;
    
    K1 new_map1(
       .a(a),
       .b(b),
       .c(c),
       .d(d),
       .f(f1)
    );
    initial begin
        a=0;
        b=0;
        c=0;
        d=0;
        #100;
        a=1;
        b=0;
        c=1;
        d=1;
        #100;
        a=0;
        b=1;
        c=1;
        d=0;
        #100;
        a=1;
        b=1;
        c=0;
        d=1;
        //$stop();
    end
    
    
    
    K2 new_map2(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f2)
    );
    
        initial begin
        a=0;
        b=0;
        c=0;
        d=0;
        e=0;
        #100;
        a=1;
        b=0;
        c=1;
        d=1;
        e=0;
        #100;
        a=0;
        b=1;
        c=1;
        d=0;
        e=1;
        #100;
        a=1;
        b=1;
        c=0;
        d=1;
        e=1;
        //$stop();
    end
endmodule

