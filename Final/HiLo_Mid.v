
module HiLo( clk, MultuAns, HiOut, LoOut, reset );
input clk ;
input reset ;
input [63:0] MultuAns ;
output [31:0] HiOut ;
output [31:0] LoOut ;

reg [63:0] HiLo ;

/*
=====================================================
下面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/
always@( posedge clk or reset )
begin
  if ( reset )
  begin
    HiLo = 64'b0 ;
  end
/*
reset訊號 如果是reset就做歸0
*/
  else
  begin
    HiLo = MultuAns ;
  end
/*
把傳入的乘法答案存起來
*/
end

assign HiOut = HiLo[63:32] ;
assign LoOut = HiLo[31:0] ;
/*
=====================================================
上面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/
endmodule