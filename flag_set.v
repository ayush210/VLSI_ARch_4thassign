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

module test;
wire full_flag,empty_flag,almost_empty,almost_full,half_flag;
reg[7:0] diff_ptr;
flagset f(diff_ptr,full_flag,empty_flag,almost_empty,almost_full,half_flag);
//flagset f(diff_ptr,full_flag,empty_flag);
initial begin
$monitor($time,"%d %d %d %d %d",full_flag,empty_flag,almost_empty,almost_full,half_flag);
#5 diff_ptr = 0;
#5 diff_ptr = 255;
#5 diff_ptr = 127;
end
endmodule
