module MEM_WB_Register( clk, reset, RegWrite, MemtoReg, dmem_rdata_in, alu_out_in, rfile_wn_in, RegWrite_out, MemtoReg_out,
						dmem_rdata_out, alu_out_out, rfile_wn_out ) ;
	input reset, clk ;
	input RegWrite, MemtoReg ;
	input [4:0] rfile_wn_in ;
	input [31:0] dmem_rdata_in, alu_out_in;
	
	output RegWrite_out, MemtoReg_out ;
	output [4:0] rfile_wn_out ;
	output [31:0] dmem_rdata_out, alu_out_out;
	
	reg RegWrite_out, MemtoReg_out ;
	reg [4:0] rfile_wn_out ;
	reg [31:0] dmem_rdata_out, alu_out_out;

	
	always@( posedge clk ) begin
		if( reset ) begin
			RegWrite_out <= 1'b0 ;
			MemtoReg_out <= 1'b0 ;
			rfile_wn_out <= 5'b0 ;
			dmem_rdata_out <= 32'b0 ;
			alu_out_out <= 32'b0 ;
		end
		else begin
			RegWrite_out <= RegWrite ;
			MemtoReg_out <= MemtoReg ;
			rfile_wn_out <= rfile_wn_in ;
			dmem_rdata_out <= dmem_rdata_in ;
			alu_out_out <= alu_out_in ;
		end
	end
	
endmodule