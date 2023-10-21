`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:06:25 12/03/2018 
// Design Name: 
// Module Name:    alu 
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
module alu(
	 input clk,
    input [31:0] A1,
    input [31:0] A2,
	 input [1:0] AluOp,
    output [31:0] A3,
    output zero,
	 output [11:2] MemAddr
    );
	reg [31:0] sum;
	reg ze;
	initial begin
		sum=0;
		ze=0;
	end
	 
always@*begin
	case(AluOp)
		0:begin
			sum=A1+A2;
		end
		1:begin
			sum=A1-A2;
		end
		2:begin
			sum=A1|A2;
		end
	endcase
	
	if(sum==0)begin
		ze=1;
	end
	else begin
		ze=0;
	end
	
end
assign A3=sum;
assign zero=ze;
assign MemAddr=sum;

endmodule
