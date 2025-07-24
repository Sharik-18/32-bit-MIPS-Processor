module InstructionMem(address, inst_F);
    input [31:0]address;
    output [31:0]inst_F;

    parameter size=1024;
    reg [7:0]mem[size:0];

    assign inst_F = {mem[address], mem[address+1], mem[address+2], mem[address+3] } ;  

endmodule
