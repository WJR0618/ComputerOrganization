module EX_MEM_Register( clk, reset, Branch, MemRead, MemWrite, RegWrite, MemtoReg, b_tgt_in, alu_out_in, RD2, rfile_wn_in , Branch_out,
						MemRead_Out, MemWrite_out, RegWrite_out, MemtoReg_out, b_tgt_out, alu_out_out, RD2_out, rfile_wn_out,
						ext_immed_in, ext_immed_out, zero, zero_out) ;
	input reset, clk, zero ;
	input Branch, MemRead, MemWrite, RegWrite, MemtoReg ;
	input [4:0] rfile_wn_in ;
	input [31:0]  b_tgt_in, alu_out_in, RD2, ext_immed_in;
	output Branch_out, MemRead_Out, MemWrite_out, RegWrite_out, MemtoReg_out, zero_out ;
	output [4:0] rfile_wn_out ;
	output [31:0] b_tgt_out, alu_out_out, RD2_out, ext_immed_out ;
	
	reg Branch_out, MemRead_Out, MemWrite_out, RegWrite_out, MemtoReg_out, zero_out ;
	reg [4:0] rfile_wn_out ;
	reg [31:0] b_tgt_out, alu_out_out, RD2_out, ext_immed_out ;
	
	always@( posedge clk ) begin
		if( reset ) begin
			Branch_out <= 1'b0 ;
			MemRead_Out <= 1'b0 ;
			zero_out <= 1'b0 ;
			MemWrite_out <= 1'b0 ;
			RegWrite_out <= 1'b0 ;
			MemtoReg_out <= 1'b0 ;
			rfile_wn_out <= 5'b0 ;
			b_tgt_out <= 32'b0 ;
			alu_out_out <= 32'b0 ;
			RD2_out <= 32'b0 ;
			ext_immed_out <= 32'b0 ;
			
		end
		else begin
			Branch_out <= Branch ;
			MemRead_Out <= MemRead ;
			zero_out <= zero ;
			MemWrite_out <= MemWrite ;
			RegWrite_out <= RegWrite ;
			MemtoReg_out <= MemtoReg ;
			rfile_wn_out <= rfile_wn_in ;
			b_tgt_out <= b_tgt_in ;
			alu_out_out <= alu_out_in ;
			RD2_out <= RD2 ;
			ext_immed_out <= ext_immed_in ;
		end
	end
	
endmodule