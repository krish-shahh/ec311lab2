`timescale 1ns / 1ps

module q8_tb;

reg J;
reg K;
reg clk;
reg reset;
wire Q_sync;
wire Q_async;

q8 uut (
    .J(J),
    .K(K),
    .clk(clk),
    .reset(reset),
    .Q_sync(Q_sync),
    .Q_async(Q_async)
);

initial begin
    clk = 0;
    forever #1 clk = ~clk;
end

initial begin
    J = 0;
    K = 0;
    reset = 0;
    
    #(2); 
    
    reset = 1;
    #(1);
    reset = 0;
    
    J = 1; K = 0;
    
    #(2);
    
    J = 0; K = 0;
    #(2);
    reset = 1;
    #(2);
    reset = 0;
    
    #(2);
    $finish;
end

endmodule