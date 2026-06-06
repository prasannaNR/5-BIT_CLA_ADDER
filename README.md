# 5-Bit Carry Look-Ahead (CLA) Adder

Course Project for EC6.201 VLSI Design

## Project Overview

This project implements a 5-bit Carry Look-Ahead (CLA) Adder and includes the complete design flow:

- Verilog design and verification
- SPICE simulations
- Magic VLSI layout design
- Static Timing Analysis (STA)

## Repository Structure

### Images/

Contains documentation and design snapshots.

| Folder | Description |
|----------|------------|
| Stick_Diagrams | Stick diagrams of gates used in the layout |
| Magic_Layout | Final Magic layout screenshots of individual gates |
| SPICE | Stage-wise simulation results |
| STA | Data used for static timing analysis |
| Overview | Logic diagram and floor plan |

### Magic/

Contains:

- `.mag` layout files
- Technology and support files required for Magic VLSI

### SPICE/

Contains:

- Pre-layout SPICE netlists
- Post-layout extracted SPICE netlists

### Verilog/

Contains:

- Synthesizable Verilog source code
- Generated `.vcd` waveform files

## Tools Used

- Magic VLSI
- ngspice
- Verilog HDL
- GTKWave
