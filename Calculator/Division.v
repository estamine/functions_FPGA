`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Caldeira & Silva Lda.
// Engineer: Rui Caldeira, Joel Silva
// 
// Create Date:    15:54:12 04/22/2007 
// Design Name: 
// Module Name:    Division 
// Project Name: Calculadora Simples
// Target Devices: 
// Tool versions: 
// Description: Modulo que divide dois numeros. Sendo o dividendo um numero qualquer e o 
// e o divisor uma potencia de 2. E' uma divisao inteira que ignora o resto.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Division(div1,div2,butDIV,resDIV);

	input [8:0] div1;			//dividendo
	input [8:0] div2;			//divisor
	input butDIV;				//botao de divisao
	output [8:0] resDIV;		//resultado da divisao
	
	reg [8:0] resDIV;

always @ (negedge butDIV)
begin

case (div2)

	9'b000000010:begin
					
						resDIV = div1 >>> 1;	//divisao por 2
					
					 end

	9'b000000100:begin
					
						resDIV = div1 >>> 2;	//divisao por 4
					
					 end

	9'b000001000:begin
					
						resDIV = div1 >>> 3;	//divisao por 8
					
					 end

	9'b000010000:begin
					
						resDIV = div1 >>> 4;	//divisao por 16
					
					 end

	9'b000100000:begin
					
						resDIV = div1 >>> 5;	//divisao por 32
					
					 end

	9'b001000000:begin
					
						resDIV = div1 >>> 6;	//divisao por 64
					
					 end

	9'b010000000:begin
					
						resDIV = div1 >>> 7;	//divisao por 128
					
					 end
	default:begin
					
						resDIV = 9'b000000000;	//divisao por outro numero qualquer
					
					 end	
	

endcase
end
endmodule