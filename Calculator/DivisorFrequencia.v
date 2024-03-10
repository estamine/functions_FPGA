`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Caldeira & Silva Lda.
// Engineer: Rui Caldeira, Joel Silva
// 
// Create Date:    20:36:14 04/22/2007 
// Design Name: 
// Module Name:    DivisorFrequencia 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Modulo que divide relogio
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DivisorFrequencia(clki,clko);

	input clki;
	output clko;
	reg [24:0] conta;

	reg clko;  


   always @(posedge clki)
     
	begin
	
	conta <= conta + 1;
	
	clko <= conta[24];
	
	end

endmodule
