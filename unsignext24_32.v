module unsignext24_32(in1,out1);
input [23:0] in1;
output [31:0] out1;
assign 	 out1 = {{ 8 {1'b0}}, in1};
endmodule
