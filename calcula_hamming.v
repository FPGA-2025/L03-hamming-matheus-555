module calcula_hamming (
  input [10:0] entrada,
  output [14:0] saida
);
  /**
   *      | Posição  |	Bit	 |   Tipo      |     
    *     |    1	   |   P1	 |   Paridade  |    
    *     |    2	   |   P2	 |   Paridade  |    
    *     |    3	   |   D1	 |   Dado      |
    *     |    4	   |   P4	 |   Paridade  |    
    *     |    5	   |   D2	 |   Dado      |
    *     |    6	   |   D3	 |   Dado      |
    *     |    7	   |   D4	 |   Dado      |
    *     |    8	   |   P8	 |   Paridade  |    
    *     |    9	   |   D5	 |   Dado      |
    *     |    10    |   D6	 |   Dado      |
    *     |    11    |   D7	 |   Dado      |
    *     |    12    |   D8	 |   Dado      |
    *     |    13    |   D9	 |   Dado      |
    *     |    14    |   D10 |	 Dado      |
    *     |    15    |   D11 |	 Dado      |
    * 
    * Em geral, cada bit de paridade abrange todos os bits em que o AND bit a bit da posição de paridade e a posição do bit são diferentes de zero.
  */

  // implemente o seu código aqui

  // Tentativa de automatizar o cálculo de hamming para N bits
  /*
  // Constantes
  parameter IN_BITS_LEN           = 11;                                      // Qtde de bits de entrada (bits de informação)
  parameter EXP_VALUE_IN_BASE_TWO = 3;                                       // Exponte tal que 2^VALUE_IN_BASE_TWO <= IN_BITS_LEN
  parameter OUT_BITS_LEN          = EXP_VALUE_IN_BASE_TWO + IN_BITS_LEN + 1; // Qtde de bits de saída (bits de informação + bits de correção)

  // Variáveis
  integer i, j, k, parity_pos;
  reg [OUT_BITS_LEN-1:0] temp; // auxiliar para construir o código com paridade

  always @(*) begin
    // Inicializa variáveis
    j = 1;
    k = 0;
    temp = 0;

    // Insere bits de entrada nos locais que NAO sao potências de 2
    for(i = 0; i < OUT_BITS_LEN; i = i+1) begin

      if( (i+1) == j ) begin
        j = (j<<1);
      end
      else begin
        temp[i] = entrada[k];
        k = k + 1;
      end

    end

      // Calcula bits de paridade

    for (j = 0; j < EXP_VALUE_IN_BASE_TWO; j = j + 1) begin
      parity_pos = (1 << j) - 1;

      temp[parity_pos] = 0;

      for (i = 0; i < OUT_BITS_LEN; i = i + 1) begin
        if ((i != parity_pos) && ((i + 1) & (1 << j))) begin
          temp[parity_pos] = temp[parity_pos] ^ temp[i];
        end
      end
    end

  saida = temp;

  end
  */

  wire p1, p2, p4, p8;

  // Cálculo dos bits de paridade
  assign p1 = ^ {entrada[0], entrada[1], entrada[3], entrada[4], entrada[6], entrada[8], entrada[10]};
  assign p2 = ^ {entrada[0], entrada[2], entrada[3], entrada[5], entrada[6], entrada[9], entrada[10]};
  assign p4 = ^ {entrada[1], entrada[2], entrada[3], entrada[7], entrada[8], entrada[9], entrada[10]};
  assign p8 = ^ {entrada[4], entrada[5], entrada[6], entrada[7], entrada[8], entrada[9], entrada[10]};

  // Montagem do código de Hamming
  assign saida[0]  = p1;
  assign saida[1]  = p2;
  assign saida[2]  = entrada[0];
  assign saida[3]  = p4;
  assign saida[4]  = entrada[1];
  assign saida[5]  = entrada[2];
  assign saida[6]  = entrada[3];
  assign saida[7]  = p8;
  assign saida[8]  = entrada[4];
  assign saida[9]  = entrada[5];
  assign saida[10] = entrada[6];
  assign saida[11] = entrada[7];
  assign saida[12] = entrada[8];
  assign saida[13] = entrada[9];
  assign saida[14] = entrada[10];


endmodule
