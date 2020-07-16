	module ttt_drawer(clk, display_enabled, x, y, r, g, b, vram_data, vram_addr);

	input logic clk;
	input logic display_enabled;
	input logic [9:0] x;
	input logic [8:0] y;
	input wire [7:0] vram_data;
	output logic [17:0] vram_addr;
	output logic [7:0] r;
	output logic [7:0] g;
	output logic [7:0] b;


	localparam SPRITE_WIDTH = 200;
	localparam SPRITE_HEIGHT = 230;
	
	
	integer SPRITE_OFFSET_Y = 50;
	integer SPRITE_OFFSET_X = 50;
	
	integer xdir = 1;
	integer ydir = 1;
	
	integer counter = 0;
	
	assign r = vram_data;
	assign g = vram_data;
	assign b = vram_data;

		
	
	always @ (posedge clk)
	begin
		vram_addr <= 0;
		
		

		if (display_enabled &&
		y >= SPRITE_OFFSET_Y &&
		y <= SPRITE_OFFSET_Y + SPRITE_HEIGHT && 
		x >= SPRITE_OFFSET_X &&
		x <= SPRITE_OFFSET_X + SPRITE_WIDTH)
		begin
			vram_addr <= x - SPRITE_OFFSET_X + SPRITE_WIDTH*(y - SPRITE_OFFSET_Y);
		end
		
		if (counter >= 75000)
		begin
		
		if (SPRITE_OFFSET_X + SPRITE_WIDTH >= 640) xdir = -1;
		if (SPRITE_OFFSET_Y + SPRITE_HEIGHT >= 480) ydir = -1;
		if (SPRITE_OFFSET_X <= 0) xdir = 1;
		if (SPRITE_OFFSET_Y <= 0) ydir = 1;
		
		SPRITE_OFFSET_X = SPRITE_OFFSET_X + xdir;
		SPRITE_OFFSET_Y = SPRITE_OFFSET_Y + ydir;
		counter = 0;
		end
		
		counter++;
		
		
		
		/*if (display_enabled)
		begin
			if ((x >= 205 && x <= 215) | (x >= 415 && x <= 425)
			| (y >= 155 && y <= 165) | (y >= 315 && y <= 325))
			begin
				r <= 8'h00;
				g <= 8'hFF;
				b <= 8'hAA;
			end
		
		end*/
		
	end

endmodule