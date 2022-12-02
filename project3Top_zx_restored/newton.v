

module newton(in_dec, out_dec);
   input [23:0] in_dec;
   output [23:0] out_dec;   
   
   wire [31:0] inVal;
   reg  [31:0] outVal;
   //reg  [19:0] outVal;
   
   //run u1(.num(inVal), .root(outVal));


   assign inVal = in_dec[23:20]*20'd100000 +
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
function [15:0] sqrt;
    input [31:0] num;  //declare input
    //intermediate signals.
    reg [31:0] a;
    reg [15:0] q;
    reg [17:0] left,right,r;    
    integer i;
begin
    //initialize all the variables.
    a = num;
    q = 0;
    i = 0;
    left = 0;   //input to adder/sub
    right = 0;  //input to adder/sub
    r = 0;  //remainder
    //run the calculations for 16 iterations.
    for(i=0;i<16;i=i+1) begin 
        right = {q,r[17],1'b1};
        left = {r[15:0],a[31:30]};
        a = {a[29:0],2'b00};    //left shift by 2 bits.
        if (r[17] == 1) //add if r is negative
            r = left + right;
        else    //subtract if r is positive
            r = left - right;
        q = {q[14:0],!r[17]};       
    end
    sqrt = q;   //final assignment of output.
end
endfunction //end of Function

always @(*) begin
		outVal = sqrt(inVal);
end


endmodule