module tb();
	wire out;
	reg clk, reset, mode;	
	counter dut0(mode, clk, reset, out);
	always #5 clk = ~clk;	
	initial
	 begin
	  clk<=0; reset<=1; mode<=0;
	  #3 reset <= 0; 
	  
	 end

	 
	 initial 
	  begin
	    $dumpfile("dump.vcd");
	    $dumpvars;
          end
	 
endmodule
