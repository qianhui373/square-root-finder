

module newton(in_dec, out_dec);
   input [23:0] in_dec;
   output [23:0] out_dec;   
   
   wire [19:0] in_Val;
   reg  [19:0] outVal;
   reg  [19:0] guessVal;
   
   run u1(in_Val, guessVal);


   assign in_Val = in_dec[23:20]*20'd100000 +
						 in_dec[19:16]*20'd10000 +
						 in_dec[15:12]*20'd1000 +
						 in_dec[11:8]*20'd100 +
						 in_dec[7:4]*20'd10 +
						 in_dec[3:0];
   
   	assign out_dec[23:20] = (outVal/20'd100000) ;
	
   	assign out_dec[19:16] = (outVal - out_dec[23:20] *20'd100000) / 20'd10000;

   	assign out_dec[15:12] = (outVal - out_dec[23:20] *20'd100000 - 
										out_dec[19:16] * 20'd10000) / 20'd1000;

   	assign out_dec[11:8] = (outVal - out_dec[23:20] *20'd100000 - 
										out_dec[19:16] * 20'd10000 -
										out_dec[15:12] *20'd1000) / 20'd100;

	assign out_dec[7:4] = (outVal - out_dec[23:20] *20'd100000 - 
									out_dec[19:16] * 20'd10000 -
									out_dec[15:12] *20'd1000 - 
									out_dec[11:8]*20'd100) / 20'd10;

	assign out_dec[3:0] = (outVal - out_dec[23:20] *20'd100000 - 
									out_dec[19:16] * 20'd10000 -
									out_dec[15:12] *20'd1000 - 
									out_dec[11:8]*20'd100- 
									out_dec[7:4]*20'd10) ;
   
always@(in_Val) begin
	if(in_Val == 0)	
		outVal = 0;
	else begin
		outVal = (guessVal + in_Val/guessVal)>>1;
		while(outVal != guessVal) begin
			guessVal = outVal;
			outVal = (guessVal + in_Val/guessVal)>>1;
		end
	end
end
 
   
   

endmodule