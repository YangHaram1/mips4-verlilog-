`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:41:05 12/02/2018 
// Design Name: 
// Module Name:    im 
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
module im(
	 input jr,
	 input jal,
    input nPc_sel,
    input zero,
    input clk,
	 input reset,
	 input [31:0]imm,
	 input [25:0]imm26,
	 input [31:0] jr31,
    output [31:0] zhiring,
	 output [31:0] PC
    );
	 
	 reg [31:0] im_reg[0:1023];
	 reg [31:0] pc;
	 
	 initial begin
	 $readmemh("code.txt",im_reg);
	 pc=32'h00003000;
	 end
	 
always@(posedge clk)begin

	if(reset)begin
		pc=32'h00003000;
	end
	else begin
	if(jr)begin
		pc=jr31;
	end
	else begin
			pc=pc+32'h4;
		 if(zero&&nPc_sel)begin
			pc=pc+imm*4;
		 end
		 else if(jal)begin
			pc=imm26*4;
		 end
	end
	end
end

assign zhiring=im_reg[(pc-32'h00003000)/4];
assign PC=pc;

	 
endmodule
