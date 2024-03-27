`timescale 1ns / 1ps

module tff_tb;

    reg T;
    reg clk;

    wire Q;
    wire notQ;

    tff DUT (
        .T(T),
        .clk(clk),
        .Q(Q),
        .notQ(notQ)
    );

    always #5 clk = ~clk;

    initial begin
        T = 0;
        clk = 0;

        #10 T = 1; 
        #20 T = 0; 
        #30 T = 1; 
        #40 T = 1;
        #50 T = 0; 
        #60 T = 1; 
        #70 T = 0;
        #80 $finish;
    end

endmodule