`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:56:12 10/18/2022
// Design Name:   FSM_Lift_new
// Module Name:   /home/ise/Xilinx_ISE_VM_Files/new/FSM_LIFT_tb.v
// Project Name:  new
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM_Lift_new
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_LIFT_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [1:0] rflr;
	reg [2:0] pin,pout;
	wire door;
	// Outputs
	wire [1:0] oflr;
	wire ol;
	wire fan;
	// Instantiate the Unit Under Test (UUT)
	FSM_Lift_new uut (
		.pin(pin),
		.pout(pout),
		.clk(clk), 
		.rst(rst), 
		.rflr(rflr), 
		.oflr(oflr),
		.door(door),
		.ol(ol),
		.fan(fan)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		rflr = 0;
		pin = 0;
		pout = 0;
		forever
			#10 clk = ~clk;
		end
		// Wait 100 ns for global reset to finish
		
		initial 
		begin
		#100
       //@(posedge(clk)) 
		 rst = 0; rflr = 2;pin = 1; pout = 0;
		#60
		 //@(posedge(clk))  
		 rflr = 0;pin = 7; pout = 0;
		#50 
		 //@(posedge(clk)) 
		 rflr = 2;pin = 4; pout = 1;
		#60
		// @(posedge(clk)) 
		 rflr = 1;pin =5; pout = 3;
		// Add stimulus here
		#60
		 //@(posedge(clk)) 
		 rflr = 1;pin =2; pout = 1;
		#60
		 //@(posedge(clk)) 
		 rflr = 2; pin =1; pout =0;
		#60
		 //@(posedge(clk)) 
		 rflr = 0; pin =2; pout = 1;
		#60
		 rflr = 2; pin =1; pout =0;
		#60
		 rflr = 1;pin =2; pout = 1;		 
	end
      
endmodule

