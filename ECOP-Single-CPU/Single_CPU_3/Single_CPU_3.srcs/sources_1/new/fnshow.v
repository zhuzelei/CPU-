`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/5/18 19:50:49
// Design Name: 
// Module Name: fnshow
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


module fnshow
(
 input [3:0] G,
 input [7:0] display1,
 input [7:0] display2,
 input [7:0] display3,
 input [7:0] display4,
 output reg [7:0] DISplay
);



always@(G)
begin
 
 case(G)
 4'b0111:DISplay=display1;
 4'b1011:DISplay=display2;
 4'b1101:DISplay=display3;
 4'b1110:DISplay=display4;

 endcase
end
endmodule
