module adder(in_a,in_b,sum);
    input [31:0] in_a,in_b;
    output [31:0] sum;

    assign sum = in_a + in_b ;


endmodule