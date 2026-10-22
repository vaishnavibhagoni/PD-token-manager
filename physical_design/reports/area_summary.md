# Physical Design Area and Timing Summary

## 1. Overview

This document records area and timing results from the OpenROAD physical-design flow using the Sky130HD platform for the Priority-Based Digital Token Management System.

The original reports are preserved in the `stages/` directory.

## 2. Design Area Progression

Area values below are taken from the OpenROAD stage logs.

| Stage | Design Area (µm²) | Utilization |
|---|---:|---:|
| Initial floorplan | 7,360 | 31% |
| Floorplan tap-cell insertion | 7,759 | 33% |
| Global placement | 7,759 | 33% |
| Detailed placement | 7,825 | 33% |
| Clock-tree synthesis | 8,423 | 35% |
| Global routing | 8,423 | 35% |
| Detailed routing | 8,423 | 35% |

Area and utilization values are rounded as displayed in the stage logs. The final reported area is 8,423 µm² at 35% utilization.

## 3. Timing Results

Worst-slack and total-negative-slack values below are taken from the corresponding stage timing reports.

| Stage | Worst Slack (ns) | TNS (ns) |
|---|---:|---:|
| Floorplan | 14.08 | 0.00 |
| Global placement | 13.15 | 0.00 |
| Detailed placement | 13.00 | 0.00 |
| Resizer | 13.15 | 0.00 |
| Clock-tree synthesis | 13.16 | 0.00 |
| Global routing | 12.97 | 0.00 |
| Final timing report | 13.16 | 0.00 |

The reports show positive worst slack and zero total negative slack at the listed stages. Timing results depend on the constraints and analysis settings used in the flow.

## 4. Source Reports

- [Floorplan timing report](stages/2_floorplan_final.rpt)
- [Global placement report](stages/3_global_place.rpt)
- [Detailed placement report](stages/3_detailed_place.rpt)
- [Resizer report](stages/3_resizer.rpt)
- [Clock-tree synthesis report](stages/4_cts_final.rpt)
- [Global routing report](stages/5_global_route.rpt)
- [Final timing report](stages/6_finish.rpt)
- [Synthesis statistics](stages/synth_stat.txt)

## 5. Notes

These are results from the current OpenROAD implementation. They document physical-design flow outputs and do not constitute foundry sign-off or silicon measurement.
