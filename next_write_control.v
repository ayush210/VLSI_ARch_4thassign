module next_wire(w_en,full_flag,w_next);
input w_en,full_flag;
output w_next;
reg w_next;
always @(*)
		begin
		if(w_en&&!full_flag)
		w_next = 1;
		else
		w_next = 0;
		end
endmodule
