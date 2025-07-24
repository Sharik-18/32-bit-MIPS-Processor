`timescale 1ns/ 1ps

module PC(clk, rst, StallPC, count_in, count_out);

    input clk, rst, StallPC;
    input [31:0]count_in;
    output reg [31:0] count_out;

    always@(posedge clk) begin

        if(rst == 1)
            count_out <= 32'b0;
                
        else if(StallPC != 0)
            count_out <= count_in;

    end
endmodule