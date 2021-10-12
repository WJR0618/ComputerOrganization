module ID_EX_Register( clk, reset, pc_incr_in, pc_incr_out, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, ALUOp,
					   RD1_in, RD2_in, extend_immed_in, rt_in, rd_in, RegDst_out, ALUSrc_out, MemtoReg_out, RegWrite_out, MemRead_out,
					   MemWrite_out, Branch_out, Jump_out, ALUOp_out, RD1_out, RD2_out, extend_immed_out, rt_out, rd_out, Funct_in, Funct_out ) ;
	input reset, clk, RegWrite, Branch, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Jump;
	input [1:0] ALUOp ;
	input [31:0] pc_incr_in, RD1_in, RD2_in, extend_immed_in ;
	input [31:0] rt_in, rd_in ;
	input [5:0] Funct_in ;
	output [31:0] pc_incr_out, RD1_out, RD2_out, extend_immed_out, rt_out, rd_out ;
	output RegDst_out, ALUSrc_out, MemtoReg_out, RegWrite_out, MemRead_out, MemWrite_out, Branch_out, Jump_out;
	output [1:0] ALUOp_out ;
	output [5:0] Funct_out ;
	reg [31:0] pc_incr_out ;
	reg [31:0] rt_out, rd_out, RD1_out, RD2_out, extend_immed_out  ;
	reg RegDst_out, ALUSrc_out, MemtoReg_out, RegWrite_out, MemRead_out, MemWrite_out, Branch_out, Jump_out;
	reg [1:0] ALUOp_out ;
	reg [5:0] Funct_out ;
	//PCSrc
	
	always@( posedge clk ) begin
		if( reset ) begin
			pc_incr_out <= 32'b0 ;
			rt_out <= 32'b0 ;
			rd_out <= 32'b0 ;
			RD1_out <= 32'b0 ;
			RD2_out <= 32'b0 ;
			extend_immed_out <= 32'b0 ;
			RegDst_out <= 1'b0;
			ALUSrc_out <= 1'b0;
			MemtoReg_out <= 1'b0;
			RegWrite_out <= 1'b0;
			MemRead_out <= 1'b0;
			MemWrite_out<= 1'b0 ;
			Branch_out <= 1'b0;
			Jump_out <= 1'b0;
			ALUOp_out <= 2'b0;
			Funct_out <= 6'b0 ;
		end
		else begin
			pc_incr_out <= pc_incr_in ;
			rt_out <= rt_in ;
			rd_out <= rd_in ;
			RD1_out <= RD1_in ;
			RD2_out <= RD2_in ;
			extend_immed_out <= extend_immed_in ;
			RegDst_out <= RegDst;
			ALUSrc_out <= ALUSrc;
			MemtoReg_out <= MemtoReg;
			RegWrite_out <= RegWrite;
			MemRead_out <= MemRead;
			MemWrite_out<= MemWrite;
			Branch_out <= Branch;
			Jump_out <= Jump;
			ALUOp_out <= ALUOp;
			Funct_out <= Funct_in ;
		end
	end
	
endmodule
/*
  control_single CTL(.opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), 
                       .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), 
                       .Jump(Jump), .ALUOp(ALUOp));

*/