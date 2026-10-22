# GTKWave Simulation Waveform Explanation

## 1. Overview

This document explains the simulation waveform of the **Priority-Based Digital Token Management System with Anti-Starvation Scheduling** implemented using Verilog HDL.

The waveform was captured using GTKWave and helps visualize the behavior of the token generator, queues, scheduler, and service-control signals over simulation time.

## 2. Signals in the Waveform

| Signal | Description |
|---|---|
| `clk` | Clock signal that synchronizes sequential operations. |
| `reset` | Initializes the design and scheduler state. |
| `current_token[7:0]` | Displays the 8-bit token currently selected for service. |
| `priority_active` | Indicates that the scheduler selects the priority queue when it is eligible. |
| `queue_count[4:0]` | Represents the combined number of tokens stored in both queues. |
| `serve_next` | Requests the scheduler to serve the next eligible token. |
| `service_complete` | Pulses high when a token is selected for service. |

## 3. Waveform Operation

### Reset Phase
The reset signal initializes the design. Once reset is deasserted, normal token-generation and scheduling operations begin.

### Token Generation and Queuing
The token generator produces token IDs. Requests are stored in either the normal queue or the priority queue according to their classification.

### Priority-Based Scheduling
When `serve_next` is asserted, the scheduler decides which queue supplies the next token. Priority requests are served preferentially when eligible.

### Token Service
When a token is selected for service, `current_token` updates and `service_complete` pulses high. The queue count changes as tokens enter or leave the queues.

## 4. Anti-Starvation Mechanism

When both queues contain tokens, the scheduler allows up to three consecutive priority services before selecting a normal token. After a normal token is selected, the priority-service counter resets.

This mechanism gives normal-priority requests an opportunity to be served even when priority requests are waiting.

If the normal queue is empty, priority requests can continue to be served without forcing a normal service.

## 5. How to View the Waveform

The waveform data is stored in `token_manager.vcd`.

To inspect it, open the VCD file using GTKWave:

```bash
gtkwave simulation/waves/token_manager.vcd
```

Run this command from the project root directory.

The screenshot `waveform.png` provides a visual reference for the signals listed above.

## 6. Conclusion

The GTKWave waveform provides a visual representation of the token manager's clock, reset, queue status, scheduler decisions, and service events. It supports analysis of the design's functional behavior and its intended anti-starvation mechanism.

**Note:** A waveform screenshot alone does not establish complete functional verification. Confirm the actual served-token sequence when both queues are nonempty to validate anti-starvation behavior.
