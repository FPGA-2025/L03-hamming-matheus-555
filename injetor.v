module injetor(
  input [14:0] entrada,
  input [3:0] n,
  input erro,
  output reg [14:0] saida
);



  // implemente seu código aqui
  always @(*) begin
    saida = entrada;

    if (erro) begin
      saida[n] = ~entrada[n];
    end
  end

endmodule
