module corrige_hamming (
        input [14:0] entrada, // a paridade é o bit mais significativo (dado[8])
        output reg [10:0] saida
    );


    // implemente o seu código aqui
    wire p1, p2, p4, p8;
    wire s1, s2, s4, s8;
    wire [3:0] syndrome;
    wire [14:0] corrected_entrada;

    // Cálculo dos bits de paridade (recalculados)
    assign p1 = ^ {entrada[2], entrada[4], entrada[6], entrada[8], entrada[10], entrada[12], entrada[14]};
    assign p2 = ^ {entrada[2], entrada[5], entrada[6], entrada[9], entrada[10], entrada[13], entrada[14]};
    assign p4 = ^ {entrada[4], entrada[5], entrada[6], entrada[11], entrada[12], entrada[13], entrada[14]};
    assign p8 = ^ {entrada[8], entrada[9], entrada[10], entrada[11], entrada[12], entrada[13], entrada[14]};

    // Cálculo da síndrome
    assign s1 = p1 ^ entrada[0];
    assign s2 = p2 ^ entrada[1];
    assign s4 = p4 ^ entrada[3];
    assign s8 = p8 ^ entrada[7];
    assign syndrome = {s8, s4, s2, s1};

    // Correção do erro
    assign corrected_entrada = (syndrome == 4'b0000) ? entrada :
                               (syndrome == 4'b0001) ? {entrada[14:1], ~entrada[0]} :
                               (syndrome == 4'b0010) ? {entrada[14:2], ~entrada[1], entrada[0]} :
                               (syndrome == 4'b0011) ? {entrada[14:3], ~entrada[2], entrada[1:0]} :
                               (syndrome == 4'b0100) ? {entrada[14:4], ~entrada[3], entrada[2:0]} :
                               (syndrome == 4'b0101) ? {entrada[14:5], ~entrada[4], entrada[3:0]} :
                               (syndrome == 4'b0110) ? {entrada[14:6], ~entrada[5], entrada[4:0]} :
                               (syndrome == 4'b0111) ? {entrada[14:7], ~entrada[6], entrada[5:0]} :
                               (syndrome == 4'b1000) ? {entrada[14:8], ~entrada[7], entrada[6:0]} :
                               (syndrome == 4'b1001) ? {entrada[14:9], ~entrada[8], entrada[7:0]} :
                               (syndrome == 4'b1010) ? {entrada[14:10], ~entrada[9], entrada[8:0]} :
                               (syndrome == 4'b1011) ? {entrada[14:11], ~entrada[10], entrada[9:0]} :
                               (syndrome == 4'b1100) ? {entrada[14:12], ~entrada[11], entrada[10:0]} :
                               (syndrome == 4'b1101) ? {entrada[14:13], ~entrada[12], entrada[11:0]} :
                               (syndrome == 4'b1110) ? {entrada[14], ~entrada[13], entrada[12:0]} :
                               { ~entrada[14], entrada[13:0]};

  always @(*) begin
    saida[10:0] = corrected_entrada[14:4];
  end

endmodule
