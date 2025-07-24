module mux32(select,inA,inB,mux_out);
    input wire select;
    input wire [31:0] inA, inB;
    output wire [31:0] mux_out;

    assign  mux_out = (select) ? inB : inA;

endmodule