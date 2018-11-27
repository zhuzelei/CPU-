`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/5/18 09:46:06
// Design Name: 
// Module Name: insMEN
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


module insMEN
 (
  input [31:0] inaddr,
  output [5:0] op,
  output [4:0] rs,
  output [4:0] rt,
  output [4:0] rd,
  output [4:0] sa,
  output [15:0] immediate,
  output [25:0] address
 );
 reg[7:0] mem[0:80];
 
 initial begin
 $readmemb("F:/test.txt",mem);
 end

//address
assign address[25:24]=mem[inaddr][1:0];
 assign address[23:16]=mem[inaddr+1];
 assign address[15:8]=mem[inaddr+2];
 assign address[7:0]=mem[inaddr+3];
 
 //op
 assign op=mem[inaddr][7:2];
 
 //rs
 assign rs[4:3]=mem[inaddr][1:0];
 assign rs[2:0]=mem[inaddr+1][7:5];
 
 //rt
 assign rt=mem[inaddr+1][4:0];
 
 //rd
 assign rd=mem[inaddr+2][7:3];
 
 //sa
 assign sa[4:2]=mem[inaddr+2][2:0];
 assign sa[1:0]=mem[inaddr+3][7:6];
 
 //immediate
 assign immediate[15:8]=mem[inaddr+2];
 assign immediate[7:0]=mem[inaddr+3]; 
 
endmodule
