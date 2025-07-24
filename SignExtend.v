module SignExtend(ImmIn,ImmOut);
    input [15:0]ImmIn;
    output [31:0]ImmOut;

    assign ImmOut={{16{ImmIn[15]}},ImmIn};

endmodule