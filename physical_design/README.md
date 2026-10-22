# Physical Design — Token Manager

## Overview

This directory contains the physical design outputs for the **Priority-Based Digital Token Management with Anti-Starvation Scheduling** project.

The design was implemented using the **Sky130HD** platform with the OpenROAD physical design flow.

## Final Chip Layout

![Final Chip Layout](layout/chip_layout.png)

The final layout database is available as [`6_final.gds`](layout/6_final.gds).

## Physical Design Results

| Parameter | Result |
|---|---:|
| Technology | Sky130HD |
| Synthesis cell area | 7359.5584 µm² |
| Final reported design area | 8423 µm² |
| Reported utilization | 35% |
| Worst setup slack (WNS) | 13.16 ns |
| Total negative slack (TNS) | 0.00 ns |
| Setup/hold violations | 0 |
| Maximum slew violations | 0 |
| Maximum fanout violations | 0 |
| Maximum capacitance violations | 0 |

*Values are taken from the available project reports. Timing values are reported by the physical design flow.*

## Verification

The final logic equivalence check completed with:

`No difference was found.`

This indicates that the compared netlists were equivalent for the checks performed. It does not by itself establish foundry signoff.

## Directory Contents

- `layout/6_final.gds` — final GDSII layout database.
- `layout/chip_layout.png` — screenshot of the chip layout.
- `reports/6_finish.rpt` — final timing and physical design report.
- `reports/synth_stat.txt` — synthesis statistics.
- `reports/6_final_lec.log` — logic equivalence check log.

## Tools and Platform

- OpenROAD
- OpenROAD-flow-scripts
- Sky130HD standard-cell platform
- KLayout for layout viewing

## Viewing the Layout

Open the GDSII file with KLayout:

```bash
klayout layout/6_final.gds
```

