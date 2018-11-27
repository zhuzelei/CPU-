`timescale 1ns / 1ps

module clock_div(
input clk,
output reg clk_sys = 0 
);
reg [25:0] div_counter = 0;
always @(posedge clk) begin
if(div_counter>=50) begin 
clk_sys <= ~clk_sys;
div_counter <= 0;
end else begin
div_counter <= div_counter + 1;
end
end
endmodule