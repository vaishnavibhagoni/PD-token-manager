
# Testbench (TB)

## Overview

This folder contains the Verilog testbench used to verify the Priority-Based Digital Token Management with Anti-Starvation Scheduling project.

## Testbench Files

| File Name | Description |
|---|---|
| [`token_manager_tb.v`](token_manager_tb.v) | Applies test inputs to the token manager and checks the system's scheduling and token service behavior. |

## Verification Objectives

- Verify priority request servicing.
- Verify normal request servicing.
- Observe queue count updates.
- Exercise anti-starvation-related scenarios.
- Display simulation results for the tested cases.

## Running the Simulation

Simulation scripts are available in the [`simulation/`](../simulation/) directory. Refer to the instructions in that folder for running the testbench.

## Important Note

Simulation results depend on the test cases implemented in the testbench. A passing test does not prove correctness for every possible input sequence.
