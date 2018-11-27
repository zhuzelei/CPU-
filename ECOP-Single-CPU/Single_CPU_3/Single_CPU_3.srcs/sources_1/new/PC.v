`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/5/18 21:58:26
// Design Name: 
// Module Name: PC
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


module PC
(
 
  input CLK,
  input  Reset,
  input  PCWre,
  input [31:0]  Nextadd,
  output reg [31:0] addr
);
 initial begin
 addr<=0;
 end
 
  always@(posedge CLK)
  begin
  if(Reset==0) begin
  addr<=0;
  end 
  else if(PCWre==0)
  addr<=addr;
  else
  addr<=Nextadd;
  end    
endmodule
