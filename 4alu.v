module alu(RA, RB, alufunc,shamt, aluout);

    input [31:0] RA, RB;                                //Data points
    input [5:0]alufunc;
    input [4:0]shamt;                      
    output reg [31:0] aluout;

    parameter ADD = 6'b100000,
              SUB = 6'b100010,
              AND = 6'b100100,
              OR  = 6'b100101,
              XOR = 6'b100110,
              NOR = 6'b100111,
              SLT = 6'b101010,
              SLL = 6'b000000,
              SRL = 6'b000011;
              //MUL = ;
              //DIV = ;
              

    always @(*) begin


        case (alufunc)

            SUB: aluout = RA + RB;          
            ADD: aluout = RA - RB;
            AND: aluout = RA & RA;        
            OR : aluout = RA | RA;         
            XOR: aluout = RA ^ RA;        
            NOR: aluout = ~(RA | RA);     
            SRL: aluout = RA >> shamt;    
            SLL: aluout = RA << shamt;
            SLT: aluout = (RA < RB) ? 32'd1 : 32'b0;

            default: aluout = 32'bz;
            
        endcase
    end
endmodule