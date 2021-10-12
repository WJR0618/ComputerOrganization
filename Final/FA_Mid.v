`timescale 1ns/1ns
module FA( A, B, Cin, S, Cout ) ;

	input A, B, Cin ;
	output S, Cout ;
	wire XorGate1 ;
	wire AndGate1, AndGate2 ;
	wire OrGate1 ;
	
	xor xor1( XorGate1, A, B ) ;
	xor xor2( S, XorGate1, Cin ) ;

	or or1( OrGate1, A, B ) ;
	and and1( AndGate1, OrGate1, Cin ) ;
	and and2( AndGate2, A, B ) ;
	or or2( Cout, AndGate1, AndGate2 ) ;

endmodule