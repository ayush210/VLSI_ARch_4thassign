module next_write(w_en,full_flag,w_next);
input w_en,full_flag;
output w_next;
reg w_next;
always @(*)
		begin
		if(w_en&&full_flag)
		w_next = 1;
		else
		w_next = 0;
		end
endmodule

module next_read(r_en,empty_flag,r_next);
input r_en,empty_flag;
output r_next;
reg r_next;
always @(*)
		begin
		if(r_en&&empty_flag)
		r_next = 1;
		else
		r_next = 0;
		end
endmodule

/*module counter(in,en,clk);
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
endmodule*/

/*module test;
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
endmodule*/


/*module dual_port_ram(w_en,data_in,w_clk,w_ptr,r_en,data_out,r_clk,r_ptr,full_flag,empty_flag);
input full_flag;
input empty_flag;
reg[7:0] memory[0:255];
input[7:0] w_ptr,r_ptr;
input[7:0] data_in;
output[7:0] data_out;
input w_en;
input r_en;
input w_clk,r_clk;
wire[7:0] w_ptr,r_ptr,data_in;
reg[7:0] data_out;
wire w_en,r_en,w_clk,r_clk;
always @(posedge w_clk)
begin
	if(w_en&&!full_flag)
			begin
				memory[w_ptr]<=data_in;
			end
end
always @(posedge r_clk)
		begin
		if(r_en&&!empty_flag)
		begin
		data_out<=memory[r_ptr];
		end
		end
endmodule*/

/*module counter(in,en,clk);
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
endmodule*/

module pointer_diff(write_ptr,read_ptr,diff_out);
input[7:0] write_ptr,read_ptr;
output[7:0] diff_out;
wire[7:0] write_ptr,read_ptr;
reg[7:0] diff_out;
always @(*)
		begin
		if(write_ptr>=read_ptr)
		diff_out <= write_ptr-read_ptr;
		else 
		diff_out <= (256-read_ptr) + write_ptr;
		end
endmodule

/*module test;
reg[7:0] in1,in2;
wire[7:0] out;
pointer_diff d(in1,in2,out);
initial begin
$monitor($time,"%d",out);
#5 in1 = 0;in2 = 0;
#5 in1 = 1; in2 = 2;
#5 in2 = 2; in1 = 1;
end
endmodule*/

/*module test;
reg clk;
wire[7:0] in;
reg en;
counter c(in,en,clk);
always @(*)
		begin
#5 clk<= ~clk;
		end
		initial begin
		$monitor("%d",in);
		en = 0;clk = 0;
#50 $finish;
		end
endmodule*/

/*module test;

reg w_en,r_en,w_clk,r_clk;
reg[7:0] data_in;
wire[7:0] data_out;
reg[7:0] w_ptr,r_ptr;
reg full_flag,empty_flag;
dual_port_ram r(w_en,data_in,w_clk,w_ptr,r_en,data_out,r_clk,r_ptr,full_flag,empty_flag);
always @(*)
		begin
#5 w_clk <=  ~w_clk;
		end
always @(*)
		begin
#10 r_clk <= ~r_clk;
		end
initial begin
$monitor($time,"%d %d %d %d",data_in,data_out,w_ptr,r_ptr);
full_flag = 0;empty_flag = 0;w_clk = 0;r_clk = 0;w_en = 1;r_en = 1;w_ptr = 0; r_ptr = 0;
#5 data_in <= 1; w_ptr <=  1; r_ptr <=  1;
#10 data_in <=  2;w_ptr <= 2; r_ptr <= 2;
#10 data_in <= 3;w_ptr <= 3; r_ptr <= 3;
end

endmodule*/

module dual_port_ram(w_en,data_in,w_clk,w_ptr,r_en,data_out,r_clk,r_ptr,full_flag,empty_flag);
input full_flag;
input empty_flag;
reg[7:0] memory[0:255];
input[7:0] w_ptr,r_ptr;
input[7:0] data_in;
output[7:0] data_out;
input w_en;
input r_en;
input w_clk,r_clk;
wire[7:0] w_ptr,r_ptr,data_in;
reg[7:0] data_out;
wire w_en,r_en,w_clk,r_clk;
always @(posedge w_clk)
begin
	if(w_en&&!full_flag)
			begin
				memory[w_ptr]<=data_in;
			end
