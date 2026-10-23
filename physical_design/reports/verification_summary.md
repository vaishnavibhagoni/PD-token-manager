# Physical Design Verification Summary

**Design:** Priority-Based Digital Token Management System  
**Platform:** Sky130HD  
**Tool:** OpenROAD

## 1. Timing Analysis

Source: `physical_design/reports/6_finish.rpt`

| Metric | Reported value |
|---|---:|
| Total Negative Slack (TNS max) | 0.00 ns |
| Worst Negative Slack (WNS max) | 0.00 ns |
| Worst slack max | 13.16 ns |
| Minimum core-clock period | 3.01 ns |
| Maximum reported frequency | 332.32 MHz |

TNS and WNS are reported as zero in the final timing report. The reported worst slack of 13.16 ns is a separate metric and must not be labelled WNS.

## 2. Design Rule Check (DRC)

**Result:** 0 routing violations reported at 100% completion.

Evidence: OpenROAD log `5_2_route.log`.

The routing log also reports zero antenna violations, net violations, and pin violations. This is not a claim of complete foundry sign-off.

## 3. Logic Equivalence Check (LEC)

**Result:** PASS — no difference was found.

Evidence: `6_final_lec.log`.

This verifies logic equivalence between the compared netlists. It is not a Layout Versus Schematic (LVS) check.

## 4. Layout Versus Schematic (LVS)

**Status:** Not yet run or verified.

A separate LVS comparison and passing report have not been confirmed. No LVS pass is claimed.

## 5. Scope

This summary records the available OpenROAD results. It does not claim complete foundry sign-off or fabricated-silicon validation.
