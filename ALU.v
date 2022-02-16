module ALU(A,B,OpCode,Q,C);
  parameter NBITS = 4;
  input [NBITS-1:0] A,B;
  input [2:0] OpCode;
  output [NBITS:0] Q;
  output C;
  reg [2:0] Mode;
  reg [NBITS:0] S;

  always @(OpCode)
    case(OpCode)
    3'b000 : S = A + B;
    3'b001 : S = A - B;
    3'b010 : S = A + B + 1;
    3'b011 : S = A - B - 1;
    3'b100 : S = A & B;
    3'b101 : S = A | B;
    3'b110 : S = A ^ B;
    3'b111 : S = {1'b0 + ~B};
    default : S = 5'b00000;
    endcase
  assign Q = S;
  assign C = Q[NBITS];
endmodule