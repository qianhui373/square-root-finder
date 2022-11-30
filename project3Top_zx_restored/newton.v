

module newton(in_dec, out_dec);
   input [23:0] in_dec;
   output [19:0] out_dec;   
   
   wire [19:0] in_Val;
   reg  [16:0] outVal;
   reg  [16:0] guessVal;
   
   

   run u1(in_Val, guessVal);


   assign in_Val = in_dec[23:20]*20'd100000 +
						 in_dec[19:16]*20'd10000 +
						 in_dec[15:12]*20'd1000 +
						 in_dec[11:8]*20'd100 +
						 in_dec[7:4]*20'd10 +
						 in_dec[3:0];
   
   assign out_dec = 	outVal[0]*20'd1 +
							outVal[1]*20'd2 +
							outVal[2]*20'd4 +
							outVal[3]*20'd8 +
							outVal[4]*20'd16 +
							outVal[5]*20'd32 +
							outVal[6]*20'd64 +
							outVal[7]*20'd128 +
							outVal[8]*20'd256 +
							outVal[9]*20'd512 +
							outVal[10]*20'd1024 +
							outVal[11]*20'd2048 +
							outVal[12]*20'd4096 +
							outVal[13]*20'd8192 +
							outVal[14]*20'd16384 +
							outVal[15]*20'd32768 +
							outVal[16]*20'd65536;
   
	
   always@(in_Val) begin
		if(in_Val == 0)
			outVal = 0;
		else begin
			while(in_Val > 0) begin

				outVal= 0.5*(guessVal + in_Val/guessVal);
				if(outVal == guessVal) begin
					break;
				end
				else begin
					guessVal = outVal;
				end
	
			end
		end
   end

   
   

endmodule