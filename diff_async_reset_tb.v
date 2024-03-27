`timescale 1ns / 1ps

module dff_async_reset_tb;

    reg D;
    reg clk;
    reg asyncReset;

    wire Q;
    wire notQ;

    dff_async_reset DUT (
        .D(D),
        .clk(clk),
        .asyncReset(asyncReset),
        .Q(Q),
        .notQ(notQ)
    );

    always #5 clk = ~clk;

    initial begin
        D = 0;
        clk = 0;
        asyncReset = 0;

        #30 D = 1;
        #20 asyncReset = 1;
        #10 asyncReset = 0;
        
        #10 D = 0;
        #10 D = 1;
        #10 D = 0;
        #70 $finish;
    end

endmodule