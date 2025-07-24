`timescale 1ns/1ps

module DataMem(clk, read, write, address, write_data, read_data);
    input clk;
    input read, write;
    input [31:0]address;
    input [31:0]write_data;
    output reg [31:0]read_data;

    reg [31:0]mem_array[255:0];

    always @(posedge clk) begin
        if (read)
            read_data <= mem_array[address];
        if (write)
            mem_array[address] <= write_data;

    end 
endmodule