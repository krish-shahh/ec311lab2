`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 01:04:01 PM
// Design Name: 
// Module Name: tff
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


module tff(
    input T,
    input clk,
    output reg Q,
    output notQ
    );
    initial Q = 0;
    assign notQ = ~Q;
    always @(posedge clk) begin
        Q <= T^Q;
    end
    
endmodule
