`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2026 06:00:05 PM
// Design Name: 
// Module Name: LIF_tb
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


module LIF_tb;

    reg clk, rst, spike_in;
    wire [7:0] d;
    wire spike_out;

    LIF dut (
        .clk(clk),
        .rst(rst),
        .spike_in(spike_in),
        .spike_out(spike_out),
        .voltage(d)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1; spike_in = 0;
        #5 rst = 0;spike_in = 1;
        #10 spike_in = 0;
        #10 spike_in = 1;
        
        #70 spike_in = 0;

        #50 $finish;
    end

    initial
        $monitor("t=%0t voltage=%d spike_in = %b spike_out = %b", $time, d, spike_in, spike_out);

endmodule
