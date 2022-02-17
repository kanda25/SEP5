module SHIFTER(A,OpCode,Q,C);
  parameter NBITS = 4;
  input [NBITS-1:0] A;
  input [2:0] OpCode;
  output [NBITS-1:0] Q;
  output C;
  reg C;
  reg NextC;
  reg [NBITS-1:0] S;

  always @(OpCode)
    case(OpCode)
    3'b000 : begin
      S = (A <<< 1);
      C = A[NBITS-2];
    end
    3'b001 : begin
      S = (A >>> 1);
      C = A[0];
    end
    3'b010 : begin
      S = (A << 1);
      C = A[NBITS-1];
    end
    3'b011 : begin
      S = (A >> 1);
      C = A[0];
    end
    3'b100 : begin
      S = (A << 1);
      S[0] = A[NBITS-1];
      C = A[NBITS-1];
    end
    3'b101 : begin
      S = (A >> 1);
      S[NBITS-1] = A[0];
      C = A[0];
    end
    default : begin
      S = 4'b0000;
      C = 1'b0;
    end
    endcase

    assign Q = S;
endmodule