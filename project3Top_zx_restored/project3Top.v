


module project3Top(CLOCK_50, SW, KEY, LED, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input        CLOCK_50;
	input  [9:0] SW;
	input  [2:0] KEY;
	output [9:0] LED;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	wire 		push, sqrt, reset;
	wire [3:0]	push_num;
	wire [23:0] sqrt_dec;
	
	reg [23:0] hexDigits, input_num_dec;
	reg 		state;
	
	parameter get_num=1'b0, get_root=1'b1;
	
	
	// SW to deicmal encoder, and LEDs
	SW2dec F1 (.switches(SW),
			   .dec(push_num),
			   .leds(LED));
	
	// square root finder
	newton F2 (.in_dec(input_num_dec), .out_dec(sqrt_dec));

	
	
	assign reset = KEY[1];
	
	// 7-segment display driver
	seven_seg_driver S0(hexDigits[3:0],HEX0);
	seven_seg_driver S1(hexDigits[7:4],HEX1);
	seven_seg_driver S2(hexDigits[11:8],HEX2);
	seven_seg_driver S3(hexDigits[15:12],HEX3);
	seven_seg_driver S4(hexDigits[19:16],HEX4);
	seven_seg_driver S5(hexDigits[23:20],HEX5);
	
	keypressed U1 (.clock(CLOCK_50),			// 50 MHz FPGA Clock
				  .reset(reset),				// KEY2 is the system reset.
				  .enable_in(KEY[2]),			// KEY2 provides the push input
				  .enable_out(push));			// push pulse
	
	keypressed U2 (.clock(CLOCK_50),			// 50 MHz FPGA Clock
				  .reset(reset),				// KEY2 is the system reset.
				  .enable_in(KEY[0]),			// KEY0 provides the sqrt input
				  .enable_out(sqrt));			// sqrt pulse
	
	
	
	
	
	// initial conditions
	initial begin
		state = get_num;
		input_num_dec = 24'h000000;
	end
	
	// state machine
	always @(posedge CLOCK_50 or negedge reset) begin
	
		// reset behevior, back to initial conditions
		if (reset==1'b0) begin
			state = get_num;
			input_num_dec = 24'h000000;
		end
		
		else begin
			case(state)
				get_num: begin
				
					if(sqrt)
						state = get_root;	// go to get_root state
						
					else if(push && input_num_dec[23:20]==4'b0000) begin	// push pulse is true and left most digit of input_num_dec is 0
						input_num_dec = input_num_dec<<4;	// push push_num
						input_num_dec = input_num_dec + push_num;
					end
					
					//hexDigits = input_num_dec;
					hexDigits = input_num_dec;
				end
				
				get_root: begin
					hexDigits = sqrt_dec;
				end
			endcase
		end
	end
	


	


endmodule
