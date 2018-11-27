`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/5/17 10:55:03
// Design Name: 
// Module Name: ControlUnit1
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


module ControlUnit1
(
 input sign,
 input zero,
 input [5:0] op,
 
 output reg Exsel,//判断符号位拓展方式   1-符号位  0-零拓展
 output reg PCwre,//是否停机 0-停机 1-不停
 output reg InsmenRW,//InstructionMemory读还是写 0-写 1-读
 output reg Regdst,//选择rt还是rd作为写寄存器 0-rt  1-rd
 output reg Regwre,//判断寄存器堆是否进行写入 0-不写 1-写 
 output reg [2:0] ALUop,//ALU的操作选择
 output reg SrcA,// 0-寄存器堆data1 1-sa移位数
 output reg SrcB,//0-寄存器堆data2  1-拓展后的立即数
 output reg [1:0] PCsrc,//决定pci跳转方式 0-pc+4  1-bne和beq   2-jump
 output reg RD,//1-读
 output reg WR,//1-写
 output reg Datasrc//判断数据来源 0-ALU输出 1-来自数据存储器
);
 
initial begin

Exsel=0;
PCwre=1;
InsmenRW=1;
Regdst=1;
Regwre=0;
ALUop=0;
SrcA=0;
SrcB=0;
PCsrc=0;
RD=1;
WR=1;
Datasrc=0;
end
 
always@(op or zero)
begin
  case(op)
  6'b000001: //addi
  	begin
    Exsel=1;
	PCwre=1;
	InsmenRW=1;
	Regdst=0;
	Regwre=1;
	ALUop=0;
	SrcA=0;
	SrcB=1;
	PCsrc=0;
	RD=0;
	WR=1;
	Datasrc=0;
    end
   6'b010000: //ori
    begin
    Exsel=0;
	PCwre=1;
	InsmenRW=1;
	Regdst=0;
	Regwre=1;
	ALUop=3;
	SrcA=0;
	SrcB=1;
	PCsrc=0;
	RD=0;
	WR=1;
	Datasrc=0;
    end
   6'b000000://add
   	begin
    Exsel=0;
	PCwre=1;
	InsmenRW=1;
	Regdst=1;
	Regwre=1;
	ALUop=0;
	SrcA=0;
	SrcB=0;
	PCsrc=0;
	RD=0;
	WR=1;
	Datasrc=0;
    end
   6'b000010: //sub
    begin
    Exsel=0;
	PCwre=1;
	InsmenRW=1;
	Regdst=1;
	Regwre=1;
	ALUop=1;
	SrcA=0;
	SrcB=0;
	PCsrc=0;
	RD=0;
	WR=1;
	Datasrc=0;
    end
   6'b010001: //and
    begin
    Exsel=0;
	PCwre=1;
	InsmenRW=1;
	Regdst=1;
	Regwre=1;
	ALUop=4;
	SrcA=0;
	SrcB=0;
	PCsrc=0;
	RD=0;
	WR=1;
	Datasrc=0;
    end
   6'b010010:  //or
    begin
    Exsel=0;
	PCwre=1;
	InsmenRW=1;
	Regdst=1;
	Regwre=1;
	ALUop=3;
	SrcA=0;
	SrcB=0;
	PCsrc=0;
	RD=0;
	WR=1;
	Datasrc=0;
    end
   6'b011000:  //sll
    begin
    Exsel=0;
	PCwre=1;
	InsmenRW=1;
	Regdst=1;
	Regwre=1;
	ALUop=2;
	SrcA=1;
	SrcB=0;
	PCsrc=0;
	RD=0;
	WR=1;
	Datasrc=0;
    end	  
   6'b110001: //bne
    begin
    Exsel=1;
	PCwre=1;
	InsmenRW=1;
	Regdst=1;
	Regwre=1;
	ALUop=1;
	SrcA=0;
	SrcB=0;
	RD=0;
	WR=1;
	Datasrc=0;
	if(zero==1)
	PCsrc=0;
	else
	PCsrc=1;
    end	
	6'b110000: //beq
    begin
    Exsel=1;
	PCwre=1;
	InsmenRW=1;
	Regdst=1;
	Regwre=1;
	ALUop=1;
	SrcA=0;
	SrcB=0;
	RD=0;
	WR=1;
	Datasrc=0;
	if(zero==1)
	PCsrc=1;
	else
	PCsrc=0;
    end	
    6'b011100: //slt
    begin
    Exsel=0;
	PCwre=1;
	InsmenRW=1;
	Regdst=1;
	Regwre=1;
	ALUop=5;
	SrcA=0;
	SrcB=0;
	PCsrc=0;
	RD=0;
	WR=1;
	Datasrc=0;
    end	  
    6'b100110:  //sw
    begin
    Exsel=1;
	PCwre=1;
	InsmenRW=1;
	Regdst=0;
	Regwre=0;
	ALUop=0;
	SrcA=0;
	SrcB=1;
	PCsrc=0;
	RD=0;
	WR=0;
	Datasrc=0;
    end	 
	6'b100111:  //lw
	begin
    Exsel=1;
	PCwre=1;
	InsmenRW=1;
	Regdst=0;
	Regwre=1;
	ALUop=0;
	SrcA=0;
	SrcB=1;
	PCsrc=0;
	RD=0;
	WR=1;
	Datasrc=1;
    end	 
	6'b110010:  //btgz
	begin
    Exsel=1;
	PCwre=1;
	InsmenRW=1;
	Regdst=0;
	Regwre=0;
	ALUop=1;
	SrcA=0;
	SrcB=0;
	RD=0;
	WR=1;
	Datasrc=0;
	if(zero==1)
	PCsrc=0;
	else if(sign==0)
	PCsrc=1;
	else
	PCsrc=0;
    end
	6'b111111: //half
	begin
    Exsel=0;
	PCwre=0;
	InsmenRW=1;
	Regdst=0;
	Regwre=0;
	ALUop=0;
	SrcA=0;
	SrcB=0;
	PCsrc=0;
	RD=1;
	WR=1;
	Datasrc=0;
    end
	6'b111000:  //j
    begin
    Exsel=0;
	PCwre=1;
	InsmenRW=1;
	Regdst=0;
	Regwre=0;
	ALUop=0;
	SrcA=0;
	SrcB=0;
	PCsrc=2;
	RD=1;
	WR=1;
	Datasrc=0;
    end
   endcase	 	 	   
end 
endmodule
