`timescale 1ns/ 1ps

`include "mux32.v"
`include "mux5.v"
`include "mux_3to1.v"
`include "1program_counter.v"
`include "2instruction_memory.v"
`include "adder.v"
`include "CONTROL_UNIT.v"
`include "3register_bank.v"
`include "SignExtend.v"
`include "RShift2.v"
`include "comparator.v"
`include "AND.v"
`include "4alu.v"
`include "5data_mem.v"
`include "Hazard_Unit.v"
`include "S1.v"
`include "S2.v"
`include "S3.v"
`include "S4.v"


module DATAPATH(clk, rst);

    input clk, rst;

    //IF
    wire [31:0] PC_in, PC_out, NPC_F, inst_F;
    wire StallPC;

    wire StallD;

    //ID
    wire [31:0]inst_D;
    wire [31:0] A_D, B_D, comp_A, comp_B;
    wire [31:0] SignIm_D, Shift_D, NPC_D, BranchPC_D;
    wire [5:0] ALUfunc_D;
    wire RegWrite_D, MemToReg_D, MemWrite_D, MemRead_D, ALUSrc_D, RegDst_D, BranchD, BranchTrue, equal_D;
    wire F_AD, F_BD;

    wire FlushE;


    //EX
    wire [31:0] A_E, B_E, alu_A, alu_B, ALUout_E;
    wire [31:0] WriteData_E, SignIm_E;
    wire [4:0] Ra_E, Rb_E, Rd_E, WriteReg_E;
    wire [4:0]shamt_E; 
    wire [5:0]ALUfunc_E;
    wire RegWrite_E, MemToReg_E, MemWrite_E, MemRead_E, ALUSrc_E, RegDst_E;
    wire [1:0] F_AE, F_BE;


    //Mem
    wire [31:0] ALUout_M, WriteData_M;
    wire [4:0] WriteReg_M;
    wire RegWrite_M, MemToReg_M, MemWrite_M, MemRead_M;
    wire [31:0] MemData_M;

    //WB
    wire [31:0]MemData_W, ALUout_W, DataIn_Reg;
    wire [4:0] WriteReg_W;
    wire RegWrite_W, MemToReg_W;



    //IF Stage
    mux32 M1(BranchTrue, NPC_F, BranchPC_D, PC_in);
    PC ProgC(clk, rst, StallPC, PC_in, PC_out);
    InstructionMem IM(PC_out, inst_F);
    adder A1(PC_out, 32'd4, NPC_F);

    //IF_ID
    S1 IF_ID(clk, BranchTrue, StallD, inst_F, NPC_F, inst_D, NPC_D);


    //ID Stage
    CONTROL_UNIT CU(inst_D[31:26], inst_D[5:0], RegWrite_D, MemToReg_D, MemWrite_D, MemRead_D, ALUfunc_D, ALUSrc_D, RegDst_D, BranchD);
    RegBank RB(clk, RegWrite_W, inst_D[25:21], inst_D[20:16], WriteReg_W, DataIn_Reg, A_D, B_D);
    mux32 M2(F_AD, A_D, ALUout_M, comp_A);
    mux32 M3(F_BD, B_D, ALUout_M, comp_B);
    comparator c1(comp_A, comp_B, equal_D);
    AND a1(BranchD, equal_D, BranchTrue);
    SignExtend SE(inst_D[15:0], SignIm_D);
    RShift2 R2(SignIm_D, Shift_D);
    adder A2(Shift_D, NPC_D, BranchPC_D);

    //ID_IE
    S2 ID_IE(clk, FlushE, RegWrite_D, MemToReg_D, MemWrite_D, MemRead_D, ALUSrc_D, RegDst_D, ALUfunc_D, inst_D[10:6], A_D, B_D, inst_D[25:21], inst_D[20:16], inst_D[15:11], SignIm_D,    RegWrite_E, MemToReg_E, MemWrite_E, MemRead_E, ALUSrc_E, RegDst_E, ALUfunc_E, shamt_E, A_E, B_E, Ra_E, Rb_E, Rd_E, SignIm_E);


    //IE Stage
    mux_3to1 M4(F_AE, A_E, DataIn_Reg, ALUout_M, alu_A);
    mux_3to1 M5(F_BE, B_E, DataIn_Reg, ALUout_M, WriteData_E);
    mux32 M6(ALUSrc_E, WriteData_E, SignIm_E, alu_B);
    alu ALU(alu_A, alu_B, ALUfunc_E, shamt_E, ALUout_E);
    mux5 M7(RegDst_E, Rb_E, Rd_E, WriteReg_E);

    //IE_IM
    S3 IE_IM(clk, RegWrite_E, MemToReg_E, MemWrite_E, MemRead_E, ALUout_E, WriteData_E, WriteReg_E,    RegWrite_M, MemToReg_M, MemWrite_M, MemRead_M, ALUout_M, WriteData_M, WriteReg_M);


    //IM Stage
    DataMem DM(clk, MemRead_M, MemWrite_M, ALUout_M, WriteData_M, MemData_M);

    //IM_WB
    S4 IM_WB(clk, RegWrite_M, MemToReg_M, MemData_M, ALUout_M, WriteReg_M,
           RegWrite_W, MemToReg_W, MemData_W, ALUout_W, WriteReg_W);


    //WB Stage
    mux32 M8(MemToReg_W, MemData_W, ALUout_W, DataIn_Reg);


    //Hazard Unit
    Hazard_Unit HU(inst_D[25:21], inst_D[20:16], Ra_E, Rb_E, RegWrite_E, RegWrite_M, RegWrite_W, WriteReg_E, WriteReg_M, WriteReg_W, MemToReg_E, MemToReg_M, BranchD, 
                    StallPC, StallD, FlushE, F_AE, F_BE, F_AD, F_BD);

    
endmodule