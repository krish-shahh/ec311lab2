`timescale 1ns / 1ps

module dff_sync_reset_tb;

    reg D;
    reg clk;
    reg syncReset;

    wire Q;
    wire notQ;

    dff_sync_reset DUT (
        .D(D),
        .clk(clk),
        .syncReset(syncReset),
        .Q(Q),
        .notQ(notQ)
    );

    always #5 clk = ~clk;

    initial begin
        D = 0;
        clk = 0;
        syncReset = 0;

        #30 D = 1;
        #20 syncReset = 1;
        #10 syncReset = 0;
        
        #10 D = 0;
        #10 D = 1;
        #10 D = 0;
        #70 $finish;
    end

endmodule