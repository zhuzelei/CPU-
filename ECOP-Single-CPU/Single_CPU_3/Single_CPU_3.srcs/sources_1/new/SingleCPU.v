`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/5/18 15:35:05
// Design Name: 
// Module Name: SingleCPU
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


module SingleCPU
(
 input BTNR,
 input CLK,
 input Reset,
 
 input SWin1,
 input SWin2,
 
 output [3:0] G,//…®√Ë 
 output [7:0] dispcode
);

wire [5:0] op;
wire [4:0] rs;
wire [4:0] rt;
wire [4:0] rd;
wire [15:0] immediate;
wire [31:0] readdata1;
wire [31:0] readdata2;
wire [31:0] writedata;
wire [31:0] dataout;
wire [31:0] address;
wire [31:0] result;
wire [2:0] ALUop;
wire ALUsrcA;
wire ALUsrcB;

wire [31:0] srcA,srcB,newaddress;
wire [31:0] address_4,eximmediate,address_ex,jaddress;
wire [25:0] jumpaddress;
wire [4:0] writereg,sa;
wire [31:0] SA;
wire [1:0] PCsrc;
wire sign,zero,PCwre,regdst,regwre,InsmenRW,Extsel,RD,WR,datasrc;
wire clkdiv;
wire [7:0] show1,show2;
wire [7:0] rsaddr;
wire [7:0] rtaddr;
wire [7:0] display1;
wire [7:0] display2;
wire [7:0] display3;
wire [7:0] display4;

PC pc(BTNR,Reset,PCwre,newaddress,address);
insMEN im(address,op,rs,rt,rd,sa,immediate,jumpaddress);
regFILE regfile(BTNR,regwre,rs,rt,writereg,writedata,readdata1,readdata2);
ControlUnit1 cu(sign,zero,op,Extsel,PCwre,insmenRW,regdst,regwre,ALUop,ALUsrcA,ALUsrcB,PCsrc,RD,WR,datasrc);
ALU alu(ALUop,srcA,srcB,zero,sign,result);
signZE se(immediate,Extsel,eximmediate);
Datamemory dm(BTNR,RD,WR,result,readdata2,dataout);

assign address_4=address+4;
assign address_ex=address_4+(eximmediate<<2);
assign jaddress[31:28]=address_4[31:28];
assign jaddress[27:2]=jumpaddress;
assign jaddress[1:0]=2'b00;
assign SA[31:5]=27'b000000000000000000000000000;
assign SA[4:0]=sa;

assign rsaddr[4:0]=rs;
assign rsaddr[7:5]=3'b000;

assign rtaddr[4:0]=rt;
assign rtaddr[7:5]=3'b000;

MUL5  m(regdst,rt,rd,writereg);
MUL32 A(ALUsrcA,readdata1,SA,srcA);
MUL32 B(ALUsrcB,readdata2,eximmediate,srcB);
MUL32 DB(datasrc,result,dataout,writedata);
ChsePC cpc(PCsrc,address_4,address_ex,jaddress,newaddress);

clock_div div(CLK,clkdiv);
SaoMiao Turn(clkdiv,G);
showwhat show(SWin1,SWin2,address[7:0],newaddress[7:0],rsaddr,readdata1[7:0],rtaddr,readdata2[7:0],result[7:0],writedata[7:0],show1,show2);
SegLED7 sg1(show1[7:4],display1);
SegLED7 sg2(show1[3:0],display2);
SegLED7 sg3(show2[7:4],display3);
SegLED7 sg4(show2[3:0],display4);
fnshow  fs(G,display1,display2,display3,display4,dispcode);


endmodule
