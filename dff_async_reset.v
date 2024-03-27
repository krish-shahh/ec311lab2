`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 10:49:52 AM
// Design Name: 
// Module Name: dff_async_reset
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


module dff_async_reset(
    input D,
    input clk,
    input asyncReset,
    output reg Q,
    output notQ
    );
    
    initial Q = 0;
    assign notQ = ~Q;
    always @(posedge clk or posedge asyncReset) begin
        if(asyncReset) begin
            Q <= 0;
        end else begin
            Q <= D;
        end
    end
    
endmodule
