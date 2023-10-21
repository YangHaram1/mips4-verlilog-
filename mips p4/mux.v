`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:22:58 12/04/2018 
// Design Name: 
// Module Name:    mux 
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
module mux(
	 input mux_op,
    input [31:0] A1,
    input [31:0] A2,
	 output [31:0] A3
    );
	 reg [31:0] a3;
	 initial begin
		a3=0;
		end
	 
always@*begin
	if(mux_op)begin
		a3=A2;
	end
	else begin
		a3=A1;
	end
end

assign A3=a3;
endmodule
