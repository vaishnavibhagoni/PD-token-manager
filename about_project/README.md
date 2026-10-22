
# Priority-Based Digital Token Management with Anti-Starvation Scheduling

## 1. Project Overview

This project implements a digital token management system using Verilog HDL. It uses priority and normal queues to manage token requests and determine the order in which tokens are served.

The project covers RTL design, functional simulation, synthesis, and physical design.

## 2. Problem Statement

When multiple requests compete for service, a scheduling mechanism is needed to decide which request should be served first. Priority scheduling helps important requests receive service earlier. However, continuously serving priority requests may cause normal requests to wait for an excessively long time.

The goal of this project is to support priority-based service while considering fairness for normal requests.

## 3. Importance of Priority Scheduling

- Allows important requests to be served before ordinary requests.
- Organizes requests according to priority.
- Helps manage competing requests in a digital system.
- Provides a defined policy for selecting requests.

## 4. Importance of Anti-Starvation

Starvation occurs when a request waits for too long because other requests are repeatedly served ahead of it.

An anti-starvation mechanism aims to improve fairness and prevent normal requests from being indefinitely neglected. Its effectiveness depends on the scheduling logic and the scenarios tested.

## 5. Project Objectives

1. Design the system using Verilog HDL.
2. Manage priority and normal requests using queues.
3. Implement the scheduling logic.
4. Verify behavior through simulation.
5. Examine synthesis, timing, and physical-design results.
6. Generate and inspect the GDSII layout.

## 6. Project Scope

This project covers RTL design, simulation, synthesis, and physical design using the available EDA tools. The results do not, by themselves, establish foundry sign-off or silicon validation.
