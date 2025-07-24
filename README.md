# 32-bit 5-Stage Pipelined MIPS Processor 

This project implements a **32-bit MIPS-based 5-stage pipelined RISC processor** using Verilog HDL, simulating key features of the MIPS ISA. It supports fundamental arithmetic, logical, memory, and branching instructions with effective pipelining, hazard handling, and register-memory integration.

The image below shows the datapath design of the pipelined processor.
<div align="center">
<img width="888" height="550" alt="MIPS Architecture" src="https://github.com/user-attachments/assets/c63a3e48-8658-4218-849a-44c1bc44ab09" />
</div>

## Architecture Overview

The processor follows the classic **5-stage pipeline** model:

1. **IF (Instruction Fetch)** – Fetches instructions from instruction memory.
2. **ID (Instruction Decode/Register Fetch)** – Decodes instruction, reads registers.
3. **EX (Execute)** – Performs ALU operations or address calculation.
4. **MEM (Memory Access)** – Accesses data memory for load/store.
5. **WB (Write Back)** – Writes results to registers.

## Important Modules:

### <ins>Control Unit</ins>
It interprets the opcode (and function field, in the case of R-type instructions) from the fetched instruction and generates the required control signals to guide instruction execution across all pipeline stages.

This unit determines the instruction type (R-type, I-type, or J-type) and accordingly activates or deactivates specific operations such as register writes, memory access, ALU operations, and branching.

The generated control signals are latched and passed through pipeline registers to preserve instruction semantics across stages.

The unit works in coordination with the Hazard Detection and Forwarding Units to handle data/control hazards by stalling, flushing, or bypassing stages when required.

</br>

### <ins>Hazard Detection Unit</ins>
In a pipelined MIPS processor, multiple instructions are executed in overlapping stages. This overlap may lead to hazards where an instruction depends on the result of a previous instruction that hasn't completed its execution yet. The Hazard Detection Unit ensures that such conflicts are managed without corrupting the processor state.

 Key Functions:
- Data Hazard Detection: Primarily identifies read-after-write (RAW) hazards, especially in load-use scenarios. For example, if an instruction in the decode stage is trying to read a register that is being written by a previous lw instruction in the execution or memory stage.

- Stalling Mechanism: Inserts bubbles (NOPs) into the pipeline by disabling write operations to the PC and IF/ID registers, effectively freezing instruction fetch and decode stages until the hazard is resolved.

- Control Signal Override: Works with the control unit to flush or override control signals in situations where hazards could cause incorrect behavior.
