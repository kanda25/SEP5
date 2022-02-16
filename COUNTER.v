module COUNTER(CLK,RST,Q);
  parameter REG_NUM = 4,
            S0 = 4'b0000,
            S1 = 4'b0001,
            S2 = 4'b0010,
            S3 = 4'b0011,
            S4 = 4'b0100,
            S5 = 4'b0101,
            S6 = 4'b0110,
            S7 = 4'b0111,
            S8 = 4'b1000,
            S9 = 4'b1001,
            S10 = 4'b1010,
            S11 = 4'b1011,
            S12 = 4'b1100,
            S13 = 4'b1101,
            S14 = 4'b1110,
            S15 = 4'b1111;

  input CLK,RST;
  output [REG_NUM-1:0] Q;
  reg [REG_NUM-1:0] STATE;
  always @(posedge CLK)
  if(!RST)
    STATE <= 4'b0000;
  else
    case(STATE)
      S0 : STATE <= S1;
      S1 : STATE <= S2;
      S2 : STATE <= S3;
      S3 : STATE <= S4;
      S4 : STATE <= S5;
      S5 : STATE <= S6;
      S6 : STATE <= S7;
      S7 : STATE <= S8;
      S8 : STATE <= S9;
      S9 : STATE <= S10;
      S10 : STATE <= S11;
      S11 : STATE <= S12;
      S12 : STATE <= S13;
      S13 : STATE <= S14;
      S14 : STATE <= S15;
      S15 : STATE <= S0;
		default : STATE <= 4'b0000;
    endcase
  assign Q = STATE;
endmodule

