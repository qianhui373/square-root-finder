////////////////////////////////////////////////////////////////////////////////
// Filename:    tb_project3.v
// Author:      J.S. Thweatt
// Version:     1
// Description: This is the skeleton of a test bench for Project 3. UPDATE
//              THIS DESCRIPTION WHEN YOU IMPLEMENT YOUR TEST BENCH.

`timescale 1 ns/100 ps

module tb_project3();
//  Declare regs and wires.
	reg  [9:0] SW;
   wire [9:0] LED;
	wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

//  Instantiate system.
	project3Top M1(SW, LED, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);



//  Test the circuit functionality here. You should apply different combinations
//  of the inputs and observer the outputs for correctness.
	initial begin
		SW = 10'b0001111111;
		#50;
		SW[9:7] = SW[9:7] + 1;
		#50;
		SW[9:7] = SW[9:7] + 1;
		#50;
		SW[9:7] = SW[9:7] + 1;
		#50;
		SW[9:7] = SW[9:7] + 1;
		#50;
		SW[9:7] = SW[9:7] + 1;
		#50;
		SW[9:7] = SW[9:7] + 1;
		#50;
		SW[9:7] = SW[9:7] + 1;
		#200;
		
		//Try different SW[6:0] values
		SW = 10'b0000101110;
				#50;
		SW[9:7] = SW[9:7] + 1;
		#50;
		SW[9:7] = SW[9:7] + 1;
		#50;
		SW[9:7] = SW[9:7] + 1;
		#50;
		SW[9:7] = SW[9:7] + 1;
		#50;
		SW[9:7] = SW[9:7] + 1;
		#50;
		SW[9:7] = SW[9:7] + 1;
		#50;
		SW[9:7] = SW[9:7] + 1;
		#200;
	end


//  This is not the only module that you could have tested. As long as you can
//  write a test bench, add it to your project, and follow the instructions for
//  invoking ModelSim from Quartus, you can test any module that you create in
//  Quartus.

endmodule
