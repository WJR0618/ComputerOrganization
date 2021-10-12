module ALUControl( clk, Signal, SignaltoALU, SignaltoSHT, SignaltoMULTU, SignaltoMUX );
input clk ;
input [5:0] Signal ;
output [5:0] SignaltoALU ;
output [5:0] SignaltoSHT ;
output [5:0] SignaltoMULTU ;
output [5:0] SignaltoMUX ;

//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SLL  : 0
//   SLT  : 42
//   MULTU : 25


reg [5:0] temp ;
reg [6:0] counter ;


parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;
parameter SLL = 6'b000000;
parameter MULTU= 6'b011001;
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;
/*
�w�q�U�ذT��
*/

/*
=====================================================
�U���������d�ҡA�{�����g�п��ӦѮv�W�һ�������k�Ӽg
=====================================================
*/
always@( Signal )
begin
  case( Signal ) 
    ADD:
    begin
      temp = ADD ;
    end     

    OR:
    begin
      temp = OR ;
    end  

    SUB:
    begin
      temp = SUB ;
    end  

    SLT:
    begin
      temp = SLT ;
    end  

    SLL:
    begin
      temp = SLL ;
    end  

    MULTU:
    begin
      temp = MULTU ;
      counter = 0 ;
    end

    MFHI:
    begin
      temp = MFHI ;
    end

    MFLO:
    begin
      temp = MFLO ;
    end

  endcase
/*
�p�G�T�����ܦ����k �N��counter�k0
*/
end

always@( posedge clk )
begin
  temp = Signal ;
  if ( Signal == MULTU )
  begin
    if ( counter == 32 )
    begin
      temp = 6'b111111 ; // Open HiLo reg for Div
      counter = 0 ;
    end
	else 
	begin
	  counter = counter + 1;
	end
  end
end  

/*
��32��clk�M��}��HiLo�Ȧs�������k����ȶi�h
*/

assign SignaltoALU = temp ;
assign SignaltoSHT = temp ;
assign SignaltoMULTU = temp ;
assign SignaltoMUX = temp ;


endmodule