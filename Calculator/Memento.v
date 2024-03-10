`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Caldeira & Silva Lda.
// Engineer: Rui Caldeira, Joel Silva
// 
// Create Date:    17:27:12 04/22/2007 
// Design Name: 
// Module Name:    Memento 
// Project Name: Calculadora Simples
// Target Devices: 
// Tool versions: 
// Description: Modulo que armazena o primeiro numero em memoria.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Memento(mem,enter,resMEM);
	
		input [8:0] mem;		 //primeiro numero
		input enter;			 //botao enter
		output [8:0] resMEM;	 //numero memorizado
				
		reg [8:0] resMEM;
		
always @ (posedge enter)
begin
	resMEM = mem;
end
endmodule