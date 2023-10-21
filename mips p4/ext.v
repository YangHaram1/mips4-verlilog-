`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:21:57 12/03/2018 
// Design Name: 
// Module Name:    ext 
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
module ext(
    input [1:0] ExtOp,
    input [15:0] imm,
    output [31:0] A2
    );
	 
	 reg [31:0] Imm;
	 integer i;
	 initial begin
		Imm=0;
		i=0;
	 end

always @*begin
Imm=0;
case (ExtOp)
	0:
		begin
		Imm=imm;
		end
	1:
		begin
			if(imm[15]==0)begin
				Imm[15:0]=imm;
			end
			else begin
				for(i=16;i<32;i=i+1)begin
					Imm[i]=1;
				end
				Imm[15:0]=imm;
			end
		end
	2:
		begin
			for(i=16;i<32;i=i+1)begin
					Imm[i]=imm[i-16];
				end
		end

endcase
end

assign A2=Imm;
endmodule
