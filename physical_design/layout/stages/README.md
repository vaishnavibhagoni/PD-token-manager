# Physical Design Stages and Results

## Overview

This directory documents the physical implementation of the **Priority-Based Digital Token Management System** using the OpenROAD physical-design flow and the SkyWater SKY130HD standard-cell library.

The available images document standard-cell placement, clock-tree synthesis (CTS), signal routing, routing congestion, critical-path timing analysis, and the final layout.

## 1. Floorplanning

Floorplanning establishes the initial physical organization of the design. It defines the core area, prepares the design for standard-cell placement, and establishes the physical infrastructure needed for later implementation stages.

The saved floorplan database is available in the OpenROAD flow results as `2_floorplan.odb`. This is an OpenROAD database file and cannot be opened directly in KLayout as a GDSII file.

### Floorplan Timing Report

The report `2_floorplan_final.rpt` contains the following results:

| Metric | Reported Result |
|---|---:|
| Total Negative Slack (TNS) | 0.00 ns |
| Worst Negative Slack (WNS) | 0.00 ns |
| Worst slack | 14.08 ns |
| Minimum clock period | 2.64 ns |
| Corresponding reported frequency | 378.46 MHz |
| Estimated total power | 0.586 mW |

These are floorplan-stage report values, not final sign-off results.

**Floorplan database:** `2_floorplan.odb`



## 2. Final Layout

[Open Final Layout Image](final_all.webp.png)

The final layout provides an overall view of the physical implementation, including the arrangement of standard cells and routed interconnections.

## 3. Standard-Cell Placement

[Open Final Placement Image](final_placement.webp.png)

The placement view shows the locations of standard cells after placement optimization. Placement considers the available core area, timing requirements, and routing resources.

## 4. Clock-Tree Synthesis (CTS)

[Open Final Clock Tree Image](final_clocks.webp.png)

Clock-tree synthesis constructs a clock distribution network to deliver the clock signal to sequential elements across the design.

### Clock-Tree Layout

[Open CTS Clock Tree Layout Image](cts_default_core_clock_layout.webp.png)

This view illustrates the physical arrangement of the clock-tree network within the design.

### Clock-Tree Structure

[Open CTS Clock Tree Structure Image](cts_default_core_clock.webp.png)

This view provides another representation of the clock-tree structure and its connections to clock sinks.

## 5. Final Signal Routing

[Open Final Routing Image](final_routing.webp.png)

The final routing view illustrates the physical interconnections between cells and nets using the available routing layers.

## 6. Routing Congestion Analysis

[Open Routing Congestion Image](final_congestion.webp.png)

The congestion view helps identify regions where routing demand may be high relative to available routing resources.

## 7. Critical-Path Timing Analysis

[Open Worst Timing Path Image](final_worst_path.webp.png)

The critical-path view illustrates a path examined during timing analysis. Numerical timing conclusions should be obtained from the associated timing reports rather than inferred from the image alone.

## 8. Final GDSII Layout

The final GDSII layout is saved as `physical_design/layout/6_final.gds`.

GDSII is a standard file format used to represent the physical geometry of an integrated-circuit layout, including shapes on different layout layers.

The file can be opened using KLayout to inspect the final physical layout.

[Open Final GDSII Layout File](../6_final.gds)

The GDSII file represents the physical layout output. Its existence alone does not establish that Layout Versus Schematic (LVS) verification or full foundry sign-off has passed.

## Verification Status

The available verification summary reports zero routing violations and a passing Logic Equivalence Check (LEC). Layout Versus Schematic (LVS) has not yet been confirmed as passing.

These images document the physical implementation stages but do not independently establish LVS completion or full foundry sign-off.

## Tools and Technology

- **Physical-design flow:** OpenROAD
- **Standard-cell library:** SkyWater SKY130HD
- **Layout inspection:** KLayout

## Conclusion


These resources document the major physical-design stages, from floorplanning and placement to clock distribution, routing, and timing analysis. The final GDSII layout and verification reports complement the images and provide a record of the implementation work completed so far.



