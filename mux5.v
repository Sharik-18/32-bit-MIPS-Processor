module mux5(select,inA,inB,mux_out);
    input wire select;
    input wire [4:0] inA, inB;
    output wire [4:0] mux_out;

    assign  mux_out = (select) ? inB : inA;

endmodule