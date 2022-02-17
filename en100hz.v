module en100hz(
  input CLK,RST,
  output EN1HZ
);

/*50MHz counter*/
reg [18:0] cnt;

always @ (posedge CLK, posedge RST) begin
  if (RST)
  cnt <= 18'b0;
  else if (EN1HZ)
    cnt <= 18'b0;
  else
    cnt <= cnt + 1'b1;
end

assign EN1HZ = (cnt == 19'd499999);

endmodule