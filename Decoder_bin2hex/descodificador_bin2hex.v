module descodificador_bin2hex(b0,b1,b2,b3,a,b,c,d,e,f,g,p);
	input b0,b1,b2,b3;
	output a,b,c,d,e,f,g,p;
	reg a,b,c,d,e,f,g,p;

always @ (b0 or b1 or b2 or b3)

case ({b0,b1,b2,b3})

4'b0000: begin a=1'b1;b=1'b1;c=1'b1;d=1'b1;e=1'b1;f=1'b1;g=1'b0;p=1'b1; end
4'b0001: begin a=1'b0;b=1'b1;c=1'b1;d=1'b0;e=1'b0;f=1'b0;g=1'b0;p=1'b1; end
4'b0010: begin a=1'b1;b=1'b1;c=1'b0;d=1'b1;e=1'b1;f=1'b0;g=1'b1;p=1'b1; end
4'b0011: begin a=1'b1;b=1'b1;c=1'b1;d=1'b1;e=1'b0;f=1'b0;g=1'b1;p=1'b1; end
4'b0100: begin a=1'b0;b=1'b1;c=1'b1;d=1'b0;e=1'b0;f=1'b1;g=1'b1;p=1'b1; end
4'b0101: begin a=1'b1;b=1'b0;c=1'b1;d=1'b1;e=1'b0;f=1'b1;g=1'b1;p=1'b1; end
4'b0110: begin a=1'b1;b=1'b0;c=1'b1;d=1'b1;e=1'b1;f=1'b1;g=1'b1;p=1'b1; end
4'b0111: begin a=1'b1;b=1'b1;c=1'b1;d=1'b0;e=1'b0;f=1'b0;g=1'b0;p=1'b1; end
4'b1000: begin a=1'b1;b=1'b1;c=1'b1;d=1'b1;e=1'b1;f=1'b1;g=1'b1;p=1'b1; end
4'b1001: begin a=1'b1;b=1'b1;c=1'b1;d=1'b1;e=1'b1;f=1'b1;g=1'b1;p=1'b1; end
4'b1010: begin a=1'b1;b=1'b1;c=1'b1;d=1'b1;e=1'b0;f=1'b1;g=1'b1;p=1'b0; end
4'b1011: begin a=1'b1;b=1'b1;c=1'b1;d=1'b0;e=1'b1;f=1'b1;g=1'b1;p=1'b0; end
4'b1100: begin a=1'b1;b=1'b1;c=1'b1;d=1'b1;e=1'b1;f=1'b1;g=1'b1;p=1'b0; end
4'b1101: begin a=1'b1;b=1'b0;c=1'b0;d=1'b1;e=1'b1;f=1'b1;g=1'b0;p=1'b0; end
4'b1110: begin a=1'b0;b=1'b1;c=1'b1;d=1'b1;e=1'b1;f=1'b0;g=1'b1;p=1'b0; end
4'b1111: begin a=1'b1;b=1'b0;c=1'b0;d=1'b1;e=1'b1;f=1'b1;g=1'b1;p=1'b0; end

endcase
endmodule
