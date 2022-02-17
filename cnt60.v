module cnt60(
  input CLK,RST,CLR,
  input EN,
  input en1hz,
  output reg [2:0] QH,
  output reg [3:0] QL,
  output CA
);

/*1ketame*/
always @ (posedge CLK, posedge RST) begin
  if (RST)
    QL <= 4'd0;
  else if(CLR)
    QL <= 4'd0;
  else if(en1hz == 1 && EN == 1) begin
    if(QL == 4'd9)
      QL <= 4'd0;
    else
      QL <= QL + 1'b1;
  end
end

/*10keta*/
always @ (posedge CLK, posedge RST) begin
  if (RST)
    QH <= 3'b0;
  else if (CLR)
    QH <= 3'b0;
  else if(en1hz == 1 && EN == 1)begin
    if (QL == 4'd9) 
      if(QH == 3'd5)
        QH <= 1'b0;
    else
      QH <= QH + 1'b1;
  end
end

assign CA = (QH == 3'd5 && QL == 4'd9 && en1hz == 1'b1);
endmodule