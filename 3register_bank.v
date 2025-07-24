`timescale 1ns/ 1ps

module RegBank(clk, write, Ra, Rb, Rd, Data, A, B);

    input clk, write;
    input [4:0] Ra, Rb, Rd;
    input [31:0] Data;
    output reg [31:0] A, B;

    reg [31:0]Registers[31:0];


    always@(posedge clk) begin

        if(write == 1 && Rd != 0)
            Registers[Rd] <= Data;
    end
    

    always@(negedge clk) begin
        
        if (Ra == 5'b0)
            A <= 32'b0;
        else
            A <= Registers[Ra];


        if (Rb == 5'b0)
            B <= 32'b0;
        else
            B <= Registers[Rb];
        
    end
endmodule