end
always @(posedge r_clk)
		begin
		if(r_en&&!empty_flag)
		begin
		data_out<=memory[r_ptr];
		end
		end
endmodule

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

/*module pointer_diff(write_ptr,read_ptr,diff_out);
input[7:0] write_ptr,read_ptr;
output[7:0] diff_out;
wire[7:0] write_ptr,read_ptr;
reg[7:0] diff_out;
always @(*)
		begin
		if(write_ptr>read_ptr)
		diff_out <= write_ptr-read_ptr;
		else 
		diff_out <= (256-read_ptr) + write_ptr;
		end
endmodule*/

/*module test;
reg[7:0] in1,in2;
wire[7:0] out;
pointer_diff d(in1,in2,out);
initial begin
$monitor("%d",out);
#5 in1 = 0;in2 = 0;
#5 in1 = 1; in2 = 2;
#5 in2 = 2; in1 = 1;
end
endmodule*/

/*module test;
reg clk;
wire[7:0] in;
reg en;
counter c(in,en,clk);
always @(*)
		begin
#5 clk<= ~clk;
		end
		initial begin
		$monitor("%d",in);
		en = 0;clk = 0;
#50 $finish;
		end
endmodule*/

module flagset(diff_ptr,full_flag,empty_flag,almost_empty,almost_full,half_flag);
input[7:0] diff_ptr;
output full_flag,empty_flag,almost_empty,almost_full,half_flag;
reg full_flag,empty_flag,almost_empty,almost_full,half_flag;
always @(*)
		begin
		casex (diff_ptr)
		0: begin 
		empty_flag =1;
		full_flag = 0;
		almost_full = 0;
		almost_empty = 1;
		half_flag = 0;
		end
		255:begin
		full_flag = 1;
		empty_flag = 0;
		almost_full  = 1;
		almost_empty = 0;
		half_flag = 0;
		end
		127:begin
		half_flag = 1;
		empty_flag = 0;
		full_flag = 0;
		almost_full = 0;
		almost_empty = 0;
		end
		8'b11111xxx:begin
		if(diff_ptr!=255)
		begin
		half_flag = 0;
		empty_flag = 0;
		full_flag = 0;
		almost_full = 1;
		almost_empty = 0;
		end
		end
		8'b00000xxx:begin
		if(diff_ptr!=0)
		begin
		half_flag = 0;
		empty_flag =0;
		full_flag = 0;
		almost_full = 0;
		almost_empty = 1;
		end
		end
		default:begin
		empty_flag=0;
		full_flag=0;
		almost_full = 0;
		almost_empty = 0;
		half_flag = 0;
		end
		endcase
		end
		initial begin
		full_flag = 0;
		empty_flag = 0;
		almost_empty = 0;
		almost_full = 0;
		half_flag  =0 ;
		end
endmodule

module asynchronous_fifo;

reg w_en,w_clk,r_en,r_clk;
reg[7:0] data_in;
wire[7:0] data_out;
wire[7:0] w_ptr,r_ptr;
wire w_next,r_next;
wire full_flag,empty_flag,almost_empty,almost_full,half_flag;
wire[7:0] diff_ptr;

counter c(w_ptr,w_next,w_clk);
counter c1(r_ptr,r_next,r_clk);
pointer_diff p(w_ptr,r_ptr,diff_ptr);  
dual_port_ram d(w_en,data_in,w_clk,w_ptr,r_en,data_out,r_clk,r_ptr,full_flag,empty_flag);
flagset f(diff_ptr,full_flag,empty_flag,almost_empty,almost_full,half_flag);
next_write nw(w_en,full_flag,w_next);
next_read nr(r_en,empty_flag,r_next);

always @(*)
		begin
#5 w_clk <= ~w_clk;
		end
		always @(*)
		begin
#10 r_clk <= ~r_clk;		
		end

initial begin
$monitor($time,"%d %d",data_in,data_out);
w_clk = 0;r_clk = 0;w_en = 1;r_en = 1;
#5 data_in = 1;
#10 data_in = 2;
#10 data_in = 3;
#80 $finish;
end

endmodule
