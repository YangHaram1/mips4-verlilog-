`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:37 12/03/2018 
// Design Name: 
// Module Name:    ctrl 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ctrl(
	 input clk,
    input [5:0] op,
    input [5:0] func,
	 output RegDst,
	 output ALUSrc,
	 output MemtoReg,
	 output RegWrite,
	 output nPC_Sel,
	 output [1:0] ExtOp,
	 output [1:0] AluOp,
	 output MemWrite,
	 output RegDst_1,
	 output jal,
	 output jr
    );
	reg ADDU;
	reg SUBU;
	reg ORI;
	reg LUI;
	reg BEQ;
	reg LW;
	reg SW;
	reg JAL;
	reg JR;
	reg NOP;
	
	reg [1:0] aluop;
	reg [1:0] extop;
	
	initial begin
	ADDU=0;
	SUBU=0;
	ORI=0;
	LUI=0;
	BEQ=0;
	SW=0;
	LW=0;
	aluop=0;
	extop=0;
	JAL=0;
	JR=0;
	NOP=0;
	end
	
always @*begin
ADDU=~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&~func[2]&~func[1]&func[0];
SUBU=~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&~func[2]&func[1]&func[0];
LW=op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0];
SW=op[5]&~op[4]&op[3]&~op[2]&op[1]&op[0];
BEQ=~op[5]&~op[4]&~op[3]&op[2]&~op[1]&~op[0];
ORI=~op[5]&~op[4]&op[3]&op[2]&~op[1]&op[0];
LUI=~op[5]&~op[4]&op[3]&op[2]&op[1]&op[0];
JAL=~op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0];
JR=~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&func[3]&~func[2]&~func[1]&~func[0];
NOP=~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&~func[2]&~func[1]&~func[0];

	if(ADDU|LW)begin
		aluop=0;
	end
	else if(SUBU)begin
		aluop=1;
	end
	else if(ORI)begin
		aluop=2;
	end
	else if(BEQ)begin
		aluop=1;
	end
	else	begin
		aluop=0;
	end
	
	
	if(ORI)begin
		extop=0;
	end
	else if(LW||SW||BEQ)begin
		extop=1;
	end
	else if(LUI)begin
		extop=2;
	end
	
end

assign RegDst_1=ORI|LUI|LW;
assign RegDst=ADDU|SUBU;
assign ALUSrc=ORI|SW|LUI|LW;
assign MemtoReg=LW;
assign RegWrite= ADDU|SUBU|LUI|LW|ORI|JAL;
assign nPC_Sel=BEQ;
assign ExtOp=extop;
assign AluOp=aluop;
assign MemWrite=SW;
assign jal=JAL;
assign jr=JR;
endmodule
