`timescale 1ns/1ns
module BarrelShifter( dataA, dataB, Signal, dataOut, reset );
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] dataOut ;

wire [31:0] temp ;
wire [31:0] temp1 ;
wire [31:0] temp2 ;
wire [31:0] temp3 ;
wire [31:0] temp4 ;

parameter SLL = 6'b000000;

/*
=====================================================
下面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/
//第一層
MUX2to1 Mux2to1_1_0( .in0(1'b0), .in1(dataA[0]), .sel(dataB[0]), .out(temp1[0]) ) ;
MUX2to1 Mux2to1_1_1( .in0(dataA[0]), .in1(dataA[1]), .sel(dataB[0]), .out(temp1[1]) ) ;
MUX2to1 Mux2to1_1_2( .in0(dataA[1]), .in1(dataA[2]), .sel(dataB[0]), .out(temp1[2]) ) ;
MUX2to1 Mux2to1_1_3( .in0(dataA[2]), .in1(dataA[3]), .sel(dataB[0]), .out(temp1[3]) ) ;
MUX2to1 Mux2to1_1_4( .in0(dataA[3]), .in1(dataA[4]), .sel(dataB[0]), .out(temp1[4]) ) ;
MUX2to1 Mux2to1_1_5( .in0(dataA[4]), .in1(dataA[5]), .sel(dataB[0]), .out(temp1[5]) ) ;
MUX2to1 Mux2to1_1_6( .in0(dataA[5]), .in1(dataA[6]), .sel(dataB[0]), .out(temp1[6]) ) ;
MUX2to1 Mux2to1_1_7( .in0(dataA[6]), .in1(dataA[7]), .sel(dataB[0]), .out(temp1[7]) ) ;
MUX2to1 Mux2to1_1_8( .in0(dataA[7]), .in1(dataA[8]), .sel(dataB[0]), .out(temp1[8]) ) ;
MUX2to1 Mux2to1_1_9( .in0(dataA[8]), .in1(dataA[9]), .sel(dataB[0]), .out(temp1[9]) ) ;
MUX2to1 Mux2to1_1_10( .in0(dataA[9]), .in1(dataA[10]), .sel(dataB[0]), .out(temp1[10]) ) ;
MUX2to1 Mux2to1_1_11( .in0(dataA[10]), .in1(dataA[11]), .sel(dataB[0]), .out(temp1[11]) ) ;
MUX2to1 Mux2to1_1_12( .in0(dataA[11]), .in1(dataA[12]), .sel(dataB[0]), .out(temp1[12]) ) ;
MUX2to1 Mux2to1_1_13( .in0(dataA[12]), .in1(dataA[13]), .sel(dataB[0]), .out(temp1[13]) ) ;
MUX2to1 Mux2to1_1_14( .in0(dataA[13]), .in1(dataA[14]), .sel(dataB[0]), .out(temp1[14]) ) ;
MUX2to1 Mux2to1_1_15( .in0(dataA[14]), .in1(dataA[15]), .sel(dataB[0]), .out(temp1[15]) ) ;
MUX2to1 Mux2to1_1_16( .in0(dataA[15]), .in1(dataA[16]), .sel(dataB[0]), .out(temp1[16]) ) ;
MUX2to1 Mux2to1_1_17( .in0(dataA[16]), .in1(dataA[17]), .sel(dataB[0]), .out(temp1[17]) ) ;
MUX2to1 Mux2to1_1_18( .in0(dataA[17]), .in1(dataA[18]), .sel(dataB[0]), .out(temp1[18]) ) ;
MUX2to1 Mux2to1_1_19( .in0(dataA[18]), .in1(dataA[19]), .sel(dataB[0]), .out(temp1[19]) ) ;
MUX2to1 Mux2to1_1_20( .in0(dataA[19]), .in1(dataA[20]), .sel(dataB[0]), .out(temp1[20]) ) ;
MUX2to1 Mux2to1_1_21( .in0(dataA[20]), .in1(dataA[21]), .sel(dataB[0]), .out(temp1[21]) ) ;
MUX2to1 Mux2to1_1_22( .in0(dataA[21]), .in1(dataA[22]), .sel(dataB[0]), .out(temp1[22]) ) ;
MUX2to1 Mux2to1_1_23( .in0(dataA[22]), .in1(dataA[23]), .sel(dataB[0]), .out(temp1[23]) ) ;
MUX2to1 Mux2to1_1_24( .in0(dataA[23]), .in1(dataA[24]), .sel(dataB[0]), .out(temp1[24]) ) ;
MUX2to1 Mux2to1_1_25( .in0(dataA[24]), .in1(dataA[25]), .sel(dataB[0]), .out(temp1[25]) ) ;
MUX2to1 Mux2to1_1_26( .in0(dataA[25]), .in1(dataA[26]), .sel(dataB[0]), .out(temp1[26]) ) ;
MUX2to1 Mux2to1_1_27( .in0(dataA[26]), .in1(dataA[27]), .sel(dataB[0]), .out(temp1[27]) ) ;
MUX2to1 Mux2to1_1_28( .in0(dataA[27]), .in1(dataA[28]), .sel(dataB[0]), .out(temp1[28]) ) ;
MUX2to1 Mux2to1_1_29( .in0(dataA[28]), .in1(dataA[29]), .sel(dataB[0]), .out(temp1[29]) ) ;
MUX2to1 Mux2to1_1_30( .in0(dataA[29]), .in1(dataA[30]), .sel(dataB[0]), .out(temp1[30]) ) ;
MUX2to1 Mux2to1_1_31( .in0(dataA[30]), .in1(dataA[31]), .sel(dataB[0]), .out(temp1[31]) ) ;
//第二層
MUX2to1 Mux2to1_2_0( .in0(1'b0), .in1(temp1[0]), .sel(dataB[1]), .out(temp2[0]) ) ;
MUX2to1 Mux2to1_2_1( .in0(1'b0), .in1(temp1[1]), .sel(dataB[1]), .out(temp2[1]) ) ;
MUX2to1 Mux2to1_2_2( .in0(temp1[0]), .in1(temp1[2]), .sel(dataB[1]), .out(temp2[2]) ) ;
MUX2to1 Mux2to1_2_3( .in0(temp1[1]), .in1(temp1[3]), .sel(dataB[1]), .out(temp2[3]) ) ;
MUX2to1 Mux2to1_2_4( .in0(temp1[2]), .in1(temp1[4]), .sel(dataB[1]), .out(temp2[4]) ) ;
MUX2to1 Mux2to1_2_5( .in0(temp1[3]), .in1(temp1[5]), .sel(dataB[1]), .out(temp2[5]) ) ;
MUX2to1 Mux2to1_2_6( .in0(temp1[4]), .in1(temp1[6]), .sel(dataB[1]), .out(temp2[6]) ) ;
MUX2to1 Mux2to1_2_7( .in0(temp1[5]), .in1(temp1[7]), .sel(dataB[1]), .out(temp2[7]) ) ;
MUX2to1 Mux2to1_2_8( .in0(temp1[6]), .in1(temp1[8]), .sel(dataB[1]), .out(temp2[8]) ) ;
MUX2to1 Mux2to1_2_9( .in0(temp1[7]), .in1(temp1[9]), .sel(dataB[1]), .out(temp2[9]) ) ;
MUX2to1 Mux2to1_2_10( .in0(temp1[8]), .in1(temp1[10]), .sel(dataB[1]), .out(temp2[10]) ) ;
MUX2to1 Mux2to1_2_11( .in0(temp1[9]), .in1(temp1[11]), .sel(dataB[1]), .out(temp2[11]) ) ;
MUX2to1 Mux2to1_2_12( .in0(temp1[10]), .in1(temp1[12]), .sel(dataB[1]), .out(temp2[12]) ) ;
MUX2to1 Mux2to1_2_13( .in0(temp1[11]), .in1(temp1[13]), .sel(dataB[1]), .out(temp2[13]) ) ;
MUX2to1 Mux2to1_2_14( .in0(temp1[12]), .in1(temp1[14]), .sel(dataB[1]), .out(temp2[14]) ) ;
MUX2to1 Mux2to1_2_15( .in0(temp1[13]), .in1(temp1[15]), .sel(dataB[1]), .out(temp2[15]) ) ;
MUX2to1 Mux2to1_2_16( .in0(temp1[14]), .in1(temp1[16]), .sel(dataB[1]), .out(temp2[16]) ) ;
MUX2to1 Mux2to1_2_17( .in0(temp1[15]), .in1(temp1[17]), .sel(dataB[1]), .out(temp2[17]) ) ;
MUX2to1 Mux2to1_2_18( .in0(temp1[16]), .in1(temp1[18]), .sel(dataB[1]), .out(temp2[18]) ) ;
MUX2to1 Mux2to1_2_19( .in0(temp1[17]), .in1(temp1[19]), .sel(dataB[1]), .out(temp2[19]) ) ;
MUX2to1 Mux2to1_2_20( .in0(temp1[18]), .in1(temp1[20]), .sel(dataB[1]), .out(temp2[20]) ) ;
MUX2to1 Mux2to1_2_21( .in0(temp1[19]), .in1(temp1[21]), .sel(dataB[1]), .out(temp2[21]) ) ;
MUX2to1 Mux2to1_2_22( .in0(temp1[20]), .in1(temp1[22]), .sel(dataB[1]), .out(temp2[22]) ) ;
MUX2to1 Mux2to1_2_23( .in0(temp1[21]), .in1(temp1[23]), .sel(dataB[1]), .out(temp2[23]) ) ;
MUX2to1 Mux2to1_2_24( .in0(temp1[22]), .in1(temp1[24]), .sel(dataB[1]), .out(temp2[24]) ) ;
MUX2to1 Mux2to1_2_25( .in0(temp1[23]), .in1(temp1[25]), .sel(dataB[1]), .out(temp2[25]) ) ;
MUX2to1 Mux2to1_2_26( .in0(temp1[24]), .in1(temp1[26]), .sel(dataB[1]), .out(temp2[26]) ) ;
MUX2to1 Mux2to1_2_27( .in0(temp1[25]), .in1(temp1[27]), .sel(dataB[1]), .out(temp2[27]) ) ;
MUX2to1 Mux2to1_2_28( .in0(temp1[26]), .in1(temp1[28]), .sel(dataB[1]), .out(temp2[28]) ) ;
MUX2to1 Mux2to1_2_29( .in0(temp1[27]), .in1(temp1[29]), .sel(dataB[1]), .out(temp2[29]) ) ;
MUX2to1 Mux2to1_2_30( .in0(temp1[28]), .in1(temp1[30]), .sel(dataB[1]), .out(temp2[30]) ) ;
MUX2to1 Mux2to1_2_31( .in0(temp1[29]), .in1(temp1[31]), .sel(dataB[1]), .out(temp2[31]) ) ;
//第三層
MUX2to1 Mux2to1_3_0( .in0(1'b0), .in1(temp2[0]), .sel(dataB[2]), .out(temp3[0]) ) ;
MUX2to1 Mux2to1_3_1( .in0(1'b0), .in1(temp2[1]), .sel(dataB[2]), .out(temp3[1]) ) ;
MUX2to1 Mux2to1_3_2( .in0(1'b0), .in1(temp2[2]), .sel(dataB[2]), .out(temp3[2]) ) ;
MUX2to1 Mux2to1_3_3( .in0(1'b0), .in1(temp2[3]), .sel(dataB[2]), .out(temp3[3]) ) ;
MUX2to1 Mux2to1_3_4( .in0(temp2[0]), .in1(temp2[4]), .sel(dataB[2]), .out(temp3[4]) ) ;
MUX2to1 Mux2to1_3_5( .in0(temp2[1]), .in1(temp2[5]), .sel(dataB[2]), .out(temp3[5]) ) ;
MUX2to1 Mux2to1_3_6( .in0(temp2[2]), .in1(temp2[6]), .sel(dataB[2]), .out(temp3[6]) ) ;
MUX2to1 Mux2to1_3_7( .in0(temp2[3]), .in1(temp2[7]), .sel(dataB[2]), .out(temp3[7]) ) ;
MUX2to1 Mux2to1_3_8( .in0(temp2[4]), .in1(temp2[8]), .sel(dataB[2]), .out(temp3[8]) ) ;
MUX2to1 Mux2to1_3_9( .in0(temp2[5]), .in1(temp2[9]), .sel(dataB[2]), .out(temp3[9]) ) ;
MUX2to1 Mux2to1_3_10( .in0(temp2[6]), .in1(temp2[10]), .sel(dataB[2]), .out(temp3[10]) ) ;
MUX2to1 Mux2to1_3_11( .in0(temp2[7]), .in1(temp2[11]), .sel(dataB[2]), .out(temp3[11]) ) ;
MUX2to1 Mux2to1_3_12( .in0(temp2[8]), .in1(temp2[12]), .sel(dataB[2]), .out(temp3[12]) ) ;
MUX2to1 Mux2to1_3_13( .in0(temp2[9]), .in1(temp2[13]), .sel(dataB[2]), .out(temp3[13]) ) ;
MUX2to1 Mux2to1_3_14( .in0(temp2[10]), .in1(temp2[14]), .sel(dataB[2]), .out(temp3[14]) ) ;
MUX2to1 Mux2to1_3_15( .in0(temp2[11]), .in1(temp2[15]), .sel(dataB[2]), .out(temp3[15]) ) ;
MUX2to1 Mux2to1_3_16( .in0(temp2[12]), .in1(temp2[16]), .sel(dataB[2]), .out(temp3[16]) ) ;
MUX2to1 Mux2to1_3_17( .in0(temp2[13]), .in1(temp2[17]), .sel(dataB[2]), .out(temp3[17]) ) ;
MUX2to1 Mux2to1_3_18( .in0(temp2[14]), .in1(temp2[18]), .sel(dataB[2]), .out(temp3[18]) ) ;
MUX2to1 Mux2to1_3_19( .in0(temp2[15]), .in1(temp2[19]), .sel(dataB[2]), .out(temp3[19]) ) ;
MUX2to1 Mux2to1_3_20( .in0(temp2[16]), .in1(temp2[20]), .sel(dataB[2]), .out(temp3[20]) ) ;
MUX2to1 Mux2to1_3_21( .in0(temp2[17]), .in1(temp2[21]), .sel(dataB[2]), .out(temp3[21]) ) ;
MUX2to1 Mux2to1_3_22( .in0(temp2[18]), .in1(temp2[22]), .sel(dataB[2]), .out(temp3[22]) ) ;
MUX2to1 Mux2to1_3_23( .in0(temp2[19]), .in1(temp2[23]), .sel(dataB[2]), .out(temp3[23]) ) ;
MUX2to1 Mux2to1_3_24( .in0(temp2[20]), .in1(temp2[24]), .sel(dataB[2]), .out(temp3[24]) ) ;
MUX2to1 Mux2to1_3_25( .in0(temp2[21]), .in1(temp2[25]), .sel(dataB[2]), .out(temp3[25]) ) ;
MUX2to1 Mux2to1_3_26( .in0(temp2[22]), .in1(temp2[26]), .sel(dataB[2]), .out(temp3[26]) ) ;
MUX2to1 Mux2to1_3_27( .in0(temp2[23]), .in1(temp2[27]), .sel(dataB[2]), .out(temp3[27]) ) ;
MUX2to1 Mux2to1_3_28( .in0(temp2[24]), .in1(temp2[28]), .sel(dataB[2]), .out(temp3[28]) ) ;
MUX2to1 Mux2to1_3_29( .in0(temp2[25]), .in1(temp2[29]), .sel(dataB[2]), .out(temp3[29]) ) ;
MUX2to1 Mux2to1_3_30( .in0(temp2[26]), .in1(temp2[30]), .sel(dataB[2]), .out(temp3[30]) ) ;
MUX2to1 Mux2to1_3_31( .in0(temp2[27]), .in1(temp2[31]), .sel(dataB[2]), .out(temp3[31]) ) ;
//第四層
MUX2to1 Mux2to1_4_0( .in0(1'b0), .in1(temp3[0]), .sel(dataB[3]), .out(temp4[0]) ) ;
MUX2to1 Mux2to1_4_1( .in0(1'b0), .in1(temp3[1]), .sel(dataB[3]), .out(temp4[1]) ) ;
MUX2to1 Mux2to1_4_2( .in0(1'b0), .in1(temp3[2]), .sel(dataB[3]), .out(temp4[2]) ) ;
MUX2to1 Mux2to1_4_3( .in0(1'b0), .in1(temp3[3]), .sel(dataB[3]), .out(temp4[3]) ) ;
MUX2to1 Mux2to1_4_4( .in0(1'b0), .in1(temp3[4]), .sel(dataB[3]), .out(temp4[4]) ) ;
MUX2to1 Mux2to1_4_5( .in0(1'b0), .in1(temp3[5]), .sel(dataB[3]), .out(temp4[5]) ) ;
MUX2to1 Mux2to1_4_6( .in0(1'b0), .in1(temp3[6]), .sel(dataB[3]), .out(temp4[6]) ) ;
MUX2to1 Mux2to1_4_7( .in0(1'b0), .in1(temp3[7]), .sel(dataB[3]), .out(temp4[7]) ) ;
MUX2to1 Mux2to1_4_8( .in0(temp3[0]), .in1(temp3[8]), .sel(dataB[3]), .out(temp4[8]) ) ;
MUX2to1 Mux2to1_4_9( .in0(temp3[1]), .in1(temp3[9]), .sel(dataB[3]), .out(temp4[9]) ) ;
MUX2to1 Mux2to1_4_10( .in0(temp3[2]), .in1(temp3[10]), .sel(dataB[3]), .out(temp4[10]) ) ;
MUX2to1 Mux2to1_4_11( .in0(temp3[3]), .in1(temp3[11]), .sel(dataB[3]), .out(temp4[11]) ) ;
MUX2to1 Mux2to1_4_12( .in0(temp3[4]), .in1(temp3[12]), .sel(dataB[3]), .out(temp4[12]) ) ;
MUX2to1 Mux2to1_4_13( .in0(temp3[5]), .in1(temp3[13]), .sel(dataB[3]), .out(temp4[13]) ) ;
MUX2to1 Mux2to1_4_14( .in0(temp3[6]), .in1(temp3[14]), .sel(dataB[3]), .out(temp4[14]) ) ;
MUX2to1 Mux2to1_4_15( .in0(temp3[7]), .in1(temp3[15]), .sel(dataB[3]), .out(temp4[15]) ) ;
MUX2to1 Mux2to1_4_16( .in0(temp3[8]), .in1(temp3[16]), .sel(dataB[3]), .out(temp4[16]) ) ;
MUX2to1 Mux2to1_4_17( .in0(temp3[9]), .in1(temp3[17]), .sel(dataB[3]), .out(temp4[17]) ) ;
MUX2to1 Mux2to1_4_18( .in0(temp3[10]), .in1(temp3[18]), .sel(dataB[3]), .out(temp4[18]) ) ;
MUX2to1 Mux2to1_4_19( .in0(temp3[11]), .in1(temp3[19]), .sel(dataB[3]), .out(temp4[19]) ) ;
MUX2to1 Mux2to1_4_20( .in0(temp3[12]), .in1(temp3[20]), .sel(dataB[3]), .out(temp4[20]) ) ;
MUX2to1 Mux2to1_4_21( .in0(temp3[13]), .in1(temp3[21]), .sel(dataB[3]), .out(temp4[21]) ) ;
MUX2to1 Mux2to1_4_22( .in0(temp3[14]), .in1(temp3[22]), .sel(dataB[3]), .out(temp4[22]) ) ;
MUX2to1 Mux2to1_4_23( .in0(temp3[15]), .in1(temp3[23]), .sel(dataB[3]), .out(temp4[23]) ) ;
MUX2to1 Mux2to1_4_24( .in0(temp3[16]), .in1(temp3[24]), .sel(dataB[3]), .out(temp4[24]) ) ;
MUX2to1 Mux2to1_4_25( .in0(temp3[17]), .in1(temp3[25]), .sel(dataB[3]), .out(temp4[25]) ) ;
MUX2to1 Mux2to1_4_26( .in0(temp3[18]), .in1(temp3[26]), .sel(dataB[3]), .out(temp4[26]) ) ;
MUX2to1 Mux2to1_4_27( .in0(temp3[19]), .in1(temp3[27]), .sel(dataB[3]), .out(temp4[27]) ) ;
MUX2to1 Mux2to1_4_28( .in0(temp3[20]), .in1(temp3[28]), .sel(dataB[3]), .out(temp4[28]) ) ;
MUX2to1 Mux2to1_4_29( .in0(temp3[21]), .in1(temp3[29]), .sel(dataB[3]), .out(temp4[29]) ) ;
MUX2to1 Mux2to1_4_30( .in0(temp3[22]), .in1(temp3[30]), .sel(dataB[3]), .out(temp4[30]) ) ;
MUX2to1 Mux2to1_4_31( .in0(temp3[23]), .in1(temp3[31]), .sel(dataB[3]), .out(temp4[31]) ) ;
//第五層
MUX2to1 Mux2to1_5_0( .in0(1'b0), .in1(temp4[0]), .sel(dataB[4]), .out(temp[0]) ) ;
MUX2to1 Mux2to1_5_1( .in0(1'b0), .in1(temp4[1]), .sel(dataB[4]), .out(temp[1]) ) ;
MUX2to1 Mux2to1_5_2( .in0(1'b0), .in1(temp4[2]), .sel(dataB[4]), .out(temp[2]) ) ;
MUX2to1 Mux2to1_5_3( .in0(1'b0), .in1(temp4[3]), .sel(dataB[4]), .out(temp[3]) ) ;
MUX2to1 Mux2to1_5_4( .in0(1'b0), .in1(temp4[4]), .sel(dataB[4]), .out(temp[4]) ) ;
MUX2to1 Mux2to1_5_5( .in0(1'b0), .in1(temp4[5]), .sel(dataB[4]), .out(temp[5]) ) ;
MUX2to1 Mux2to1_5_6( .in0(1'b0), .in1(temp4[6]), .sel(dataB[4]), .out(temp[6]) ) ;
MUX2to1 Mux2to1_5_7( .in0(1'b0), .in1(temp4[7]), .sel(dataB[4]), .out(temp[7]) ) ;
MUX2to1 Mux2to1_5_8( .in0(1'b0), .in1(temp4[8]), .sel(dataB[4]), .out(temp[8]) ) ;
MUX2to1 Mux2to1_5_9( .in0(1'b0), .in1(temp4[9]), .sel(dataB[4]), .out(temp[9]) ) ;
MUX2to1 Mux2to1_5_10( .in0(1'b0), .in1(temp4[10]), .sel(dataB[4]), .out(temp[10]) ) ;
MUX2to1 Mux2to1_5_11( .in0(1'b0), .in1(temp4[11]), .sel(dataB[4]), .out(temp[11]) ) ;
MUX2to1 Mux2to1_5_12( .in0(1'b0), .in1(temp4[12]), .sel(dataB[4]), .out(temp[12]) ) ;
MUX2to1 Mux2to1_5_13( .in0(1'b0), .in1(temp4[13]), .sel(dataB[4]), .out(temp[13]) ) ;
MUX2to1 Mux2to1_5_14( .in0(1'b0), .in1(temp4[14]), .sel(dataB[4]), .out(temp[14]) ) ;
MUX2to1 Mux2to1_5_15( .in0(1'b0), .in1(temp4[15]), .sel(dataB[4]), .out(temp[15]) ) ;
MUX2to1 Mux2to1_5_16( .in0(temp4[0]), .in1(temp4[16]), .sel(dataB[4]), .out(temp[16]) ) ;
MUX2to1 Mux2to1_5_17( .in0(temp4[1]), .in1(temp4[17]), .sel(dataB[4]), .out(temp[17]) ) ;
MUX2to1 Mux2to1_5_18( .in0(temp4[2]), .in1(temp4[18]), .sel(dataB[4]), .out(temp[18]) ) ;
MUX2to1 Mux2to1_5_19( .in0(temp4[3]), .in1(temp4[19]), .sel(dataB[4]), .out(temp[19]) ) ;
MUX2to1 Mux2to1_5_20( .in0(temp4[4]), .in1(temp4[20]), .sel(dataB[4]), .out(temp[20]) ) ;
MUX2to1 Mux2to1_5_21( .in0(temp4[5]), .in1(temp4[21]), .sel(dataB[4]), .out(temp[21]) ) ;
MUX2to1 Mux2to1_5_22( .in0(temp4[6]), .in1(temp4[22]), .sel(dataB[4]), .out(temp[22]) ) ;
MUX2to1 Mux2to1_5_23( .in0(temp4[7]), .in1(temp4[23]), .sel(dataB[4]), .out(temp[23]) ) ;
MUX2to1 Mux2to1_5_24( .in0(temp4[8]), .in1(temp4[24]), .sel(dataB[4]), .out(temp[24]) ) ;
MUX2to1 Mux2to1_5_25( .in0(temp4[9]), .in1(temp4[25]), .sel(dataB[4]), .out(temp[25]) ) ;
MUX2to1 Mux2to1_5_26( .in0(temp4[10]), .in1(temp4[26]), .sel(dataB[4]), .out(temp[26]) ) ;
MUX2to1 Mux2to1_5_27( .in0(temp4[11]), .in1(temp4[27]), .sel(dataB[4]), .out(temp[27]) ) ;
MUX2to1 Mux2to1_5_28( .in0(temp4[12]), .in1(temp4[28]), .sel(dataB[4]), .out(temp[28]) ) ;
MUX2to1 Mux2to1_5_29( .in0(temp4[13]), .in1(temp4[29]), .sel(dataB[4]), .out(temp[29]) ) ;
MUX2to1 Mux2to1_5_30( .in0(temp4[14]), .in1(temp4[30]), .sel(dataB[4]), .out(temp[30]) ) ;
MUX2to1 Mux2to1_5_31( .in0(temp4[15]), .in1(temp4[31]), .sel(dataB[4]), .out(temp[31]) ) ;
/*
移位器運算
*/

assign dataOut = (reset|dataB[31:5]) ? 32'b0 : temp ;
/*
=====================================================
上面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/

endmodule