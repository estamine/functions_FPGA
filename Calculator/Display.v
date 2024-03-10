`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Caldeira & Silva Lda.
// Engineer: Rui Caldeira, Joel Silva
// 
// Create Date:    18:09:12 04/22/2007 
// Design Name: 
// Module Name:    Display 
// Project Name: Calculadora Simples
// Target Devices: 
// Tool versions: 
// Description: Modulo que mostra resultado no display em hexadecimal.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Display(dspsom,dspsub,dspdiv,dspmul,butDSPSOM,butDSPSUB,butDSPDIV,butDSPMUL,reset,relogio,resDSP);

	input [8:0] dspsom;		//resultado da soma
   input [8:0] dspsub;		//resultado da subtraccao
   input [8:0] dspdiv;		//resultado da divisao
   input [17:0] dspmul;		//resultado da multiplicacao
	input butDSPSOM;			//botao de soma
   input butDSPSUB;			//botao de subtraccao			
   input butDSPDIV;			//botao de divisao
   input butDSPMUL;			//botao de multiplicacao
	input reset;				//botao enter que aqui faz reset
	input relogio;				//relogio
	
	output [7:0] resDSP;		//leds a acender

	reg [18:0] interpreteDSP;		//valor a transformar em hex com booleano inicial
	reg [7:0] resDSP;
	
	always @ (posedge reset)
	begin
	resDSP = 8'b00000000;
	end
	
	always @ (posedge butDSPSOM)
	begin
	if (dspsom[8]==1)
	begin
	interpreteDSP = {1'b0,2'b11,8'b00000000,dspsom};
	end
	else
	begin
	interpreteDSP = {1'b0,2'b00,8'b00000000,dspsom};
	end
	end

	always @ (posedge butDSPSUB)
	begin
	if (dspsub[8]==1)
	begin
	interpreteDSP = {1'b0,2'b11,8'b00000000,dspsub};
	end
	else
	begin
	interpreteDSP = {1'b0,2'b00,8'b00000000,dspsub};
	end
	end
	
	always @ (posedge butDSPDIV)
	begin
	if (dspdiv[8]==1)
	begin
	interpreteDSP = {1'b0,2'b11,8'b00000000,dspdiv};
	end
	else
	begin
	interpreteDSP = {1'b0,2'b00,8'b00000000,dspdiv};
	end
	end

	always @ (posedge butDSPMUL)
	begin
	interpreteDSP = {1'b1,dspmul};
	end

////////////// 4 STATE MACHINE BEGIN //////////////////////

   parameter state1 = 2'b00;
   parameter state2 = 2'b01;
   parameter state3 = 2'b10;
   parameter state4 = 2'b11;

	reg [1:0] state = state1;

   always@(posedge relogio)
				case (state)
            state1 : begin
               if (interpreteDSP[18] == 1'b0)
					begin
					state <= state2;
					end
               else 
					begin

	if (interpreteDSP[17] == 1)
	begin

	case ({interpreteDSP[15],interpreteDSP[14],interpreteDSP[13],interpreteDSP[12]})

	4'b0000: resDSP = 8'b00000000;
	4'b0001: resDSP = 8'b00111000;
	4'b0010: resDSP = 8'b01111100;
	4'b0011: resDSP = 8'b01001111;
	4'b0100: resDSP = 8'b00111100;
	4'b0101: resDSP = 8'b01011110;
	4'b0110: resDSP = 8'b01111011;
	4'b0111: resDSP = 8'b01110011;
	4'b1000: resDSP = 8'b01111111;
	4'b1001: resDSP = 8'b00100011;
	4'b1010: resDSP = 8'b01111110;
	4'b1011: resDSP = 8'b01110110;
	4'b1100: resDSP = 8'b01010011;
	4'b1101: resDSP = 8'b01100111;
	4'b1110: resDSP = 8'b01101101;
	4'b1111: resDSP = 8'b00000011;
	
	endcase
	end
	else
	begin

	case ({interpreteDSP[15],interpreteDSP[14],interpreteDSP[13],interpreteDSP[12]})

	4'b0000: resDSP = 8'b00000000;
	4'b1111: resDSP = 8'b00111000;
	4'b1110: resDSP = 8'b01111100;
	4'b1101: resDSP = 8'b01001111;
	4'b1100: resDSP = 8'b00111100;
	4'b1011: resDSP = 8'b01011110;
	4'b1010: resDSP = 8'b01111011;
	4'b1001: resDSP = 8'b01110011;
	4'b1000: resDSP = 8'b01111111;
	4'b0111: resDSP = 8'b00100011;
	4'b0110: resDSP = 8'b01111110;
	4'b0101: resDSP = 8'b01110110;
	4'b0100: resDSP = 8'b01010011;
	4'b0011: resDSP = 8'b01100111;
	4'b0010: resDSP = 8'b01101101;
	4'b0001: resDSP = 8'b00000011;
	
	endcase
	end

					state <= state2;
					
					end
				end

			state2 : begin
               if (interpreteDSP[18] == 1'b0)
					begin
					state <= state3;
					end
			else
			begin
   
	if (interpreteDSP[17] == 1)
	begin

	case ({interpreteDSP[11],interpreteDSP[10],interpreteDSP[9],interpreteDSP[8]})

	4'b0000: resDSP = 8'b00000000;
	4'b0001: resDSP = 8'b00111000;
	4'b0010: resDSP = 8'b01111100;
	4'b0011: resDSP = 8'b01001111;
	4'b0100: resDSP = 8'b00111100;
	4'b0101: resDSP = 8'b01011110;
	4'b0110: resDSP = 8'b01111011;
	4'b0111: resDSP = 8'b01110011;
	4'b1000: resDSP = 8'b01111111;
	4'b1001: resDSP = 8'b00100011;
	4'b1010: resDSP = 8'b01111110;
	4'b1011: resDSP = 8'b01110110;
	4'b1100: resDSP = 8'b01010011;
	4'b1101: resDSP = 8'b01100111;
	4'b1110: resDSP = 8'b01101101;
	4'b1111: resDSP = 8'b00000011;
	
	endcase
	end
	else
	begin

	case ({interpreteDSP[11],interpreteDSP[10],interpreteDSP[9],interpreteDSP[8]})

	4'b0000: resDSP = 8'b00000000;
	4'b1111: resDSP = 8'b00111000;
	4'b1110: resDSP = 8'b01111100;
	4'b1101: resDSP = 8'b01001111;
	4'b1100: resDSP = 8'b00111100;
	4'b1011: resDSP = 8'b01011110;
	4'b1010: resDSP = 8'b01111011;
	4'b1001: resDSP = 8'b01110011;
	4'b1000: resDSP = 8'b01111111;
	4'b0111: resDSP = 8'b00100011;
	4'b0110: resDSP = 8'b01111110;
	4'b0101: resDSP = 8'b01110110;
	4'b0100: resDSP = 8'b01010011;
	4'b0011: resDSP = 8'b01100111;
	4'b0010: resDSP = 8'b01101101;
	4'b0001: resDSP = 8'b00000011;
	endcase
	end
					state <= state3;
            end
				end
					
            state3 : begin

	if (interpreteDSP[17] == 1)
	begin

	case ({interpreteDSP[7],interpreteDSP[6],interpreteDSP[5],interpreteDSP[4]})

	4'b0000: resDSP = 8'b00000000;
	4'b0001: resDSP = 8'b00111000;
	4'b0010: resDSP = 8'b01111100;
	4'b0011: resDSP = 8'b01001111;
	4'b0100: resDSP = 8'b00111100;
	4'b0101: resDSP = 8'b01011110;
	4'b0110: resDSP = 8'b01111011;
	4'b0111: resDSP = 8'b01110011;
	4'b1000: resDSP = 8'b01111111;
	4'b1001: resDSP = 8'b00100011;
	4'b1010: resDSP = 8'b01111110;
	4'b1011: resDSP = 8'b01110110;
	4'b1100: resDSP = 8'b01010011;
	4'b1101: resDSP = 8'b01100111;
	4'b1110: resDSP = 8'b01101101;
	4'b1111: resDSP = 8'b00000011;
	
	endcase
	end
	else
	begin

	case ({interpreteDSP[7],interpreteDSP[6],interpreteDSP[5],interpreteDSP[4]})

	4'b0000: resDSP = 8'b00000000;
	4'b1111: resDSP = 8'b00111000;
	4'b1110: resDSP = 8'b01111100;
	4'b1101: resDSP = 8'b01001111;
	4'b1100: resDSP = 8'b00111100;
	4'b1011: resDSP = 8'b01011110;
	4'b1010: resDSP = 8'b01111011;
	4'b1001: resDSP = 8'b01110011;
	4'b1000: resDSP = 8'b01111111;
	4'b0111: resDSP = 8'b00100011;
	4'b0110: resDSP = 8'b01111110;
	4'b0101: resDSP = 8'b01110110;
	4'b0100: resDSP = 8'b01010011;
	4'b0011: resDSP = 8'b01100111;
	4'b0010: resDSP = 8'b01101101;
	4'b0001: resDSP = 8'b00000011;
	endcase
	end
				state <= state4;
            end
            state4 : begin

	if (interpreteDSP[17] == 1)
	begin

	case ({interpreteDSP[3],interpreteDSP[2],interpreteDSP[1],interpreteDSP[0]})

	4'b0000: resDSP = 8'b00000000;
	4'b0001: resDSP = 8'b00111000;
	4'b0010: resDSP = 8'b01111100;
	4'b0011: resDSP = 8'b01001111;
	4'b0100: resDSP = 8'b00111100;
	4'b0101: resDSP = 8'b01011110;
	4'b0110: resDSP = 8'b01111011;
	4'b0111: resDSP = 8'b01110011;
	4'b1000: resDSP = 8'b01111111;
	4'b1001: resDSP = 8'b00100011;
	4'b1010: resDSP = 8'b01111110;
	4'b1011: resDSP = 8'b01110110;
	4'b1100: resDSP = 8'b01010011;
	4'b1101: resDSP = 8'b01100111;
	4'b1110: resDSP = 8'b01101101;
	4'b1111: resDSP = 8'b00000011;
	
	endcase
	end
	else
	begin

	case ({interpreteDSP[3],interpreteDSP[2],interpreteDSP[1],interpreteDSP[0]})

	4'b0000: resDSP = 8'b00000000;
	4'b1111: resDSP = 8'b00111000;
	4'b1110: resDSP = 8'b01111100;
	4'b1101: resDSP = 8'b01001111;
	4'b1100: resDSP = 8'b00111100;
	4'b1011: resDSP = 8'b01011110;
	4'b1010: resDSP = 8'b01111011;
	4'b1001: resDSP = 8'b01110011;
	4'b1000: resDSP = 8'b01111111;
	4'b0111: resDSP = 8'b00100011;
	4'b0110: resDSP = 8'b01111110;
	4'b0101: resDSP = 8'b01110110;
	4'b0100: resDSP = 8'b01010011;
	4'b0011: resDSP = 8'b01100111;
	4'b0010: resDSP = 8'b01101101;
	4'b0001: resDSP = 8'b00000011;
	endcase
	end

				state <= state1;
			end
	endcase
         
///////////////// 4 STATE MACHINE END /////////////////////

endmodule