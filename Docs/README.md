# Project Documentation

This folder contains the technical documentation for the Priority-Based Digital Token Management with Anti-Starvation Scheduling project.

## Documentation Files

| File | Description |
|---|---|
| [architecture.md](architecture.md) | Explains the system architecture, modules, and request flow. |
| [anti_starvation.md](anti_starvation.md) | Explains starvation, fairness, and the anti-starvation scheduling concept. |

## Project Overview

The system uses Verilog HDL to manage priority and normal token requests. The scheduling logic determines which request is served, while the design aims to balance priority-based service with fairness.

## Design and Verification Flow

1. RTL design using Verilog HDL.
2. Functional verification using a testbench.
3. Simulation and waveform analysis.
4. Logic synthesis.
5. Physical design using the OpenROAD flow.
6. Timing analysis and layout generation.

## Important Note

Simulation and physical-design results demonstrate the behavior and implementation flow evaluated in this project. They do not independently establish silicon validation or foundry sign-off.
