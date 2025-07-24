`timescale 1ns/ 1ps

module S2(clk, clr, 
            RegWrite_D, MemToReg_D, MemWrite_D, MemRead_D, ALUSrc_D, RegDst_D, ALUfunc_D, shamt_D, regA_D, regB_D, Ra_D, Rb_D, Rd_D, SignIm_D, 
            RegWrite_E, MemToReg_E, MemWrite_E, MemRead_E, ALUSrc_E, RegDst_E, ALUfunc_E, shamt_E, regA_E, regB_E, Ra_E, Rb_E, Rd_E, SignIm_E);

    input clk, clr;
    input RegWrite_D, MemToReg_D, MemWrite_D, MemRead_D, ALUSrc_D, RegDst_D;
    input [5:0] ALUfunc_D;
    input [4:0] Ra_D, Rb_D, Rd_D, shamt_D;
    input [31:0] regA_D, regB_D, SignIm_D;


    output reg RegWrite_E, MemToReg_E, MemWrite_E, MemRead_E, ALUSrc_E, RegDst_E;
    output reg [5:0] ALUfunc_E;
    output reg [4:0] Ra_E, Rb_E, Rd_E, shamt_E;
    output reg [31:0] regA_E, regB_E, SignIm_E;


    always@(posedge clk) begin

        if(clr) begin
            RegWrite_E <= 1'b0;
            MemToReg_E <= 1'b0;
            MemWrite_E <= 1'b0;
            MemRead_E  <= 1'b0;
            ALUSrc_E   <= 1'b0;
            RegDst_E   <= 1'b0;
            ALUfunc_E  <= 6'b0;
            Ra_E       <= 32'b0;
            Rb_E       <= 32'b0;
            Rd_E       <= 32'b0;
            shamt_E    <= 5'b0;
        end

        
        else begin
            RegWrite_E <= RegWrite_D;
            MemToReg_E <= MemToReg_D;
            MemWrite_E <= MemWrite_D;
            MemRead_E  <= MemRead_D; 
            ALUSrc_E   <= ALUSrc_D;  
            RegDst_E   <= RegDst_D;  
            ALUfunc_E  <= ALUfunc_D; 
            Ra_E       <= Ra_D;      
            Rb_E       <= Rb_D;      
            Rd_E       <= Rd_D;      
            shamt_E    <= shamt_D;  
        end
    end
endmodule