module descodificador_bin2hexII(bina,hexa);

 input [3:0] bina;
 output [7:0] hexa;
 reg [7:0] hexa;

 always @ (bina)

   case (bina)

      1'b0000: begin
                  hexa=~8'b11111101;
               end
      1'b0001: begin
                  hexa=~8'b01100001;
               end
      1'b0010: begin
                  hexa=~8'b11010111;
               end
      1'b0011: begin
                  hexa=~8'b11110011;
               end
      1'h4: begin
                  hexa=~8'b01100111;
               end
      1'h5: begin
                  hexa=~8'b10110111;
               end
      1'h6: begin
                  hexa=~8'b10111111;
               end
      1'h7: begin
                  hexa=~8'b11100001;
               end
      1'h8: begin
                  hexa=~8'b11111111;
               end
      1'h9: begin
                  hexa=~8'b11110111;
               end
      1'ha: begin
                  hexa=~8'b11101110;
               end
      1'hb: begin
                  hexa=~8'b00111110;
               end
      1'hc: begin
                  hexa=~8'b10011100;
               end
      1'hd: begin
                  hexa=~8'b01111010;
               end
      1'he: begin
                  hexa=~8'b10011110;
               end
      1'hf: begin
                  hexa=~8'b10001110;
               end
      default: begin
                  hexa=~8'b00000010;
               end 

   endcase



endmodule
