module clock1(
  input CLK, RST,
  input [2:0] nBUTTON,
  output [6:0] nHEX0, nHEX1, nHEX2, nHEX3
);

wire clr, minup, secup;

RemoveChatter b0(
  .CLK(CLK),
  .RST(RST),
  .nBIN(nBUTTON),
  .BOUT({clr,minup,secup})
);

wire en1hz;
cnt1sec CNT1SEC(
  .CLK(CLK),
  .RST(RST),
  .EN1HZ(en1hz)
);

wire [3:0] min1, sec1;
wire [2:0] min10, sec10;
wire cout, dummy;

cnt60 SEC(
  .CLK(CLK),
  .RST(RST),
  .CLR(clr),
  .CEN(en1hz),
  .INC(secup),
  .QH(sec10),
  .QL(sec1),
  .CA(cout)
);
cnt60 MIN(
  .CLK(CLK),
  .RST(RST),
  .CLR(clr),
  .CEN(cout),
  .INC(minup),
  .QH(min10),
  .QL(min1),
  .CA(dummy)
);

sevenSeg d0(.D(sec1), .Q( nHEX0[6:0]));
sevenSeg d1(.D(sec10), .Q( nHEX1[6:0]));
sevenSeg d2(.D(min1), .Q( nHEX2[6:0]));
sevenSeg d3(.D(min10), .Q( nHEX3[6:0]));

endmodule