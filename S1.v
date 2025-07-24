`timescale 1ns/ 1ps

module S1(clk, clr, StallD, inst_F, NPC_F, inst_D, NPC_D);

    input clk, clr, StallD;
    input [31:0]inst_F, NPC_F;

    output reg [31:0]inst_D, NPC_D;


    always @(posedge clk)
    begin 
        if(clr) begin
            inst_D <= 32'b0;
            NPC_D <= 32'b0;
        end

        else if(!StallD) begin
            inst_D <= inst_F;
            NPC_D <= NPC_F;
        end
    
    end
endmodule