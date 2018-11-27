`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/5/17 11:24:56
// Design Name: 
// Module Name: MUL32
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


module MUL32
(
 input control,
 input [31:0] in0,
 input [31:0] in1,
 output [31:0] out
);

assign out=control?in1:in0;
endmodule
