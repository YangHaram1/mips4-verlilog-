`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:55:25 12/03/2018 
// Design Name: 
// Module Name:    dm 
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
module dm(
    input clk,
    input reset,
    input MemWrite,
    input [11:2] MemAddr,
    input [31:0] MemData,
	 input [31:0] PC,
    output [31:0] dout
    );
	reg [31:0] data[1023:0];
	reg [31:0] addr;
	integer i;
	
	initial begin
	for(i=0;i<1024;i=i+1)begin
		data[i]=0;
	end
	end
	
always@(posedge clk)begin
	if(reset)begin
		for(i=0;i<1024;i=i+1)begin
			data[i]=0;
		end
	end
	else if(MemWrite)begin
		data[MemAddr]=MemData;
		addr=MemAddr;
		$display("@%h: *%h <= %h",PC,addr,MemData);
	end
	
end
assign dout=data[MemAddr];
endmodule
