module clocktest(
  input CLK,RST,
  output[6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5
);
/*ten time clock*/
wire en1hz;
en100hz c0(
  .CLK(CLK),
  .RST(RST),
  .EN1HZ(en1hz)
);

wire [3:0] QLsec;
wire [2:0] QHsec;
wire CtoMin;
cnt60 sec(
  .CLK(CLK),
  .RST(RST),
  .CLR(CLR),
  .EN(1'b1),
  .en1hz(en1hz),
  .QL(QLsec),
  .QH(QHsec),
  .CA(CtoMin)
);

wire [3:0] QLmin;
wire [2:0] QHmin;
wire CtoHour;
cnt60 min(
  .CLK(CLK),
  .RST(RST),
  .CLR(CLR),
  .EN(CtoMin),
  .en1hz(en1hz),
  .QL(QLmin),
  .QH(QHmin),
  .CA(CtoHour)
);

wire [2:0] QLhour;
wire [1:0] QHhour;
cnt24 hour(
  .CLK(CLK),
  .RST(RST),
  .CLR(CLR),
  .ENsec(CtoMin),
  .ENmin(CtoHour),
  .en1hz(en1hz),
  .QL(QLhour),
  .QH(QHhour)
);

sevenSeg s0(
  .D(QLsec),
  .Q(HEX0[6:0])
);
sevenSeg s1(
  .D(QHsec),
  .Q(HEX1[6:0])
);
sevenSeg s2(
  .D(QLmin),
  .Q(HEX2[6:0])
);
sevenSeg s3(
  .D(QHmin),
  .Q(HEX3[6:0])
);
sevenSeg s4(
  .D(QLhour),
  .Q(HEX4[6:0])
);
sevenSeg s5(
  .D(QHhour),
  .Q(HEX5[6:0])
);
endmodule