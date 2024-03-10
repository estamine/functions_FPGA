`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Caldeira & Silva Lda.
// Engineer: Rui Caldeira, Joel Silva
// 
// Create Date:    16:22:12 04/22/2007 
// Design Name: 
// Module Name:    Subtraccao
// Project Name: Calculadora Simples
// Target Devices: 
// Tool versions: 
// Description: Modulo que efectua SUBTRACCAO de 2 binarios de 8 bits
// (+1 pendurado para evitar overflow) em Two's Complement
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Subtraction(sub1,sub2,butSUB,relogio,resSUB);

	input [8:0] sub1; 			//primeiro numero
	input [8:0] sub2; 			//segundo numero
	input butSUB; 					//botao de subtraccao
	input relogio;
	
	output [8:0] resSUB;			//resultado da subtraccao

	reg [8:0] resSUB;
	reg [8:0] bneg;
	
	parameter ha1true=1'b1;
	parameter ha1false=1'b0;
	
	reg ha1 = ha1false;

	parameter state0	= 4'b1111;
	parameter state1  = 4'b0000;
   parameter state2  = 4'b0001;
   parameter state3  = 4'b0010;
   parameter state4  = 4'b0011;
   parameter state5  = 4'b0100;
   parameter state6  = 4'b0101;
   parameter state7  = 4'b0110;
   parameter state8  = 4'b0111;
   parameter state9  = 4'b1000;
	parameter state10 = 4'b1001;

   reg [3:0] state = state0;	

	always @ (negedge butSUB)		//sempre que o botao subtraccao e' carregado
	begin

	state = state1;

	end
	
   always@(posedge relogio)
	begin

        case (state)
            state1 : begin

		bneg[0] = sub2[0];

		state = state2;
            end
            state2 : begin
				
		if (sub2[0] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		bneg[1] = sub2[1] ^ ha1; //xor dos do bit e do ha1

		state = state3;		
            end
            state3 : begin
				
		if (sub2[1] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		bneg[2] = sub2[2] ^ ha1; //xor dos do bit e do ha1

		state = state4;		
            end
            state4 : begin
				
		if (sub2[2] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		bneg[3] = sub2[3] ^ ha1; //xor dos do bit e do ha1

		state = state5;		
            end
            state5 : begin
				
		if (sub2[3] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		bneg[4] = sub2[4] ^ ha1; //xor dos do bit e do ha1

		state = state6;		
            end
            state6 : begin
				
		if (sub2[4] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		bneg[5] = sub2[5] ^ ha1; //xor dos do bit e do ha1

		state = state7;		
            end
            state7 : begin
				
		if (sub2[5] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		bneg[6] = sub2[6] ^ ha1; //xor dos do bit e do ha1

		state = state8;		
            end
            state8 : begin
				
		if (sub2[6] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		bneg[7] = sub2[7] ^ ha1; //xor dos do bit e do ha1

		state = state9;		
            end
            state9 : begin
				
		if (sub2[7] == 1'b1 & ha1 == ha1false)
		begin
	
		ha1 = ha1true;
		
		end
 
		bneg[8] = sub2[8] ^ ha1; //xor dos do bit e do ha1

		state = state10;		
        end
            state10 : begin

   resSUB[0] = sub1[0] ^ bneg[0];
	resSUB[1] = sub1[1] ^ bneg[1] ^ sub1[0] & bneg[0];
   resSUB[2] = sub1[2] ^ bneg[2] ^ bneg[1] | ~bneg[1] & sub1[1] & sub1[0] & bneg[0];
   resSUB[3] = sub1[3] ^ bneg[3] ^ bneg[2] | ~bneg[2] & sub1[2] & (bneg[1] | ~bneg[1] & sub1[1] & sub1[0] & bneg[0]);
   resSUB[4] = sub1[4] ^ bneg[4] ^ bneg[3] | ~bneg[3] & sub1[3] & (bneg[2] | ~bneg[2] & sub1[2] & (bneg[1] | ~bneg[1] & sub1[1] & sub1[0] & bneg[0]));
   resSUB[5] = sub1[5] ^ bneg[5] ^ bneg[4] | ~bneg[4] & sub1[4] & (bneg[3] | ~bneg[3] & sub1[3] & (bneg[2] | ~bneg[2] & sub1[2] & (bneg[1] | ~bneg[1] & sub1[1] & sub1[0] & bneg[0])));
   resSUB[6] = sub1[6] ^ bneg[6] ^ bneg[5] | ~bneg[5] & sub1[5] & (bneg[4] | ~bneg[4] & sub1[4] & (bneg[3] | ~bneg[3] & sub1[3] & (bneg[2] | ~bneg[2] & sub1[2] & (bneg[1] | ~bneg[1] & sub1[1] & sub1[0] & bneg[0]))));
   resSUB[7] = sub1[7] ^ bneg[7] ^ bneg[6] | ~bneg[6] & sub1[6] & (bneg[5] | ~bneg[5] & sub1[5] & (bneg[4] | ~bneg[4] & sub1[4] & (bneg[3] | ~bneg[3] & sub1[3] & (bneg[2] | ~bneg[2] & sub1[2] & (bneg[1] | ~bneg[1] & sub1[1] & sub1[0] & bneg[0])))));
   resSUB[8] = sub1[8] ^ bneg[8] ^ bneg[7] | ~bneg[7] & sub1[7] & (bneg[6] | ~bneg[6] & sub1[6] & (bneg[5] | ~bneg[5] & sub1[5] & (bneg[4] | ~bneg[4] & sub1[4] & (bneg[3] | ~bneg[3] & sub1[3] & (bneg[2] | ~bneg[2] & sub1[2] & (bneg[1] | ~bneg[1] & sub1[1] & sub1[0] & bneg[0]))))));

		state = state0;		
        end
        
		  endcase
			end

endmodule

