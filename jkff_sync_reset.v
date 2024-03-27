`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 01:47:22 PM
// Design Name: 
// Module Name: jkff_sync_reset
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


module jkff_sync_reset(
    input J,
    input K,
    input clk,
    input syncReset,
    output wire Q,
    output notQ
    );
    
    wire D;
    dff_sync_reset mydff(D, clk, syncReset, Q, notQ);
   
    assign D = (J & ~Q) | (~K & Q);
    
endmodule
