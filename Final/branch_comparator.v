module branch_comparator( opcode, rd1, rd2, zero ) ;
	input [5:0] opcode ;
	input [31:0] rd1, rd2 ;
	output zero ;
	wire [31:0] minus_result ;

	reg zero ;
	parameter bne = 6'b000101 ;
	parameter beq = 6'b000100 ;
	
	assign minus_result = rd1 - rd2 ;
	// assign zero = ( minus_result == 32'b0 && opcode == bne ) ? 1'b0 : 1'b1 ;
	
	
	always @( opcode ) begin
		if(opcode == 6'b000010 ) begin
			zero = 1'b1 ;
		
		end
		else begin
			if( opcode == bne ) begin
				if( minus_result == 32'b0 )
					zero = 1'b0 ;
				else
					zero = 1'b1 ;
			end
			else if( opcode == beq ) begin
				if( minus_result == 32'b0 )
					zero = 1'b1 ;
				else
					zero = 1'b0 ;
		end
		
		end
	end
	
endmodule