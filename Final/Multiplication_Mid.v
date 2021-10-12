`timescale 1ns/1ns
module Multiplication( clk, dataA, dataB, Signal, dataOut, reset );
input clk ;
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [63:0] dataOut ;

//   Signal ( 6-bits)?
//   MULTU  : 25

reg [63:0] multiplicand ;
reg [31:0] multiplier ;
reg [63:0] product ;
reg [63:0] temp ;
parameter MULTU = 6'b011001;
parameter OUT = 6'b111111;
/*
定義各種訊號
*/
/*
=====================================================
下面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/


always@( posedge clk or reset )
begin
        if ( reset )
        begin
			product = 64'b0 ;
            temp = 64'b0 ;
        end
/*
reset訊號 如果是reset就做歸0
*/
        else
        begin
		case ( Signal )
  		MULTU:
		begin
			if( multiplier[0] ) 
			begin
				product = product + multiplicand ;
				multiplicand = { multiplicand[62:0], 1'b0 } ;
				multiplier = { 1'b0, multiplier[31:1] } ;
			end
			else
			begin
				multiplicand = { multiplicand[62:0], 1'b0 } ;
				multiplier = { 1'b0, multiplier[31:1] } ;
			end
		end
  		OUT:
		begin
			 temp[63:32] = product[63:32] ;
			 temp[31:0]= product[31:0] ;
		end
		default:
		begin
			product = 64'b0 ;
			multiplicand = { 32'b0, dataA } ;  
			multiplier = dataB ;
		end
		endcase
        end
/*
乘法運算
OUT的部分是要等control給你指令你才能夠把答案輸出到HILO暫存器
*/

end
assign dataOut = temp ;
/*
=====================================================
上面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/
endmodule