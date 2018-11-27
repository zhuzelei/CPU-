`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/5/18 11:26:41
// Design Name: 
// Module Name: ChsePC
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


module ChsePC
 (
  input [1:0] PCsrc,
  input [31:0] addr0,
  input [31:0] addr1,
  input [31:0] addr2,
  output [31:0] result
 );
 /*if(PCsrc==0)
 assign result=addr0;
 else if(PCsrc==1)
 assign result=addr1;
 else
 assign result=addr2;*/
 assign result=(PCsrc==0)?addr0:(PCsrc==1?addr1:addr2);
 
endmodule
