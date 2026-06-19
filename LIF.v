`timescale 1ns / 1ps

//assign d = {7'b0, a} << 1;

module LIF (
    input wire clk,
    input wire rst,
    input wire spike_in,
    output reg spike_out, 
    output reg [7:0] voltage
);

always @(posedge clk or posedge rst) begin
    if (rst)
    begin
        voltage <= 8'h64;
        spike_out <= 1'b0;
    end
    else begin
        voltage <= voltage - (voltage >> 3) + (spike_in ? 8'd20 : 8'd0) - ( voltage > 100 ? 8'd100 : 8'd0); 
        
        if ( voltage  > 100) begin
            spike_out <= 1'b1;
        end
        else
            spike_out <= 1'b0;
        
    end
        
     
       
end
   

endmodule
