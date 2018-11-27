`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/5/18 17:44:16
// Design Name: 
// Module Name: Datamemory
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


module Datamemory
(
 input CLK,
 input RD,
 input WR,
 input [31:0] address ,
 input [31:0] writedata,
 
 output [31:0] Dataout
 
);

reg [7:0] ram[0:60];
integer i;

initial begin
for(i=0;i<=60;i=i+1)
ram[i]<=0;
end


assign Dataout[7:0] = (RD==0)?ram[address + 3]:8'bz;
assign Dataout[15:8] = (RD==0)?ram[address + 2]:8'bz;
assign Dataout[23:16] = (RD==0)?ram[address + 1]:8'bz;
assign Dataout[31:24] = (RD==0)?ram[address ]:8'bz;

always@(negedge CLK)begin
if(WR==0)begin
 ram[address]<=writedata[31:24];
 ram[address+1]<=writedata[23:16];
 ram[address+2]<=writedata[15:8];
 ram[address+3]<=writedata[7:0];
 end
end
endmodule
