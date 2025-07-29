//decoder ki as such jarurat hai nai...IF_ID wale latch se directly break karke de sakta repectively.

module decoder(inst, opcode, ra, rb, rd,shamt, imm_i, imm_j, func);
    input [31:0] inst;
    output [4:0] ra, rb, rd, shamt;
    output [15:0] imm_i;
    output [25:0] imm_j;
    output reg [3:0] alufunc; 


    assign opcode = inst[31:26]
    assign ra = inst[25:21];
    assign rb = inst[20:16];
    assign rd = inst[15:10];
    assign shamt = inst[10:6];
    assign imm_i = inst[15:0];
    assign imm_j = inst[25:21];
    assign func = inst[5:0];

endmodule