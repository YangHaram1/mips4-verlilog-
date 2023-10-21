`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:03 12/02/2018 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset,
	 output alusrc,
	 output [1:0] aluop,
	 output [4:0] a1_a,
	 output [4:0] a2_a,
	 output [31:0] a1,
	 output [31:0] a2,
	 output [31:0] pc
    );
	 
	 wire [11:2] MemAddr;
	 
	 
	 wire nPc_Sel;
	 wire zero;
	 wire RegDst;
	 wire RegDst_1;
	 wire ALUSrc;
	 wire MemtoReg;
	 wire RegWrite;
	 wire MemWrite;
	 wire jal;
	 
	 wire [1:0] ExtOp;
	 wire [1:0] AluOp;
	 
	 wire [4:0] WD_adress;
	 
	 wire [31:0] PC;
	 wire [31:0] zhiring;
	 wire [31:0] A1;
	 wire [31:0] A2;
	 wire [31:0] wd;
	 wire [31:0] WD;
	 wire [31:0] dout;
	 wire [31:0] MemData;
	 wire [31:0] imm31;
	 wire [31:0] jr31;
	 wire jr;
	 
		im i0(jr,jal,nPc_Sel,zero,clk,reset,imm31,zhiring[25:0],jr31,zhiring,PC);
		ctrl i1(clk,zhiring[31:26],zhiring[5:0],RegDst,ALUSrc,MemtoReg,RegWrite,nPc_Sel,ExtOp,AluOp,MemWrite,RegDst_1,jal,jr);
		grf i2(jal,clk,reset,RegWrite,ExtOp,ALUSrc,zhiring[25:21],zhiring[20:16],WD_adress,WD,PC,zhiring[15:0],A1,A2,imm31,MemData,jr31);
		alu i3(clk,A1,A2,AluOp,wd,zero,MemAddr); 
		dm i4(clk,reset,MemWrite,MemAddr,MemData,PC,dout);
		mux i5(MemtoReg,wd,dout,WD);
		regaddr i6(zhiring,RegDst,RegDst_1,WD_adress);
		
		assign alusrc=ALUSrc;
		assign aluop=AluOp;
		assign a1=A1;
		assign a2=A2;
		assign a1_a=zhiring[25:21];
		assign a2_a=zhiring[20:16];
		assign pc=PC;

endmodule
