`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Caldeira & Silva Lda.
// Engineer: Rui Caldeira, Joel Silva
// 
// Create Date:    01:05:44 04/23/2007 
// Design Name: 
// Module Name:    Chefe 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Modulo Main
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Chefe(butSOM,butSUB,butMUL,butDIV,enter,clki,binario,sinal,resDSP);

		input butSOM;
		input butSUB;
		input butMUL;
		input butDIV;
		input enter;
		input clki;
		input [6:0] binario;
		input sinal;

		output [7:0] resDSP;
		
		wire [8:0] resSOM;
		wire [8:0] resSUB;
		wire [8:0] resDIV;
		wire [17:0] resMUL;
		wire [8:0] numero;
		wire clko;
		wire [8:0] resMEM;

		Soma sm(resMEM,numero,butSOM,resSOM);
		Subtraction sb(resMEM,numero,butSUB,clki,resSUB);
		Multiplication ml(resMEM,numero,butMUL,resMUL);
		Division dv(resMEM,numero,butDIV,resDIV);
		TwosComplement tc(binario,sinal,clki,numero);
		Memento mm(numero,enter,resMEM);
		DivisorFrequencia df(clki,clko);
		Display dp(resSOM,resSUB,resDIV,resMUL,butSOM,butSUB,butDIV,butMUL,enter,clko,resDSP);
		
endmodule
