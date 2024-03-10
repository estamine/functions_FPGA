module contador(clko,reset,up,bina);

   input clko
   input reset
   input up
   output bina
   reg [3:0] bina
      
   always @(posedge clko or posedge reset)
	   begin
      if (reset)

         contahex <= 0;

      else if (clko)

         if (up)

            bina <= bina + 1;

         else

            bina <= bina - 1;

		end
	end


endmodule
