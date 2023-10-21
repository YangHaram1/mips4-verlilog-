`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:56:36 12/17/2018 
// Design Name: 
// Module Name:    regaddr 
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
module regaddr(
    input [31:0] zhiring,
    input RegDst,
    input RegDst_1,
    output [4:0] WD_adress
    );
	 
	 reg [4:0] regaddr;
	 initial begin
		regaddr=0;
	 end
always @*begin
	if(RegDst)begin
		regaddr=zhiring[15:11];
	end
	else if(RegDst_1)begin
		regaddr=zhiring[20:16];
	end
	else begin
		regaddr=0;
	end
	
end
	 
assign WD_adress=regaddr;
endmodule
