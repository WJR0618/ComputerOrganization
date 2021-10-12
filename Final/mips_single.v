//	Title: MIPS Single-Cycle Processor
//	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
module mips_single( clk, rst );
	input clk, rst;
	
	// instruction bus
	wire[31:0] instr, instr_to_ID_EX, pc_incr_to_ID_EX, pc_incr_to_EX_MEM ;
	
	// break out important fields from instruction
	wire [5:0] opcode, funct;
    wire [4:0] rs, rt, rd, shamt, rd_to_EX_MEM , rt_to_EX_MEM;
    wire [15:0] immed;
    wire [31:0] extend_immed, b_offset, ext_immed_to_EX_MEM;
    wire [25:0] jumpoffset;
	
	// datapath signals
    wire [4:0] rfile_wn, WN_to_MEM_WB, rfile_wn_to_RF;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, alu_b, alu_out, b_tgt, pc_next,
                pc, pc_incr, dmem_rdata, jump_addr, branch_addr, rfile_rd1_to_EX_MEM, rfile_rd2_to_EX_MEM, b_tgt_to_MEM_WB,
				alu_out_to_MEM_WB, rfile_rd2_to_MEM_WB, dmem_rdata_WB, alu_out_WB, ext_immed_to_MEM_WB ;
	
	// control signals
	wire Zero ;
    wire RegWrite, Branch, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Jump, Zero_to_MEM_WB;
	wire RegWrite_to_EX_MEM, Branch_to_EX_MEM, RegDst_to_EX_MEM, MemtoReg_to_EX_MEM, MemRead_to_EX_MEM,
		 MemWrite_to_EX_MEM, ALUSrc_to_EX_MEM, Jump_to_EX_MEM, RegWrite_to_RF, MemtoReg_to_RF;
	wire RegWrite_to_MEM_WB, Branch_to_MEM_WB, MemtoReg_to_MEM_WB, MemRead_to_MEM_WB, MemWrite_to_MEM_WB;
    wire [1:0] ALUOp, ALUOp_to_EX_MEM;
    wire [5:0] Operation, Funct_out;
	//funct
	/*以下放入IF_ID_mem處理*/
    assign opcode = instr_to_ID_EX[31:26]; // 6bits
    assign rs = instr_to_ID_EX[25:21]; // 5 bits
    assign rt = instr_to_ID_EX[20:16]; // 5 bits
    assign rd = instr_to_ID_EX[15:11]; // 5 bits
    assign shamt = instr_to_ID_EX[10:6]; // 5 bits
    assign funct = instr_to_ID_EX[5:0]; //6 bits
    assign immed = instr_to_ID_EX[15:0]; // 16 bits
    assign jumpoffset = instr_to_ID_EX[25:0]; // 26 bits
	/*以上放入IF_ID_mem處理*/
	
	IF_ID_Register IF_ID( .clk(clk), .reset(rst), .pc_incr_in(pc_incr), .instr_in( instr ), .pc_incr_out(pc_incr_to_ID_EX), .instr_out(instr_to_ID_EX) ) ;
	ID_EX_Register ID_EX( .clk(clk), .reset(rst), .pc_incr_in(pc_incr_to_ID_EX), .pc_incr_out(pc_incr_to_EX_MEM), .RegDst(RegDst), .ALUSrc(ALUSrc),
						  .MemtoReg(MemtoReg), .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), .Jump(), .ALUOp(ALUOp),///jump change
					      .RD1_in(rfile_rd1), .RD2_in(rfile_rd2), .extend_immed_in(extend_immed), .rt_in(rt), .rd_in(rd), .RegDst_out(RegDst_to_EX_MEM),
						  .ALUSrc_out(ALUSrc_to_EX_MEM), .MemtoReg_out(MemtoReg_to_EX_MEM), .RegWrite_out(RegWrite_to_EX_MEM), .MemRead_out(MemRead_to_EX_MEM),
						  .MemWrite_out(MemWrite_to_EX_MEM), .Branch_out(Branch_to_EX_MEM), .Jump_out(Jump_to_EX_MEM), .ALUOp_out(ALUOp_to_EX_MEM),
						  .RD1_out(rfile_rd1_to_EX_MEM), .RD2_out(rfile_rd2_to_EX_MEM), .extend_immed_out(ext_immed_to_EX_MEM), .rt_out(rt_to_EX_MEM), .rd_out(rd_to_EX_MEM),
						  .Funct_in(funct), .Funct_out(Funct_out)) ;
	EX_MEM_Register EX_MEM( .clk(clk), .reset(rst), .Branch(Branch_to_EX_MEM), .MemRead(MemRead_to_EX_MEM), .MemWrite(MemWrite_to_EX_MEM), .RegWrite(RegWrite_to_EX_MEM),
							.MemtoReg(MemtoReg_to_EX_MEM), .b_tgt_in(b_tgt), .alu_out_in(alu_out), .RD2(rfile_rd2_to_EX_MEM), .rfile_wn_in(rfile_wn) , .Branch_out(Branch_to_MEM_WB),
							.MemRead_Out(MemRead_to_MEM_WB), .MemWrite_out(MemWrite_to_MEM_WB), .RegWrite_out(RegWrite_to_MEM_WB), .MemtoReg_out(MemtoReg_to_MEM_WB),
							.b_tgt_out(b_tgt_to_MEM_WB), .alu_out_out(alu_out_to_MEM_WB), .RD2_out(rfile_rd2_to_MEM_WB), .rfile_wn_out(WN_to_MEM_WB), .ext_immed_in(ext_immed_to_EX_MEM),
							.ext_immed_out(ext_immed_to_MEM_WB), .zero(Zero), .zero_out(Zero_to_MEM_WB) ) ;
	MEM_WB_Register MEM_WB( .clk(clk), .reset(rst), .RegWrite(RegWrite_to_MEM_WB), .MemtoReg(MemRead_to_MEM_WB), .dmem_rdata_in(dmem_rdata), .alu_out_in(alu_out_to_MEM_WB), 
							.rfile_wn_in(rfile_rd2_to_MEM_WB), .RegWrite_out(RegWrite_to_RF), .MemtoReg_out(MemtoReg_to_RF), .dmem_rdata_out(dmem_rdata_WB), .alu_out_out(alu_out_WB),
							.rfile_wn_out(rfile_wn_to_RF) ) ;
	
	// branch offset shifter
    assign b_offset = ext_immed_to_EX_MEM << 2;
	
	// jump offset shifter & concatenation
	assign jump_addr = { pc_incr[31:28], jumpoffset <<2 };

	// module instantiations
	
	reg32 PC( .clk(clk), .rst(rst), .en_reg(1'b1), .d_in(pc_next), .d_out(pc) ); // 暫存PC的值
	// sign-extender
	sign_extend SignExt( .opcode(opcode), .immed_in(immed), .ext_immed_out(extend_immed) ); // sign_extend
	
	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr) ); // PC = PC + 4 // output pc_incr

    add32 BRADD( .a(pc_incr_to_EX_MEM), .b(b_offset), .result(b_tgt) ); // PC = PC + 4 + offset
	
	branch_comparator br( .opcode(opcode), .rd1(rfile_rd1_to_EX_MEM), .rd2(alu_b), .zero(Zero) ) ;
