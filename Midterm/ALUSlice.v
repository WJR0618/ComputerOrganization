`timescale 1ns/1ns
module ALUSlice( A, B, Cin, Signal, Inverse, dataOut, Cout, less, Set );
input A ;
input B ;
input Cin ;
input less ;
input Inverse ;
input [5:0] Signal ;
output dataOut ;
output Cout ;
output Set ;

wire B_Binverse ;
wire And_result ;
wire Or_result ;
wire Add_Sub_result ;
wire Slt_result ;

//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SLT  : 42

wire temp ;

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;
/*
定義各種訊號
*/

/*
=====================================================
下面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/

assign B_Binverse = (Inverse) ? ~B : B ;

assign And_result = A & B ;
assign Or_result = A | B ;
FA FullAdder( .A(A), .B(B_Binverse), .Cin(Cin), .S(Add_Sub_result), .Cout(Cout) ) ;
assign Slt_result = (less) ? 1'b1 : 1'b0 ;
assign temp = ( Signal == 6'b100100 ) ? And_result : ( ( Signal == 6'b100101 ) ? Or_result : ( ( Signal == 6'b100000 ) ? Add_Sub_result : ( ( Signal == 6'b100010 ) ? Add_Sub_result : Slt_result ) ) ) ;     
assign Set = Add_Sub_result ;



assign dataOut = temp ;
/*
=====================================================
上面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/

endmodule