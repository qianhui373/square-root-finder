
module run(num, root);

input[19:0] num;
output reg [19:0] root;

reg rt;
integer temp;

reg [19:0] i;

	always @(*) begin
		root = 20'd0;
		rt = 0;
		for(i = 0;i<(num/2);i = i+1) begin
			temp = i * i;
			if(temp == num) begin
			rt = 1;
			root = i;
			end
		end
	end

endmodule
