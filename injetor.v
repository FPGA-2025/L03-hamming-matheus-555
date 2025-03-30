module injetor(
  input [14:0] entrada,
  input [3:0] n,
  input erro,
  output reg [14:0] saida
);



  // implemente seu código aqui
  always @(*) begin
    
    saida = erro ? 
      (n == 4'b0000) ? {entrada[14:1], ~entrada[0]} :
      (n == 4'b0001) ? {entrada[14:2], ~entrada[1], entrada[0]} :
      (n == 4'b0010) ? {entrada[14:3], ~entrada[2], entrada[1:0]} :
      (n == 4'b0011) ? {entrada[14:4], ~entrada[3], entrada[2:0]} :
      (n == 4'b0100) ? {entrada[14:5], ~entrada[4], entrada[3:0]} :
      (n == 4'b0101) ? {entrada[14:6], ~entrada[5], entrada[4:0]} :
      (n == 4'b0110) ? {entrada[14:7], ~entrada[6], entrada[5:0]} :
      (n == 4'b0111) ? {entrada[14:8], ~entrada[7], entrada[6:0]} :
      (n == 4'b1000) ? {entrada[14:9], ~entrada[8], entrada[7:0]} :
      (n == 4'b1001) ? {entrada[14:10], ~entrada[9], entrada[8:0]} :
      (n == 4'b1010) ? {entrada[14:11], ~entrada[10], entrada[9:0]} :
      (n == 4'b1011) ? {entrada[14:12], ~entrada[11], entrada[10:0]} :
      (n == 4'b1100) ? {entrada[14:13], ~entrada[12], entrada[11:0]} :
      (n == 4'b1101) ? {entrada[14:14], ~entrada[13], entrada[12:0]} :
      (n == 4'b1110) ? {~entrada[14], entrada[13:0]} :
      entrada : entrada;
  end

endmodule
