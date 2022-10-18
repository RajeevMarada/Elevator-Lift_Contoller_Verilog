`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:23:10 10/18/2022 
// Design Name: 
// Module Name:    FSM_Lift_new 
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
module FSM_Lift_new(pin,pout,clk,rst,rflr,oflr,door,ol,fan
    );
	input [2:0] pin,pout;
	input clk,rst;
	input [1:0] rflr;
	output reg door;
	reg [1:0] cst,nst;
	output [1:0] oflr;
	output reg ol;
	wire [2:0] c;
	output reg fan;
	parameter g = 2'b00,
				 f = 2'b01,
				 s = 2'b10;
				 
				 
	assign oflr = cst;
	assign c = pin-pout;
	
	
	always@(posedge(clk) or posedge(rst))
		begin
			if(rst)
				begin
					cst<=g;
					//door <= 1;
					//ol<=0;
					//fan<=0;
				end
			else
				begin
					cst<=nst;					
				end	
		end
		
	always@(rflr or cst)
		begin
		nst<=g;
		if(c<6)
		begin
			ol<=0;
			if(cst<rflr)
				begin
					nst <= cst+1;
					door <= 0;
					fan<=1;
				end
			else if(cst>rflr)
				begin
					nst<= cst-1;
					door <=0;
					fan<=1;
				end
			else
				begin
					nst<=cst;
					door <= 1;
					fan<=0;
				end  
		end
		else
			begin
			nst<=cst;
			ol <= 1;
			door <= 1;
			fan<=0;
			end
	end


endmodule
