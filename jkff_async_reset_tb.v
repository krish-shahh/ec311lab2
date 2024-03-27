`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2024 01:47:00 PM
// Design Name: 
// Module Name: jkff_async_reset_tb
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


module jkff_async_reset_tb(

    );
    
    reg J;
    reg K;
    reg clk;

    wire Q;
    wire notQ;
    reg asyncReset;

    jkff_async_reset DUT (
        .J(J),
        .K(K),
        .clk(clk),
        .Q(Q),
        .notQ(notQ),
        .asyncReset(asyncReset)
    );

    always #5 clk = ~clk;

    initial begin
        J = 0;
        K = 0;
        clk = 0;

        asyncReset = 0;

        #10 J = 1;
        #20 K = 0;
        #10 asyncReset = 1;
        #10 asyncReset = 0; 
        #30 J = 0;
        #40 K = 1; 
        #50 J = 1;
        #60 K = 1;
        #70 $finish; 
    end
    
endmodule
