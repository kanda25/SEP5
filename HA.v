module HA(
  input A,B,
  output XOR,AND
);
  assign XOR = A^B;
  assign AND = A&B;
endmodule