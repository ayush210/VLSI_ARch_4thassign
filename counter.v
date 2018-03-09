module counter(in,en,clk);
input clk;
input en;
output[7:0] in;
reg[7:0] in;
always @(posedge clk)
		begin
		if(!en)
		begin
		in <= in + 1;
		end
		end	
		initial begin
		in = 0;
		end
endmodule

module test;
reg clk;
wire[7:0] in;
reg en;
counter c(in,en,clk);
always @(*)
		begin
#5 clk <= ~clk;
		end
		initial 
		begin
		$monitor("%d",in);
		en = 0;clk = 0;
		#50 $finish;
		end
endmodule


