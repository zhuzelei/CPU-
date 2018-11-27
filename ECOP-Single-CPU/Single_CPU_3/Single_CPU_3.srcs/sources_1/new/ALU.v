`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/5/17 17:06:29
// Design Name: 
// Module Name: ALU
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


module ALU
 (
  input [2:0] ALUop,
  input [31:0] A,
  input [31:0] B,
  output reg zero,
  output reg sign,
  output reg [31:0] result
 );
 always@(*)
 begin
 case(ALUop)
  3'b000: result=A+B;
  3'b001: result=A-B;
  3'b010: result=B<<A;
  3'b011: result=A|B;
  3'b100: result=A&B;
  3'b101: result=(A<B)? 1:0;
  3'b110: if(A<B&&(A[31]==B[31]))
          result=1;
          else if(A[31]&&!B[31])
          result=1;
		  else
		  result=0;          
  3'b111: result=A^B;
 endcase
 sign=result[31];
 
 if(result)
  zero=0;
 else
  zero=1;  
 
 end 
endmodule
