module control(in, regdest, alusrc, memtoreg, regwrite, 
	       memread, memwrite, branch, aluop1, aluop2);

input [7:0] in;
output regdest, alusrc, memtoreg, regwrite, memread, memwrite, branch, aluop1, aluop2;

wire rformat,lw,sw,jump,beq,bne,addi;

assign rformat =(~in[2])&(~in[1])&in[0];

assign lw = (~in[2])&in[1]&(~in[0]);
assign sw = (~in[2])&in[1]&in[0];

assign jump = in[2]&(~in[1])&(~in[0]);

assign beq = in[2]&(~in[1])&in[0];
assign bne = in[2]&in[1]&(~in[0]);

assign addi = in[2]&in[1]&in[0];

//TO-DO
assign regdest = rformat;

assign alusrc = lw|sw;
assign memtoreg = lw;
assign regwrite = rformat|lw;
assign memread = lw;
assign memwrite = sw;
assign branch = beq;
assign aluop1 = rformat;
assign aluop2 = beq;

endmodule
