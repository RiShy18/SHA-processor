`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps


module vga_tb;



wire      [7:0]  VGA_B;
reg             VGA_BLANK_N;
wire      [7:0]  VGA_G;
wire             VGA_HS;
wire      [7:0]  VGA_R;
reg             VGA_SYNC_N;
wire             VGA_VS;
wire CLOCK_25;
reg RESET;
reg CLOCK_50;
reg DISPLAY_ENABLED;


wire [9:0] X;
wire [8:0] Y;

wire [15:0] data;
wire [17:0] addr;

integer f;


divide_clock_by_two DIVM(CLOCK_50, RESET, CLOCK_25);
vga_top TOPV(CLOCK_25, ~DISPLAY_ENABLED, data, addr, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B, X, Y);
vram VRAM(.addr_b(addr), .clock(CLOCK_50), .q_b(data));

	
always #10 CLOCK_50 <= ~CLOCK_50;

initial begin
 f = $fopen("output.txt","w");
 VGA_SYNC_N = 0;
 VGA_BLANK_N = 1;
 CLOCK_50 = 0;
 RESET = 0;
 DISPLAY_ENABLED = 0;
 #20 RESET = 1;
 #50 DISPLAY_ENABLED = 1;
end

always @(posedge CLOCK_25)
begin
$fwrite(f,"%0d ns: %b %b %b %b %b\n",$time, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B);
end

endmodule
