module ROM(CLK, RW, Index, D,Q);
  parameter N=2, M=2;
  input CLK,RW;
  input [N:1] Index;
  input [M-1:0] D;
  output [M-1:0] Q;
  reg [M-1:0] Q;
  reg [M-1:0] RegFile[N-1:0];
  
  always @(negedge CLK)
    if(RW)
      Q <= RegFile[Index];
    else
      RegFile[Index] <= D;
endmodule