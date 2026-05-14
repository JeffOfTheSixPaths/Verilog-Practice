`timescale 1ns / 1ps

module counter(
    input clk,
    input [0:0] sw,
    input [3:0] btn,
    output [3:0] led
);

reg [3:0] counter = 4'h0;
reg [0:0] btn_prev = 1'b0;


always @(posedge clk)
begin
    if (btn[0] && !btn_prev)
        counter <= counter + 1;

    btn_prev <= btn[0];
end



assign led = counter;

endmodule
