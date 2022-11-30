module SW2dec (switches, dec, leds);
	input [9:0]	 switches;
	output [9:0] leds;
	output [3:0] dec;
	
	reg [9:0] leds;
	reg [3:0] dec;
	
	always @(switches) begin
		casex(switches)
			10'bxxxxxxxxx1:dec = 4'd0;
			10'bxxxxxxxx10:dec = 4'd1;
			10'bxxxxxxx100:dec = 4'd2;
			10'bxxxxxx1000:dec = 4'd3;
			10'bxxxxx10000:dec = 4'd4;
			10'bxxxx100000:dec = 4'd5;
			10'bxxx1000000:dec = 4'd6;
			10'bxx10000000:dec = 4'd7;
			10'bx100000000:dec = 4'd8;
			10'b1000000000:dec = 4'd9;
			default:dec = 4'd0;
		endcase
		leds = 1<<dec;
	end
endmodule