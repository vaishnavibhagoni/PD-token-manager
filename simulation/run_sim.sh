#!/bin/bash
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$ROOT/simulation/waves" "$ROOT/simulation/results"

iverilog -g2012 -o "$ROOT/simulation/token_manager_sim" \
    "$ROOT"/RTL/*.v "$ROOT/TB/token_manager_tb.v"

cd "$ROOT/simulation/waves"
vvp "$ROOT/simulation/token_manager_sim" \
    | tee "$ROOT/simulation/results/token_manager_simulation.log"

rm -f "$ROOT/simulation/token_manager_sim"
