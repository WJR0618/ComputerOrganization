`timescale 1ns/1ns
module ALU( dataA, dataB, Signal, dataOut, reset );

input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] dataOut ;

//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SLT  : 42

wire [31:0] temp ;
wire Inverse ;
wire [31:0] Cout ;
wire set ;
wire Cout32 ;
wire [31:0] dataB_dataBinverse ;

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

assign Inverse = ( Signal == 6'b100010 | Signal == 6'b101010 ) ? 1'b1 : 1'b0 ;


ALUSlice aALU0( .A(dataA[0]), .B(dataB[0]), .Cin( Inverse ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[0] ), .Cout( Cout[1] ), .less(set), .Set() ) ;
ALUSlice aALU1( .A(dataA[1]), .B(dataB[1]), .Cin( Cout[1] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[1] ), .Cout( Cout[2] ), .less(1'b0), .Set() ) ;
ALUSlice aALU2( .A(dataA[2]), .B(dataB[2]), .Cin( Cout[2] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[2] ), .Cout( Cout[3] ), .less(1'b0), .Set() ) ;
ALUSlice aALU3( .A(dataA[3]), .B(dataB[3]), .Cin( Cout[3] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[3] ), .Cout( Cout[4] ), .less(1'b0), .Set() ) ;
ALUSlice aALU4( .A(dataA[4]), .B(dataB[4]), .Cin( Cout[4] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[4] ), .Cout( Cout[5] ), .less(1'b0), .Set() ) ;
ALUSlice aALU5( .A(dataA[5]), .B(dataB[5]), .Cin( Cout[5] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[5] ), .Cout( Cout[6] ), .less(1'b0), .Set() ) ;
ALUSlice aALU6( .A(dataA[6]), .B(dataB[6]), .Cin( Cout[6] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[6] ), .Cout( Cout[7] ), .less(1'b0), .Set() ) ;
ALUSlice aALU7( .A(dataA[7]), .B(dataB[7]), .Cin( Cout[7] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[7] ), .Cout( Cout[8] ), .less(1'b0), .Set() ) ;
ALUSlice aALU8( .A(dataA[8]), .B(dataB[8]), .Cin( Cout[8] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[8] ), .Cout( Cout[9] ), .less(1'b0), .Set() ) ;
ALUSlice aALU9( .A(dataA[9]), .B(dataB[9]), .Cin( Cout[9] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[9] ), .Cout( Cout[10] ), .less(1'b0), .Set() ) ;
ALUSlice aALU10( .A(dataA[10]), .B(dataB[10]), .Cin( Cout[10] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[10] ), .Cout( Cout[11] ), .less(1'b0), .Set() ) ;
ALUSlice aALU11( .A(dataA[11]), .B(dataB[11]), .Cin( Cout[11] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[11] ), .Cout( Cout[12] ), .less(1'b0), .Set() ) ;
ALUSlice aALU12( .A(dataA[12]), .B(dataB[12]), .Cin( Cout[12] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[12] ), .Cout( Cout[13] ), .less(1'b0), .Set() ) ;
ALUSlice aALU13( .A(dataA[13]), .B(dataB[13]), .Cin( Cout[13] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[13] ), .Cout( Cout[14] ), .less(1'b0), .Set() ) ;
ALUSlice aALU14( .A(dataA[14]), .B(dataB[14]), .Cin( Cout[14] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[14] ), .Cout( Cout[15] ), .less(1'b0), .Set() ) ;
ALUSlice aALU15( .A(dataA[15]), .B(dataB[15]), .Cin( Cout[15] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[15] ), .Cout( Cout[16] ), .less(1'b0), .Set() ) ;
ALUSlice aALU16( .A(dataA[16]), .B(dataB[16]), .Cin( Cout[16] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[16] ), .Cout( Cout[17] ), .less(1'b0), .Set() ) ;
ALUSlice aALU17( .A(dataA[17]), .B(dataB[17]), .Cin( Cout[17] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[17] ), .Cout( Cout[18] ), .less(1'b0), .Set() ) ;
ALUSlice aALU18( .A(dataA[18]), .B(dataB[18]), .Cin( Cout[18] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[18] ), .Cout( Cout[19] ), .less(1'b0), .Set() ) ;
ALUSlice aALU19( .A(dataA[19]), .B(dataB[19]), .Cin( Cout[19] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[19] ), .Cout( Cout[20] ), .less(1'b0), .Set() ) ;
ALUSlice aALU20( .A(dataA[20]), .B(dataB[20]), .Cin( Cout[20] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[20] ), .Cout( Cout[21] ), .less(1'b0), .Set() ) ;
ALUSlice aALU21( .A(dataA[21]), .B(dataB[21]), .Cin( Cout[21] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[21] ), .Cout( Cout[22] ), .less(1'b0), .Set() ) ;
ALUSlice aALU22( .A(dataA[22]), .B(dataB[22]), .Cin( Cout[22] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[22] ), .Cout( Cout[23] ), .less(1'b0), .Set() ) ;
ALUSlice aALU23( .A(dataA[23]), .B(dataB[23]), .Cin( Cout[23] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[23] ), .Cout( Cout[24] ), .less(1'b0), .Set() ) ;
ALUSlice aALU24( .A(dataA[24]), .B(dataB[24]), .Cin( Cout[24] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[24] ), .Cout( Cout[25] ), .less(1'b0), .Set() ) ;
ALUSlice aALU25( .A(dataA[25]), .B(dataB[25]), .Cin( Cout[25] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[25] ), .Cout( Cout[26] ), .less(1'b0), .Set() ) ;
ALUSlice aALU26( .A(dataA[26]), .B(dataB[26]), .Cin( Cout[26] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[26] ), .Cout( Cout[27] ), .less(1'b0), .Set() ) ;
ALUSlice aALU27( .A(dataA[27]), .B(dataB[27]), .Cin( Cout[27] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[27] ), .Cout( Cout[28] ), .less(1'b0), .Set() );// errors
ALUSlice aALU28( .A(dataA[28]), .B(dataB[28]), .Cin( Cout[28] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[28] ), .Cout( Cout[29] ), .less(1'b0), .Set() ) ;
ALUSlice aALU29( .A(dataA[29]), .B(dataB[29]), .Cin( Cout[29] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[29] ), .Cout( Cout[30] ), .less(1'b0), .Set() ) ;
ALUSlice aALU30( .A(dataA[30]), .B(dataB[30]), .Cin( Cout[30] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[30] ), .Cout( Cout[31] ), .less(1'b0), .Set() ) ;
ALUSlice aALU31( .A(dataA[31]), .B(dataB[31]), .Cin( Cout[31] ), .Signal(Signal), .Inverse(Inverse), .dataOut( temp[31] ), .Cout( Cout32 ), .less(1'b0), .Set(set) ) ;




/*
上面這個case是在做訊號處理
分別根據傳進來的signal來做不同的運算
然後放進暫存器
*/

assign dataOut = temp ;
/*
=====================================================
上面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/

endmodule