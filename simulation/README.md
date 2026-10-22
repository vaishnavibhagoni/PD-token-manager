

# Simulation

## Overview

This folder contains the scripts, results, and waveform files used to simulate and verify the Priority-Based Digital Token Management with Anti-Starvation Scheduling project.

## Simulation Files

| File Name | Description |
|---|---|
| [`run_sim.sh`](simulation/run_sim.sh) | Shell script used to run the Verilog simulation. |
| [`results/token_manager_simulation.log`](simulation/results/token_manager_simulation.log) | Contains simulation output and test results. |
| [`waves/token_manager.vcd`](simulation/waves/token_manager.vcd) | Value Change Dump (VCD) file used to inspect signal changes over simulation time. |
| [`waves/waveform.png`](simulation/waves/waveform.png) | Screenshot of the GTKWave waveform showing signal transitions during simulation. |
## Simulation Workflow

1. Compile the RTL and testbench.
2. Run the simulation using the provided script.
3. Review the simulation log.
4. Open the VCD waveform to examine signal transitions.

## Verification Focus

- Priority request servicing.
- Normal request servicing.
- Queue count behavior.
- Anti-starvation-related test scenarios.

## Tools

The simulation uses Verilog simulation tools and a shell script to automate execution. The exact commands are defined in `run_sim.sh`.

## Important Note

Simulation results validate only the scenarios exercised by the testbench. Review the testbench and log together when evaluating the results.
