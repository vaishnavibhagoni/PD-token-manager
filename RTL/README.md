
# RTL Design

## Overview

This folder contains the Verilog HDL source files for the Priority-Based Digital Token Management with Anti-Starvation Scheduling project.


## RTL Source Files

| File Name | Description |
|---|---|
| [`normal_queue.v`](normal_queue.v) | Manages normal token requests waiting for service. |
| [`priority_queue.v`](priority_queue.v) | Manages high-priority token requests. |
| [`priority_scheduler.v`](priority_scheduler.v) | Selects requests for service according to the scheduling policy. |
| [`token_generator.v`](token_generator.v) | Generates tokens according to the implemented design logic. |
| [`token_manager.v`](token_manager.v) | Integrates the main token management functions and coordinates the system. |


## Design Objectives

- Handle priority and normal token requests.
- Organize requests using separate queues.
- Schedule requests for service.
- Support fair request handling and anti-starvation behavior.
- Provide RTL for simulation, synthesis, and physical design.

## Verification

The RTL is verified using the testbench in the [`TB/`](../TB/) directory. Simulation scripts, logs, and waveforms are available in [`simulation/`](../simulation/).

## Physical Design

The RTL is used in the synthesis and physical-design flow documented in [`physical_design/`](../physical_design/).

**Note:** The descriptions above summarize the intended roles of the files. Refer to the Verilog source code for their exact implementation.
