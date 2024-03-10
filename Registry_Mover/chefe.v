module chefe(clki,reset,up,hexa);

	input clki;
	input reset;
	input up;
	output [7:0] hexa;
//	reg [7:0] hexa;
	wire [3:0] bina;

	divide_freq df(clki,clko);
	contador cd(clko,reset,up,bina);
	descodificador_bin2hexII dh(bina,hexa);

endmodule