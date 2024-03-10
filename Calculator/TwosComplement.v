`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Caldeira & Silva Lda.
// Engineer: Rui Caldeira, Joel Silva
// 
// Create Date:    12:17:12 04/10/2007 
// Design Name: 
// Module Name:    TwosComplement 
// Project Name: Calculadora Simples
// Target Devices: 
// Tool versions: 
// Description: Módulo que trata os números de entrada de 7 bits. Convertendo para 2s Comp.
// e acrescentado-lhes 1 bit extra para evitar overflow e outro para definir o sinal.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TwosComplement(binario,sinal,relogio,numero);

	input [6:0] binario;
	input sinal;
	input relogio;
	
	output [8:0] numero;
	
	reg [8:0] numero;
	reg [8:0] intermedio;
	
	parameter ha1true=1'b1;
	parameter ha1false=1'b0;
	
	reg ha1 = ha1false;
	
	parameter state0  = 4'b1111;
	parameter state1  = 4'b0000;
   parameter state2  = 4'b0001;
   parameter state3  = 4'b0010;
   parameter state4  = 4'b0011;
   parameter state5  = 4'b0100;
   parameter state6  = 4'b0101;
   parameter state7  = 4'b0110;
   parameter state8  = 4'b0111;
   parameter state9  = 4'b1000;

   reg [3:0] state = state0;

	always@ (binario or sinal)
	begin

	state = state1;

	end	
	
   always@(posedge relogio)
	begin
	
		if (sinal == 'b0)
	begin

	numero = {sinal,sinal,binario};

	end
	else
	begin
	
        case (state)
            state1 : begin

		numero[0] = intermedio[0];
	
		state <=state2;
            end
            state2 : begin
				
		if (intermedio[0] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		numero[1] = intermedio[1] ^ ha1; //xor dos do bit e do ha1

	state <=state3;		
            end
            state3 : begin
				
		if (intermedio[1] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		numero[2] = intermedio[2] ^ ha1; //xor dos do bit e do ha1

	state <=state4;				
            end
            state4 : begin
				
		if (intermedio[2] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		numero[3] = intermedio[3] ^ ha1; //xor dos do bit e do ha1

	state <=state5;		
            end
            state5 : begin
				
		if (intermedio[3] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		numero[4] = intermedio[4] ^ ha1; //xor dos do bit e do ha1

	state <=state6;				
            end
            state6 : begin
				
		if (intermedio[4] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		numero[5] = intermedio[5] ^ ha1; //xor dos do bit e do ha1

	state <=state7;				
            end
            state7 : begin
				
		if (intermedio[5] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		numero[6] = intermedio[6] ^ ha1; //xor dos do bit e do ha1

	state <=state8;				
            end
            state8 : begin
				
		if (intermedio[6] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		numero[7] = intermedio[7] ^ ha1; //xor dos do bit e do ha1

	state <=state9;				
            end
            state9 : begin
				
		if (intermedio[7] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		numero[8] = intermedio[8] ^ ha1; //xor dos do bit e do ha1

	state <=state0;				
        end
        
		  endcase
			end

end

endmodule