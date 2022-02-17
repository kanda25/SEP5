module sevenSeg(
  input [3:0] D,
  output reg [6:0] Q
);

always @* begin
  case(D)
    4'h0: Q = 7'b1000000;
    4'h1: Q = 7'b1111001;
    4'h2: Q = 7'b0100100;
    4'h3: Q = 7'b0110000;
    4'h4: Q = 7'b0011001;
    4'h5: Q = 7'b0010010;
    4'h6: Q = 7'b0000010;
    4'h7: Q = 7'b1011000;
    4'h8: Q = 7'b0000000;
    4'h9: Q = 7'b0010000;
    default: Q = 7'b1111111;
    endcase
end
endmodule