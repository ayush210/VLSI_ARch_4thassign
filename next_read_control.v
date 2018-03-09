module next_read(r_en,empty_flag,r_next);
input r_en,empty_flag;
output r_next;
reg r_next;
always @(*)
		begin
		if(r_en&&!empty_flag)
		r_next = 1;
		else
		r_next = 0;
		end
endmodule
