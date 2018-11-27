`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/22 18:50:39
// Design Name: 
// Module Name: shaomiao
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


module shaomiao
(input clk,
 output reg [3:0] G
);
initial
begin
G=4'b1110;
end

always@(negedge clk)
begin
G[3]<=G[0];
G[2:0]<=G[3:1];
end

endmodule
