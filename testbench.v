`timescale 1ns/1ps
`include "DATAPATH.v"

module processor_tb;

    // Clock and reset signals
    reg clk;
    reg rst;

    // Instantiate the top-level processor module
    // Replace `processor` with your top module name
    DATAPATH uut (
        .clk(clk),
        .rst(rst)
    );

    // Clock generation: 10ns period (100 MHz)
    always #5 clk = ~clk;

    initial begin
        // Dump waveforms
        $dumpfile("processor_tb.vcd");
        $dumpvars(0, processor_tb);
        // $dumpvars(0, uut);

        // Initialize
        clk = 0;
        rst = 1;

        // Wait for 2 clock cycles
        #10;
        rst = 0;  // Deassert reset

        // Run simulation for 500 ns
        #500;

        $display("Simulation finished.");
        $finish;
    end

    // Optional monitoring
    // initial begin
    //     $monitor("Time=%0t | PC=%h | Instruction=%h | ALUResult=%h", 
    //               $time, uut.PC_out, uut.inst_F, uut.ALUout_E);
    // end

endmodule
