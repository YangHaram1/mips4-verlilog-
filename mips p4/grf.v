`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:44:12 12/03/2018 
// Design Name: 
// Module Name:    grf 
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
module grf(
	 input JAL,
    input clk,
    input reset,
    input RegWrite,
	 input [1:0] ExtOp,
	 input ALUSrc,
    input [4:0] A1_adress,
    input [4:0] A2_adress,
    input [4:0] WD_adress,
    input [31:0] WD,
	 input [31:0] PC,
	 input [15:0]imm15,
    output [31:0] A1,
    output [31:0] A2,
	 output [31:0] imm31,
	 output [31:0] MemData,
	 output [31:0] jr31
    );
	 
	reg [31:0] grf[31:0];
	wire [31:0] A2_2;

	integer i;
	
	initial begin
	i=0;
	for(i=0;i<32;i=i+1)begin
		grf[i]=0;
	end
	end
	
always@(posedge clk)begin

	if(reset)begin
		for(i=0;i<32;i=i+1)begin
		grf[i]=0;
		end
	end
	else if(RegWrite)begin
		if(JAL)begin
			grf[31]=PC+4;
			$display("@%h: $31 <= %h",PC,PC+4);
		end
		else begin
			grf[WD_adress]=WD;
			$display("@%h: $%d <= %h",PC,WD_adress,WD);	
		end
		
	end
	grf[0]=0;
end

ext i0(ExtOp,imm15,A2_2);
mux i1(ALUSrc,grf[A2_adress],A2_2,A2);

assign imm31=A2_2;
assign A1=grf[A1_adress];
assign MemData=grf[A2_adress];
assign jr31=grf[31];
endmodule
