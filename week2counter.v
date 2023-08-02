module counter(input mode, input clk, input reset, output reg out);
        reg [0:8] count;
	always @(negedge reset) begin
		if(mode == 1) count <= 9'b000000000;
		else count <= 9'b111111111;
	end
	
	always @(posedge clk) begin
	        out <= 0;
		if(~reset) begin
			if(mode == 1) begin 
				count <= count + 1;
				if(count == 9'b111111111) out <= 1;
			end
			else begin 
				count <= count - 1;
				if(count == 9'b000000000) out <= 1;
			end
		end
	end
endmodule

		
