`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/5/18 10:12:12
// Design Name: 
// Module Name: regFILE
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


module regFILE
(
 input CLK,
 input RegWre,
 input [4:0] readreg1,
 input [4:0] readreg2,
 input [4:0] writereg,
 input [31:0] writedata,
 output [31:0] readdata1,
 output [31:0] readdata2
);
 reg[31:0] regFile[0:31];
 integer i;
 
 initial begin
 for(i=0;i<32;i=i+1)
 regFile[i]<=0;
 end
  
 assign readdata1=regFile[readreg1];
 assign readdata2=regFile[readreg2];
 
 always@(negedge CLK)
 begin
 if(RegWre!=0 && writereg!=0)
 regFile[writereg]=writedata;
 end   
endmodule
