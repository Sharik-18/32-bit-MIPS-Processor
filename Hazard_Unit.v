`timescale 1ns/1ps

module Hazard_Unit(Ra_D, Rb_D, Ra_E, Rb_E, RegWrite_E, RegWrite_M, RegWrite_W, WriteReg_E, WriteReg_M, WriteReg_W, MemToReg_E, MemToReg_M, BranchD, 
                    StallPC, StallD, FlushE, F_AE, F_BE, F_AD, F_BD);

    input RegWrite_E, RegWrite_M, RegWrite_W, MemToReg_E, MemToReg_M, BranchD;
    input [4:0] Ra_D, Rb_D, Ra_E, Rb_E, WriteReg_E, WriteReg_M, WriteReg_W;

    output reg StallPC, StallD, FlushE, F_AD, F_BD;
    output reg [1:0] F_AE, F_BE;

    reg lwstall, branchstall;

    initial begin

        StallPC = 0;
        StallD = 0;
        FlushE = 0;
        F_AE = 2'b0;
        F_BE = 2'b0;
        F_AD = 0;
        F_BD = 0;
    end
    

    always@(*) begin

        lwstall = MemToReg_E && ((Ra_D == Rb_E) || (Rb_D == Rb_E));

        branchstall = BranchD && (RegWrite_E && ((WriteReg_E == Ra_D) || (WriteReg_E == Rb_D)) ||
                                  MemToReg_M && ((WriteReg_M == Ra_D) || (WriteReg_M == Rb_D)) );

        StallPC = lwstall || branchstall;
        StallD  = lwstall || branchstall;
        FlushE  = lwstall || branchstall;

    end

    always@(*) begin


        if(RegWrite_M && (WriteReg_M != 0) && (WriteReg_M == Ra_E))
            F_AE = 2'b10;

        else if (RegWrite_W && (WriteReg_W != 0) && (WriteReg_W == Ra_E))
            F_AE = 2'b01;
        
        else
            F_AE = 2'b00;



        if(RegWrite_M && (WriteReg_M != 0) && (WriteReg_M == Rb_E))
            F_BE = 2'b10;

        else if (RegWrite_W && (WriteReg_W != 0) && (WriteReg_W == Rb_E))
            F_BE = 2'b01;

        else
            F_BE = 2'b00;

    end

    always@(*) begin

        F_AD = (WriteReg_M != 0) && (Ra_D == WriteReg_M) && RegWrite_M;
        F_BD = (WriteReg_M != 0) && (Rb_D == WriteReg_M) && RegWrite_M;

    end
endmodule
