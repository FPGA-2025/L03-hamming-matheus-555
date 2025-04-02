module corrige_hamming (
  input [14:0] entrada, // a paridade é o bit mais significativo (dado[8])
  output reg [10:0] saida
);


  // implemente o seu código aqui
  wire p1, p2, p4, p8;
  wire [3:0] syndrome;
  reg [14:0] corrected_entrada;

  // Cálculo dos bits de paridade (recalculados)
  assign p1 = ^ {entrada[0], entrada[2], entrada[4], entrada[6],  entrada[8],  entrada[10], entrada[12], entrada[14]};
  assign p2 = ^ {entrada[1], entrada[2], entrada[5], entrada[6],  entrada[9],  entrada[10], entrada[13], entrada[14]};
  assign p4 = ^ {entrada[3], entrada[4], entrada[5], entrada[6],  entrada[11], entrada[12], entrada[13], entrada[14]};
  assign p8 = ^ {entrada[7], entrada[8], entrada[9], entrada[10], entrada[11], entrada[12], entrada[13], entrada[14]};

  // Cálculo da síndrome
  assign syndrome = {p8, p4, p2, p1};

  always @(*) begin

    corrected_entrada = entrada; // presumindo que não há erro inicialmente

    if( syndrome != 4'b0000 ) begin
      corrected_entrada[syndrome-1] = ~entrada[syndrome-1];
    end

    saida[0]  = corrected_entrada[2];
    saida[1]  = corrected_entrada[4];
    saida[2]  = corrected_entrada[5];
    saida[3]  = corrected_entrada[6];
    saida[4]  = corrected_entrada[8];
    saida[5]  = corrected_entrada[9];
    saida[6]  = corrected_entrada[10];
    saida[7]  = corrected_entrada[11];
    saida[8]  = corrected_entrada[12];
    saida[9]  = corrected_entrada[13];
    saida[10] = corrected_entrada[14];

  end

endmodule
