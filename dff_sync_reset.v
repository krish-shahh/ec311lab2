`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 01:42:37 PM
// Design Name: 
// Module Name: dff_sync_reset
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


module dff_sync_reset(
    input D,
    input clk,
    input syncReset,
    output reg Q,
    output notQ
    );
    initial Q = 0;
    assign notQ = ~Q;
    always @(posedge clk) begin
        if(syncReset) begin
            Q <= 0;
        end else begin
            Q <= D;
        end
    end
    
endmodule
