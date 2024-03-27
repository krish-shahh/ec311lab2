`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2024 02:06:25 PM
// Design Name: 
// Module Name: q1b_tb
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


module q1b_tb(

    );
    
    reg D;
    reg clk_in;
    reg rst;

    wire Q;
    wire notQ;

    wire divided_clk;
    reg [32:0] cnt;

    always #5 clk_in = ~clk_in;

    clk_divider DUT_divider (
        .clk_in(clk_in),
        .rst(rst),
        .divided_clk(divided_clk)
    );

    dff DUT_dff (
        .D(D),
        .clk(divided_clk),
        .Q(Q),
        .notQ(notQ)
    );

    initial begin
        D = 0;
        rst = 1;
        cnt = 0;
        clk_in = 0;

        #50 rst = 0;

        // Apply inputs
        #100 D = 1; 
        #105 $display("Output at pos-edge of slower clock: %b", Q);
        #110 D = 0;
        #115 $display("Output at pos-edge of slower clock: %b", Q);
        #200 $finish;
    end
    
endmodule
