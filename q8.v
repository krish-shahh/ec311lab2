`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 01:47:22 PM
// Design Name: 
// Module Name: jkff
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


module q8(
    input J,
    input K,
    input clk,
    input reset,
    output Q_sync,
    output Q_async    
    );
    
    jkff_sync_reset jkff_a(
        .J(J),
        .K(K),
        .clk(clk),
        .syncReset(reset),
        .Q(Q_sync),
        .notQ()
    );
    
    jkff_async_reset jkff_s(
        .J(J),
        .K(K),
        .clk(clk),
        .asyncReset(reset),
        .Q(Q_async),
        .notQ()
    );
    
endmodule