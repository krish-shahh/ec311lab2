`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2024 02:43:40 PM
// Design Name: 
// Module Name: q2
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


module q2(
    input X,
    input Y,
    input Z,
    input S0,
    input S1,
    input clk,
    output T
    );
    
    // X input 1st third
    wire x_xorOutput, x_invOutput, dffOutput, x_andOutput, x_orOutput;
    xor(x_xorOutput, X, x_invOutput);
    not(x_invOutput, dffOutput);
    and(x_andOutput, X, dffOutput);
    or(x_orOutput, x_xorOutput,  x_andOutput);
    dff xDff(.D(x_orOutput), .clk(clk), .Q(dffOutput));
    
    // Y input 2nd third
    wire y_nandOutput, y_andOutput, tffOutput;
    nand(y_nandOutput, Y, dffOutput);
    and(y_andOutput, y_nandOutput, tffOutput);
    tff yTff(.T(y_andOutput), .clk(clk), .Q(tffOutput));
    
    wire y_xorOutput, y_xorOutput2;
    xor(y_xorOutput, tffOutput, jkffOutput);
    xor(y_xorOutput2, tffOutput, y_xorOutput);
    
    // Z input 3rd third
    wire z_xorOutput, z_nandOutput, jkffOutput, z_nandOutput2;
    xor(z_xorOutput, Z, Y);
    nand(z_nandOutput, z_xorOutput, z_xorOutput);
    jkff zJkff(.J(y_andOutput), .K(z_nandOutput), .clk(clk), .Q(jkffOutput));
    
    nand(z_nandOutput2, jkffOutput, jkffOutput);
    
    // MUX
    wire [1:0] MUX_sel;
    wire [3:0] MUX_in;
    reg MUX_out;
    
    assign MUX_sel = {S0, S1};
    //assign MUX_in = {dffOutput,y_xorOutput2, z_nandOutput2,  1'b0 };
    assign MUX_in = {1'b0, z_nandOutput2, y_xorOutput2,  dffOutput };
    // Implementing the 4x1 MUX logic
    always @ (MUX_sel or MUX_in)
    begin
        case (MUX_sel)
            2'b00: MUX_out = MUX_in[0];
            2'b01: MUX_out = MUX_in[1];
            2'b10: MUX_out = MUX_in[2];
            2'b11: MUX_out = MUX_in[3];
            default: MUX_out = 1'b0;
        endcase
    end
    
    // Output
    assign T = MUX_out;
    
    
    
endmodule


/*
module q2(
    input wire clk,
    input wire reset,
    input wire X, Y, Z, S0, S1,
    output wire T
);

wire notX, notY, notZ;
wire and1, and2, and3, and4;
wire or1;
wire DFF_out, TFF_out, JKFF_out;
wire [1:0] MUX_sel;
wire [3:0] MUX_in;
reg MUX_out;

// Negations
not (notX, X);
not (notY, Y);
not (notZ, Z);

// AND gates
and (and1, notX, Y);
and (and2, notY, Z);
and (and3, Y, notZ);
and (and4, X, notY, notZ);

// OR gate
or (or1, and1, and2, and3);

// Flip-Flops
dff dff_module (.clk(clk),  .D(or1), .Q(DFF_out));
tff tff_module (.clk(clk),  .T(DFF_out), .Q(TFF_out));
jkff jkff_module (.clk(clk),  .J(X), .K(Z), .Q(JKFF_out));

// 4x1 MUX
assign MUX_sel = {S1, S0};
assign MUX_in = {and4, JKFF_out, TFF_out, DFF_out};

// Implementing the 4x1 MUX logic
always @ (MUX_sel or MUX_in)
begin
    case (MUX_sel)
        2'b00: MUX_out = MUX_in[0];
        2'b01: MUX_out = MUX_in[1];
        2'b10: MUX_out = MUX_in[2];
        2'b11: MUX_out = MUX_in[3];
        default: MUX_out = 1'b0;
    endcase
end

// Output
assign T = MUX_out;

endmodule
*/