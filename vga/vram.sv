module vram // 2-port module to use for VRAM in both the CPU and VGA modules
(
	input [15:0] data_a, data_b,
	input [17:0] addr_a, addr_b,
	input we_a, we_b, clock,
	output reg [15:0] q_a, q_b
);
	// 230 000 RAM words
	reg [15:0] ram[230000:0];
	
	// Load the initial image
	initial begin
        $display("Loading initial data...");
        $readmemb("img.mem", ram);
    end
	
	// Port A
	always @ (posedge clock)
	begin
		if (we_a) 
		begin
			ram[addr_a] <= data_a;
			q_a <= data_a;
		end
		else 
		begin
			q_a <= ram[addr_a];
		end
	end
	
	// Port B
	always @ (posedge clock)
	begin
		if (we_b)
		begin
			ram[addr_b] <= data_b;
			q_b <= data_b;
		end
		else
		begin
			q_b <= ram[addr_b];
		end
	end
	
endmodule
