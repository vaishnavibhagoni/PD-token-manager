# Physical Design Stages and Results

## Overview

This directory documents the physical implementation of the **Priority-Based Digital Token Management System** using the OpenROAD physical-design flow and the SkyWater SKY130HD standard-cell library.

The images illustrate the final layout, standard-cell placement, clock-tree synthesis (CTS), signal routing, routing congestion, and critical-path timing analysis.

## 1. Final Layout

![Final Layout](final_all.webp.png)

The final layout provides an overall view of the physical implementation, including the arrangement of standard cells and routed interconnections.

## 2. Standard-Cell Placement

![Final Placement](final_placement.webp.png)

The placement view shows the locations of standard cells after placement optimization. Placement considers the available core area, timing requirements, and routing resources.

## 3. Clock-Tree Synthesis (CTS)

![Clock Tree](final_clocks.webp.png)

Clock-tree synthesis constructs a clock distribution network to deliver the clock signal to sequential elements across the design.

### Clock-Tree Layout

![CTS Clock Tree Layout](cts_default_core_clock_layout.webp.png)

This view illustrates the physical arrangement of the clock-tree network within the design.

### Clock-Tree Structure

![CTS Clock Tree View](cts_default_core_clock.webp.png)

This view provides another representation of the clock-tree structure and its connections to clock sinks.

## 4. Final Signal Routing

![Final Routing](final_routing.webp.png)

The final routing view illustrates the physical interconnections between cells and nets using the available routing layers.

## 5. Routing Congestion Analysis

![Routing Congestion](final_congestion.webp.png)

The congestion view helps identify regions where routing demand may be high relative to available routing resources.

## 6. Critical-Path Timing Analysis

![Worst Timing Path](final_worst_path.webp.png)

The critical-path view illustrates a path examined during timing analysis. Numerical timing conclusions should be obtained from the associated timing reports rather than inferred from the image alone.

## Verification Status

The available verification summary reports zero routing violations and a passing Logic Equivalence Check (LEC). Layout Versus Schematic (LVS) has not yet been confirmed as passing.

These images document the physical implementation stages but do not independently establish LVS completion or full foundry sign-off.

## Tools and Technology

- **Physical-design flow:** OpenROAD
- **Standard-cell library:** SkyWater SKY130HD
- **Layout inspection:** KLayout

## Conclusion

These views provide a visual record of the major physical-design stages, from placement and clock distribution to routing and timing analysis. They complement the project's verification reports and document the implementation work completed so far.
