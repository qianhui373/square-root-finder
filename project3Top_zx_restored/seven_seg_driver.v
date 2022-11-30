module seven_seg_driver(din,HEX);
	input [3:0] din;
	output [6:0] HEX;
	
	reg [6:0] HEX;
	
	always@(*) begin
		case(din)
			//0 - 3
			4'b0000: HEX = 7'b100_0000;
			4'b0001: HEX = 7'b111_1001;
			4'b0010: HEX = 7'b010_0100;
			4'b0011: HEX = 7'b011_0000;
			//4-7
			4'b0100: HEX = 7'b001_1001;
			4'b0101: HEX = 7'b001_0010;
			4'b0110: HEX = 7'b000_0010;
			4'b0111: HEX = 7'b111_1000;
			//8-11
			4'b1000: HEX = 7'b000_0000;
			4'b1001: HEX = 7'b001_1000;
			4'b1010: HEX = 7'b000_1000;
			4'b1011: HEX = 7'b000_0011;
			//12-15
			4'b1100: HEX = 7'b100_0110;            
			4'b1101: HEX = 7'b010_0001;            
			4'b1110: HEX = 7'b000_0110;            
			4'b1111: HEX = 7'b000_1110;

		endcase
	end

endmodule
