module SELECTOR(A,B,SELECT,Z);
  input A,B;
  input SELECT;
  output Z;
  reg TEMP;

  always @(A or B or SELECT)
    if(!SELECT)
      TEMP <= A;
    else
      TEMP <= B;
    
    assign Z = TEMP;
endmodule
