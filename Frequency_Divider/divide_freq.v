module divide_freq(clki,clko);

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
