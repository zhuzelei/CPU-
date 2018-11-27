`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/5/18 17:25:44
// Design Name: 
// Module Name: signZE
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


module signZE
(
 input [15:0] immediate,
 input Extsel,
 output [31:0] Eximmidiate 
);

assign Eximmidiate[15:0]=immediate;
assign Eximmidiate[31:16]=Extsel?(immediate[15] ? 16'hffff : 16'h0000) : 16'h0000;
endmodule
