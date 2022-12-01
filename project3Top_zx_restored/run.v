

module run(valIn, initValue);
   input [19:0] valIn;
   
   reg [19:0] zone;
   output [19:0]initValue;
   reg [19:0]initValue;
   //wire [18:0] num;
   integer n;
   
   always@(valIn or zone) begin
		n = 0;
		zone = 20'd9;
		while(valIn>0) begin
			if(valIn < zone) begin
				initValue = 2**(n+1);
				break;
		
			end
			else begin
	        zone = zone<<2;
	        n = n + 1;
			end
		end   
   end


endmodule