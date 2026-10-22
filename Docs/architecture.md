
# System Architecture

## 1. Overview

The Priority-Based Digital Token Management system is designed using Verilog HDL. It manages incoming token requests through priority and normal request queues and uses scheduling logic to select requests for service.

## 2. Main Functional Blocks

### Request Inputs
Accepts incoming token requests and their associated priority information.

### Priority Queue
Stores or manages requests that require priority-based service.

### Normal Queue
Stores or manages ordinary requests waiting for service.

### Scheduling Logic
Selects a request for service according to the implemented scheduling policy.

### Anti-Starvation Mechanism
Aims to prevent normal requests from being continuously delayed when priority requests repeatedly arrive.

### Token Service and Status Outputs
Indicates the selected service and provides status information, such as queue counts, according to the RTL implementation.

## 3. Functional Flow

1. A token request arrives.
2. The request is classified according to its priority.
3. The request is managed by the appropriate queue.
4. The scheduling logic selects a request.
5. The selected request is served.
6. Queue and status information are updated.
7. The process continues for subsequent requests.

## 4. Design and Verification

The RTL is verified through a Verilog testbench. Simulation results help evaluate request handling and scheduling behavior. The design is then synthesized and processed through the physical-design flow.

## 5. Implementation Note

This document describes the intended functional architecture. Exact signal names, queue behavior, and scheduling conditions should be confirmed from the RTL source files in the `RTL/` directory.
