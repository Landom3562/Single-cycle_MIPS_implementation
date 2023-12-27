module control(in, jump, regdest, alusrc, memtoreg, regwrite, 
	       memread, memwrite, branch, aluop1, aluop2);

input [7:0] in;
output jump, regdest, alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop1, aluop2;

wire rformat,lw,sw,j,beq,bne,addi;

assign rformat =(~in[2])&(~in[1])&in[0];

assign lw = (~in[2])&in[1]&(~in[0]);
assign sw = (~in[2])&in[1]&in[0];

assign j = in[2]&(~in[1])&(~in[0]);

assign beq = in[2]&(~in[1])&in[0];
assign bne = in[2]&in[1]&(~in[0]);

assign addi = in[2]&in[1]&in[0];

//TO-DO
assign regdest = rformat;

assign jump = j;
assign alusrc = lw|sw|addi;
assign memtoreg = lw;
assign regwrite = rformat|lw|addi;
assign memread = lw;
assign memwrite = sw;
assign branch = beq;
assign aluop1 = rformat;
assign aluop2 = beq;

endmodule
