module MooreFSM(A,ClkM, Z);
	input A,ClkM;
	output Z;
	reg Z;
	
	parameter S0 = 0,
						S1 = 1,
						S2 = 2,
						S3 = 3;

	reg [1:0] MooreState;

	always @(posedge ClkM)
		case (MooreState)
			S0 :
				begin
					Z <= 1;
					MooreState <= (! A) ? S0 : S2;
				end

			S1 :
				begin
					Z <= 0;
					MooreState <= (! A) ? S0 : S2;
				end
			
			S2 :
				begin
					Z <= 0;
					MooreState <= (! A) ? S2 : S3;
				end
			
			S3 :
				begin
					Z <= 1;
					MooreState <= (! A) ? S1 : S3;
				end
		endcase
endmodule
