module IF_ID_Register2( clk, reset, pc_incr_in, instr_in, pc_incr_out, instr_out ) ;
	input reset, clk ;
	input [31:0] pc_incr_in, instr_in ;
	output [31:0] pc_incr_out ;
	output [31:0] instr_out ;
	
	reg [31:0] pc_incr_out, instr_out ;
	
	always@( posedge clk ) begin
		if( reset ) begin
			pc_incr_out = 32'b0 ;
			instr_out = 32'b0 ;
		end
		else begin
			pc_incr_out = pc_incr_in ;
			instr_out = instr_in ;
		end
	end
	
endmodule