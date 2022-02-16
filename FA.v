module FA(
  input A,B,D,
  output S,C
);
  wire tmp1,tmp2,tmp3;
  HA HA0(
    .A(A),
    .B(B),
    .XOR(tmp1),
    .AND(tmp2)
  );
  HA HA1(
    .A(tmp1),
    .B(D),
    .XOR(S),
    .AND(tmp3)
  );

  assign
  C = tmp2 | tmp3;
endmodule