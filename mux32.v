`timescale 1ns/1ps

module mux32(select,inA,inB,mux_out);
    input select;
    input [31:0] inA, inB;
    output reg [31:0] mux_out;

    always@(*) begin
        if(select == 0)
            mux_out <= inA;

        else if(select == 1)
            mux_out <= inB;

        else
            mux_out <= inA;
    end

    // assign  mux_out = (select) ? inB : inA;

endmodule