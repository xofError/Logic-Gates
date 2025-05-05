
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
       .f(f)
    );
    initial begin
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
        $stop();
    end
    
    
    
    K2 new_map2(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f)
    );
    
        initial begin
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
        $stop();
    end
endmodule