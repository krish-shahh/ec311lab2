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


module jkff(
    input J,
    input K,
    input clk,
    output wire Q,
    output notQ
    );
    
    wire D;
    dff mydff(D, clk, Q, notQ);
   
    assign D = (J & ~Q) | (~K & Q);
    
endmodule
