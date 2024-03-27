`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 08:52:07 PM
// Design Name: 
// Module Name: tff_async_reset_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tff_async_reset_tb(

    );
    
    reg T;
    reg clk;

    wire Q;
    wire notQ;
    reg asyncReset;

    tff_async_reset DUT (
        .T(T),
        .clk(clk),
        .Q(Q),
        .notQ(notQ),
        .asyncReset(asyncReset)
    );

    always #5 clk = ~clk;

    initial begin
        T = 0;
        clk = 0;
        asyncReset = 0;

        #10 T = 1; 
        #20 T = 0; 
        #30 T = 1; 
        #40 T = 1;
        #50 T = 0; 
        #60 T = 1; 
        #70 T = 0;
        #80 T = 1;
        #87 T = 0;
        #90 asyncReset = 1;
        #100 asyncReset = 0;
        #110 T = 1;
        #120 $finish;
    end
    
endmodule
