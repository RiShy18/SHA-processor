/*module ModularExp(Pix, Res);
input logic[31:0] Pix
output logic[31:0] Res

logic [3:0] exponente = 4'b1011;//12'b101010010001
expo Exp(Pix, exponente, Out1);

logic [3:0] modOp = 4'b1110; //32'b00000001010100100011000001001011
mod Mod(Out1, modOp, Res);

endmodule
*/