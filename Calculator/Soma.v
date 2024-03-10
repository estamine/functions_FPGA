`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Caldeira & Silva Lda.
// Engineer: Rui Caldeira, Joel Silva
// 
// Create Date:    11:47:12 04/10/2007 
// Design Name: 
// Module Name:    Soma 
// Project Name: Calculadora Simples
// Target Devices: 
// Tool versions: 
// Description: Módulo que efectua SOMA de 2 binarios de 8 bits
// (+1 pendurado para evitar overflow) em Two's Complement
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Soma(som1,som2,butSOM,resSOM);

	input [8:0] som1; 			//primeiro número a somar
	input [8:0] som2; 			//segundo número a somar
	input butSOM; 					//botao de soma
	output [8:0] resSOM;			//resultado da soma

	reg [8:0] resSOM;
	
always @ (posedge butSOM)		//sempre que o botao soma e' carregado
begin
   resSOM[0] = som1[0] ^ som2[0];
	resSOM[1] = som1[1] ^ som2[1] ^ som1[0] & som2[0];
   resSOM[2] = som1[2] ^ som2[2] ^ som2[1] | ~som2[1] & som1[1] & som1[0] & som2[0];
   resSOM[3] = som1[3] ^ som2[3] ^ som2[2] | ~som2[2] & som1[2] & (som2[1] | ~som2[1] & som1[1] & som1[0] & som2[0]);
   resSOM[4] = som1[4] ^ som2[4] ^ som2[3] | ~som2[3] & som1[3] & (som2[2] | ~som2[2] & som1[2] & (som2[1] | ~som2[1] & som1[1] & som1[0] & som2[0]));
   resSOM[5] = som1[5] ^ som2[5] ^ som2[4] | ~som2[4] & som1[4] & (som2[3] | ~som2[3] & som1[3] & (som2[2] | ~som2[2] & som1[2] & (som2[1] | ~som2[1] & som1[1] & som1[0] & som2[0])));
   resSOM[6] = som1[6] ^ som2[6] ^ som2[5] | ~som2[5] & som1[5] & (som2[4] | ~som2[4] & som1[4] & (som2[3] | ~som2[3] & som1[3] & (som2[2] | ~som2[2] & som1[2] & (som2[1] | ~som2[1] & som1[1] & som1[0] & som2[0]))));
   resSOM[7] = som1[7] ^ som2[7] ^ som2[6] | ~som2[6] & som1[6] & (som2[5] | ~som2[5] & som1[5] & (som2[4] | ~som2[4] & som1[4] & (som2[3] | ~som2[3] & som1[3] & (som2[2] | ~som2[2] & som1[2] & (som2[1] | ~som2[1] & som1[1] & som1[0] & som2[0])))));
   resSOM[8] = som1[8] ^ som2[8] ^ som2[7] | ~som2[7] & som1[7] & (som2[6] | ~som2[6] & som1[6] & (som2[5] | ~som2[5] & som1[5] & (som2[4] | ~som2[4] & som1[4] & (som2[3] | ~som2[3] & som1[3] & (som2[2] | ~som2[2] & som1[2] & (som2[1] | ~som2[1] & som1[1] & som1[0] & som2[0]))))));
end
endmodule