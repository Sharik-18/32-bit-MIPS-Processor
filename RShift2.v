module RShift2(D_in, D_out);

    input [31:0] D_in;
    output reg [31:0] D_out;

    always@(*)
        D_out <= D_in << 2;

endmodule