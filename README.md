# Priority-Based Digital Token Manager

### Priority-Based Digital Token Management with Anti-Starvation Scheduling 
 
## 1. Project Overview

This project implements a digital token management system using Verilog HDL. It manages normal and priority token requests through separate FIFO queues and a priority-based scheduler. An anti-starvation mechanism ensures that normal requests receive service after up to three consecutive priority services when both queues contain pending requests.

## 2. Project Documentation

| Documentation | Description |
|---|---|
| [About the Project](About_project/README.md) | Project introduction, problem statement, objectives, and proposed solution. |
| [System Architecture](Docs/architecture.md) | System architecture, module connections, and token-processing flow. |
| [Anti-Starvation Scheduling](Docs/anti-starvation.md) | Scheduling policy and prevention of starvation for normal requests. |
| [Documentation Index](Docs/README.md) | Index of project design documentation. |
| [RTL Documentation](RTL/README.md) | Overview of the Verilog modules and their responsibilities. |
| [Testbench Documentation](TB/README.md) | Testbench structure and functional verification scenarios. |
| [Simulation Guide](simulation/README.md) | Simulation workflow and instructions for viewing results. |
| [Physical Design Documentation](physical_design/README.md) | Overview of physical-design implementation and outputs. |
| [Area and Timing Summary](physical_design/reports/area_summary.md) | Design area, utilization, and timing results across implementation stages. |

## 3. RTL Design Modules

| Module | Description |
|---|---|
| [token_manager.v](RTL/token_manager.v) | Top-level module coordinating token generation, queues, scheduling, and service completion. |
| [token_generator.v](RTL/token_generator.v) | Generates token identifiers. |
| [priority_queue.v](RTL/priority_queue.v) | FIFO queue for priority requests. |
| [normal_queue.v](RTL/normal_queue.v) | FIFO queue for normal requests. |
| [priority_scheduler.v](RTL/priority_scheduler.v) | Selects which queue receives service according to the scheduling policy. |
| [RTL README](RTL/README.md) | Additional RTL implementation details. |

## 4. Testbench and Verification

The testbench verifies the token management system under different request and scheduling conditions.

- [Testbench Source Code](TB/token_manager_tb.v)
- [Testbench Documentation](TB/README.md)
- [Simulation Output Log](simulation/results/token_manager_simulation.log)

The final logic-equivalence report states that no difference was found between the compared netlists. Functional simulation results should be evaluated alongside the testbench scenarios.

## 5. Simulation Results

| File | Description |
|---|---|
| [Simulation Guide](simulation/README.md) | Instructions for running the simulation. |
| [Run Simulation Script](simulation/run_sim.sh) | Shell script used to execute the Verilog simulation. |
| [Simulation Log](simulation/results/token_manager_simulation.log) | Recorded simulation output and testbench messages. |
| [VCD Waveform](simulation/waves/token_manager.vcd) | Signal transitions captured during simulation. |
| [GTKWave Screenshot](simulation/waves/waveform.png) | Screenshot of the simulation waveform. |
| [Waveform Explanation](simulation/waves/waveformexplanation.md) | Explanation of key waveform signals and transitions. |

## 6. Tools and Technologies

- Verilog HDL
- OpenROAD-flow-scripts
- Sky130HD standard-cell platform
- KLayout
- GTKWave
- Git and GitHub

## 7. Physical Design

The design was processed through the OpenROAD physical-design flow using the Sky130HD platform.

### Reported Results

| Metric | Value |
|---|---:|
| Final design area | 8,423 µm² |
| Final utilization | 35% |
| Final total negative slack (TNS) | 0.00 ns |

### Physical Design Resources

- [Physical Design Documentation](physical_design/README.md)
- [Area and Timing Summary](physical_design/reports/area_summary.md)
- [Stage Reports and Logs](physical_design/reports/stages/)
- [Final GDS Layout](physical_design/layout/6_final.gds)

These values describe the current implementation flow and are not measurements from fabricated silicon or foundry sign-off results.

## Repository Structure

```text
PD-token-manager/
├── README.md
├── About_project/
│   └── README.md
├── Docs/
│   ├── README.md
│   ├── architecture.md
│   └── anti-starvation.md
├── RTL/
│   ├── README.md
│   ├── token_manager.v
│   ├── token_generator.v
│   ├── priority_queue.v
│   ├── normal_queue.v
│   └── priority_scheduler.v
├── TB/
│   ├── README.md
│   └── token_manager_tb.v
├── simulation/
│   ├── README.md
│   ├── run_sim.sh
│   ├── results/
│   │   └── token_manager_simulation.log
│   └── waves/
│       ├── token_manager.vcd
│       ├── waveform.png
│       ├── waveformexplanation.md
│       └── explanation.md
└── physical_design/
    ├── README.md
    ├── layout/
    │   └── 6_final.gds
    └── reports/
        ├── area_summary.md
        ├── 6_final_lec.log
        └── stages/
            ├── 2_floorplan_final.rpt
            ├── 3_global_place.rpt
            ├── 3_detailed_place.rpt
            ├── 3_resizer.rpt
            ├── 4_cts_final.rpt
            ├── 5_global_route.rpt
            ├── 6_finish.rpt
            ├── synth_stat.txt
            └── logs/
                ├── 2_1_floorplan.log
                ├── 2_3_floorplan_tapcell.log
                ├── 3_3_place_gp.log
                ├── 3_5_place_dp.log
                ├── 4_1_cts.log
                ├── 5_1_grt.log
                └── 5_2_route.log
```

## 9. Project Summary

The Priority-Based Digital Token Manager is a Verilog HDL project developed for VSDBabySoC. It implements a token management system using separate FIFO queues for priority and normal requests.

The system consists of a token generator, priority queue, normal queue, priority scheduler, and top-level token manager. An anti-starvation scheduling mechanism ensures that normal requests receive service after up to three consecutive priority services when both queues contain pending requests.

The project covers RTL design, functional simulation, waveform analysis, logic equivalence checking, and physical-design implementation using OpenROAD-flow-scripts with the Sky130HD standard-cell platform.

### Key Results

- **RTL Design:** Modular Verilog implementation.
- **Scheduling:** Priority-based service with anti-starvation logic.
- **Verification:** Testbench simulation and final logic-equivalence checking.
- **Physical Design:** Completed OpenROAD implementation flow.
- **Final Reported Design Area:** 8,423 µm².
- **Final Reported Utilization:** 35%.
- **Final Reported TNS:** 0.00 ns.
- **Layout Output:** GDSII file generated.

This project demonstrates the digital IC design flow from RTL development and simulation through physical-design implementation and report analysis. The reported results represent the current implementation flow and are not measurements from fabricated silicon.
                
