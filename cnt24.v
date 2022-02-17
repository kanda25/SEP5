module cnt24(
  input CLK,RST,CLR,
  input ENsec, ENmin,
  input en1hz,
  output reg [1:0] QH,
  output reg [2:0] QL
);
wire EN = ENsec && ENmin;
always @ (posedge CLK, posedge RST) begin
  if (RST)
    QL <= 3'b0;
  else if(CLR)
    QL <= 3'b0;
  else if(en1hz == 1 && EN == 1) begin
    if(QL == 3'd4)
      QL <= 3'b0;
    else
      QL <= QL + 1'b1;
  end
end

always @ (posedge CLK, posedge RST) begin
  if (RST)
    QH <= 2'b0;
  else if (CLR)
    QH <= 2'b0;
  else if(en1hz == 1 && EN == 1) begin
    if (QL == 3'd4)
      if(QH == 2'd2)
        QH <= 1'b0;
    else
      QH <= QH + 1'b1;
  end
end
endmodule