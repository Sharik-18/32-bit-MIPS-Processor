`timescale 1ns/ 1ps

module S3(clk,
          RegWrite_E, MemToReg_E, MemWrite_E, MemRead_E, ALUout_E, WriteData_E, WriteReg_E, 
          RegWrite_M, MemToReg_M, MemWrite_M, MemRead_M, ALUout_M, WriteData_M, WriteReg_M);

    input clk;
    input RegWrite_E, MemToReg_E, MemWrite_E, MemRead_E;
    input [31:0] ALUout_E, WriteData_E;
    input [4:0] WriteReg_E;

    output reg RegWrite_M, MemToReg_M, MemWrite_M, MemRead_M;
    output reg [31:0] ALUout_M, WriteData_M;
    output reg [4:0] WriteReg_M;

    always@(posedge clk) begin

        // if(clr) begin
        // end

        RegWrite_M <= RegWrite_E;
        MemToReg_M <= MemToReg_E;
        MemWrite_M <= MemWrite_E;
        MemRead_M  <= MemRead_M;
        ALUout_M   <= ALUout_E;
        WriteData_M<= WriteData_E;
        WriteReg_M <= WriteReg_E;

    end
endmodule