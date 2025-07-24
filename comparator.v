module comparator(in1, in2, equal);

    input [31:0] in1, in2;
    output equal;

    assign equal = (in1 == in2);

endmodule