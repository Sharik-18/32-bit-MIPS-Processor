module CONTROL_UNIT(opcode, func, RegWriteD,MemToRegD,MemWriteD,MemReadD,ALUfuncD,ALUSrcD,RegDstD,BranchD);

    input [5:0]opcode, func;
    output reg [5:0]ALUfuncD;
    output reg RegWriteD,MemToRegD,MemWriteD,MemReadD,ALUSrcD,RegDstD,BranchD;


    always@(*) begin

        //R type
        case (opcode)
            6'b0: begin 
                ALUfuncD  = func;
                RegWriteD = 1'b1;
                MemToRegD = 1'b0;
                MemWriteD = 1'b0;
                MemReadD  = 1'b0;
                ALUSrcD   = 1'b0;
                RegDstD   = 1'b1;
                BranchD   = 1'b0;
            end 


        //I type
            6'b001000: begin              //addi 
                ALUfuncD  = 6'b100000;
                RegWriteD = 1'b1;
                MemToRegD = 1'b0;
                MemWriteD = 1'b0;
                MemReadD  = 1'b0;
                ALUSrcD   = 1'b1;
                RegDstD   = 1'b0;
                BranchD   = 1'b0;
            end 

            6'b001100: begin              //andi 
                ALUfuncD  = 6'b100100;
                RegWriteD = 1'b1;
                MemToRegD = 1'b0;
                MemWriteD = 1'b0;
                MemReadD  = 1'b0;
                ALUSrcD   = 1'b1;
                RegDstD   = 1'b0;
                BranchD   = 1'b0;
            end 

            6'b001101: begin              //ori 
                ALUfuncD  = 6'b100101;
                RegWriteD = 1'b1;
                MemToRegD = 1'b0;
                MemWriteD = 1'b0;
                MemReadD  = 1'b0;
                ALUSrcD   = 1'b1;
                RegDstD   = 1'b0;
                BranchD   = 1'b0;
            end 

            6'b001110: begin              //xori 
                ALUfuncD  = 6'b100110;
                RegWriteD = 1'b1;
                MemToRegD = 1'b0;
                MemWriteD = 1'b0;
                MemReadD  = 1'b0;
                ALUSrcD   = 1'b1;
                RegDstD   = 1'b0;
                BranchD   = 1'b0;
            end 

            6'b001010: begin              //slti 
                ALUfuncD  = 6'b101010;
                RegWriteD = 1'b1;
                MemToRegD = 1'b0;
                MemWriteD = 1'b0;
                MemReadD  = 1'b0;
                ALUSrcD   = 1'b1;
                RegDstD   = 1'b0;
                BranchD   = 1'b0;
            end 

            6'b100011: begin              //lw
                ALUfuncD  = 6'b100000;
                RegWriteD = 1'b1;
                MemToRegD = 1'b1;
                MemWriteD = 1'b0;
                MemReadD  = 1'b1;
                ALUSrcD   = 1'b1;
                RegDstD   = 1'b0;
                BranchD   = 1'b0;
            end 

            6'b101011: begin              //sw
                ALUfuncD  = 6'b100000;
                RegWriteD = 1'b0;
                MemToRegD = 1'b0;
                MemWriteD = 1'b1;
                MemReadD  = 1'b0;
                ALUSrcD   = 1'b1;
                RegDstD   = 1'b0;
                BranchD   = 1'b0;
            end 

            6'b000100: begin              //bnq     not sure about bottom three
                ALUfuncD  = 6'bz;
                RegWriteD = 1'b0;
                MemToRegD = 1'b0;
                MemWriteD = 1'b0;
                MemReadD  = 1'b0;
                ALUSrcD   = 1'b0;
                RegDstD   = 1'b0;
                BranchD   = 1'b1;
            end 

            // 6'b000101: begin              //bneq
            //     ALUfuncD  = 6'b;
            //     RegWriteD = 1'b;
            //     MemToRegD = 1'b;
            //     MemWriteD = 1'b;
            //     MemReadD  = 1'b;
            //     ALUSrcD   = 1'b;
            //     RegDstD   = 1'b;
            //     BranchD   = 1'b;
            // end 


            // 6'b111111: begin              //NOOP
            //     ALUfuncD  = 6'b111111;
            //     RegWriteD = 1'b0;
            //     MemToRegD = 1'b0;
            //     MemWriteD = 1'b0;
            //     MemReadD  = 1'b0;
            //     ALUSrcD   = 1'b0;
            //     RegDstD   = 1'b0;
            //     BranchD   = 1'b0;
            // end 


        endcase
    end
endmodule
