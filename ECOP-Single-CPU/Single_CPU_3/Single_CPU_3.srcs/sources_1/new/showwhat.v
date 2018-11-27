`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/5/18 18:27:47
// Design Name: 
// Module Name: showwhat
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


module showwhat
(
 input SWin1,
 input SWin2,
 input [7:0] addr,
 input [7:0] newaddr,
 
 input [7:0] rsaddr,
 input [7:0] rsdata,
 
 input [7:0] rtaddr,
 input [7:0] rtdata,
 
 input [7:0] result,
 input [7:0] DB,
 
 output reg [7:0] show1,
 output reg [7:0] show2
);

always@(SWin1 or SWin2)
begin

if(SWin1==0&&SWin2==0)
begin
show1=addr;
show2=newaddr;
end

if(SWin1==0&&SWin2==1)
begin
show1=rsaddr;
show2=rsdata;
end

if(SWin1==1&&SWin2==0)
begin
show1=rtaddr;
show2=rtdata;
end

if(SWin1==1&&SWin2==1)
begin
show1=result;
show2=DB;
end

end

endmodule
