




`timescale 1 ns/1 ns

module tb_run();

   reg [19:0] valIn;
   wire [19:0]initValue;

   run u3(valIn, initValue);

   initial begin
	
	valIn = 20'd5;
	#20;
	valIn = 20'd10;
	#20;
	valIn = 20'd25;
	#20;
	valIn = 20'd49;
	#20;
	valIn = 20'd86;
	#20;
	valIn = 20'd156;
	#20;
	valIn = 20'd431;
	#20;
	valIn = 20'd587;
	#20;
	


   end
endmodule