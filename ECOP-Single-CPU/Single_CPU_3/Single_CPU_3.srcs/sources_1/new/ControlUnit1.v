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
 
 output reg Exsel,//�жϷ���λ��չ��ʽ   1-����λ  0-����չ
 output reg PCwre,//�Ƿ�ͣ�� 0-ͣ�� 1-��ͣ
 output reg InsmenRW,//InstructionMemory������д 0-д 1-��
 output reg Regdst,//ѡ��rt����rd��Ϊд�Ĵ��� 0-rt  1-rd
 output reg Regwre,//�жϼĴ������Ƿ����д�� 0-��д 1-д 
 output reg [2:0] ALUop,//ALU�Ĳ���ѡ��
 output reg SrcA,// 0-�Ĵ�����data1 1-sa��λ��
 output reg SrcB,//0-�Ĵ�����data2  1-��չ���������
 output reg [1:0] PCsrc,//����pci��ת��ʽ 0-pc+4  1-bne��beq   2-jump
 output reg RD,//1-��
 output reg WR,//1-д
 output reg Datasrc//�ж�������Դ 0-ALU��� 1-�������ݴ洢��
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
