module tb;
	reg[0:4] pattern;
	reg  clk, reset;
	wire out;
	integer i = 0;
	//integer count = 0;
	always #5 clk = ~clk;
	generator u0 ( .pattern(pattern), .i(i), .clk(clk), .reset(reset), .out(out));
	
	
	initial begin
	 
		clk <= 0;
		reset <= 0;
		pattern = 5'b10011;
		while(i<4) begin
			@(posedge clk) i<=i+1;		
		end
		
		$finish;
	end
	
	always @ (posedge clk) begin
		$strobe ("T=%0t reset=%0b pattern=%0d i=%0d ", $time, reset, out, i);
	end
	
	initial begin
        	$dumpvars;
        	$dumpfile("dump.vcd");
    end
	
endmodule



module generator(input [0:4] pattern,  input[0:31]  i, input clk, input reset, output reg out);
	
	always @(posedge clk) begin
		if (reset) begin

			out <= 0;
		end 
		else begin
			out <= pattern[i];

		end
	end

endmodule



		
		
	