//****************以下為期中的32個ALU Slice 組合成的ALU(可做5種運算)***********************//

    //alu ALU( .ctl(Operation), .a(rfile_rd1), .b(alu_b), .result(alu_out), .zero() );
	TotalALU alu2( .clk(clk), .dataA(rfile_rd1_to_EX_MEM), .dataB(alu_b), .Signal(Operation), .Output(alu_out), .reset(rst) );
	
//****************以上為期中的32個ALU Slice 組合成的ALU(可做5種運算)***********************//

//****************以下為將ALU的ZERO的計算結果與Branch做And判斷是否需要Branch***************//

    and BR_AND(PCSrc, Branch_to_MEM_WB, Zero_to_MEM_WB);
//****************以上為將ALU的ZERO的計算結果與Branch做And判斷是否需要Branch***************//

//****************以下為datapath中的5個多工器**********************************************//

    mux2 #(5) RFMUX( .sel(RegDst_to_EX_MEM), .a(rt_to_EX_MEM), .b(rd_to_EX_MEM), .y(rfile_wn) ); // RegisterFile

    mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr), .b(b_tgt_to_MEM_WB), .y(branch_addr) ); //Program Counter
	
	mux2 #(32) JMUX( .sel(Jump), .a(branch_addr), .b(jump_addr), .y(pc_next) ); // Jump
	
    mux2 #(32) ALUMUX( .sel(ALUSrc_to_EX_MEM), .a(rfile_rd2_to_EX_MEM), .b(ext_immed_to_EX_MEM), .y(alu_b) ); // ALU

    mux2 #(32) WRMUX( .sel(MemtoReg_to_RF), .a(alu_out_WB), .b(dmem_rdata_WB), .y(rfile_wd) ); // WriteBack(?)
	
//****************以上為datapath中的5個多工器**********************************************//

//****************以下為依照控制訊號控制RegDst、ALUSrc、MemtoReg***************************//
//****************、RegWrite、MemRead、MemWrite、Branch、Jump******************************//
    control_single CTL(.opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), 
                       .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), 
                       .Jump(Jump), .ALUOp(ALUOp));
//****************以上為依照控制訊號控制RegDst、ALUSrc、MemtoReg***************************//
//****************、RegWrite、MemRead、MemWrite、Branch、Jump******************************//

//****************以下為判斷+、-、&、|、<的訊號，並將其傳入ALU32判斷***********************//
    alu_ctl ALUCTL( .ALUOp(ALUOp_to_EX_MEM), .Funct(Funct_out), .ALUOperation(Operation) ); // output Operation 6bits
//****************以上為判斷+、-、&、|、<的訊號，並將其傳入ALU32判斷***********************//

//****************以下就是課本上RegFile那個元件********************************************//
	reg_file RegFile( .clk(clk), .RegWrite(RegWrite_to_RF), .RN1(rs), .RN2(rt), .WN(rfile_wn_to_RF), 
					  .WD(rfile_wd), .RD1(rfile_rd1), .RD2(rfile_rd2) ); // output rfile_rd1、rfile_rd2
//****************以上就是課本上RegFile那個元件********************************************//

//****************以下就是課本上Memory那個元件*********************************************//
	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instr) ); // output instr
	memory DatMem( .clk(clk), .MemRead(MemRead_to_MEM_WB), .MemWrite(MemWrite_to_MEM_WB), .wd(rfile_rd2_to_MEM_WB), 
				   .addr(alu_out_to_MEM_WB), .rd(dmem_rdata) ); // output dmem_rdata
//****************以上就是課本上Memory那個元件*********************************************//

endmodule
