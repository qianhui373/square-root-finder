`timescale 1ns/1ns
module tb_bit_corrupter();
	reg [2:0] index;
	reg [7:1] input_word;
	wire [7:1] output_word;
	
	reg [3:0] count;
	
	bit_corrupter M1(index, input_word, output_word);
	
	initial begin
		input_word = 7'b1111111;
		
		#50;
		
		for(count=0;count<8;count=count+1) begin 
			index = count;
			#50;
		end
		
		index = 0;
		#50;
		
	end
endmodule
