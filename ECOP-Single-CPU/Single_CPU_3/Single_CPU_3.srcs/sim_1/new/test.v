`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/5/18 22:01:34
// Design Name: 
// Module Name: CPU_SIMV1
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


module CPU_SIMV1();

 reg BTNR;
 reg clk;
 reg reset;
 
 reg sw1; 
 reg sw2;

wire [7:0] G;
wire [7:0] discode;

SingleCPU Sim1(clk,BTNR,reset,sw1,sw2,G,discode);

initial begin
BTNR=0;
reset=0;
clk=1;
sw1=0;
sw2=0;

#50
reset=1;
end

always #50
clk=!clk;

endmodule

