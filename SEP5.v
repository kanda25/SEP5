module SEP5(CLK,RST,D,Q);
	input CLK,RST,D;
	output Q;
	reg Q;
	
	always @(posedge CLK) 
		if(! RST)
			Q <= 1'b0;
		else
			Q <= D;
endmodule
		