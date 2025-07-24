`timescale 1ns /1ps

module S4(clk, RegWrite_M, MemToReg_M, MemData_M, ALUout_M, WriteReg_M,
           RegWrite_W, MemToReg_W, MemData_W, ALUout_W, WriteReg_W);

    input clk;
    input RegWrite_M, MemToReg_M;
    input [31:0] MemData_M, ALUout_M;
    input [4:0] WriteReg_M;
    
    output reg RegWrite_W, MemToReg_W;
    output reg [31:0] MemData_W, ALUout_W;
    output reg [4:0] WriteReg_W;

    always@(posedge clk) 
    begin 
        RegWrite_W <= RegWrite_M;
        MemToReg_W <= MemToReg_M;
        MemData_W  <= MemData_M ;
        ALUout_W   <= ALUout_M ;
        WriteReg_W <= WriteReg_M;

    end
endmodule