
## Physical Design Results

The design was implemented using the OpenROAD physical-design flow with the SkyWater SKY130HD standard-cell library. The following views illustrate the major stages and results of the implementation.

### 1. Final Layout
![Final Layout](final_all.webp.png)

This view provides an overall visualization of the completed physical design, including the placed cells, clock network, and routing.

### 2. Floorplan and Placement
![Final Placement](final_placement.webp.png)

This view shows the locations of standard cells after placement optimization. Placement aims to organize the cells efficiently while considering timing and routing requirements.

### 3. Clock Tree Synthesis (CTS)
![Clock Tree](final_clocks.webp.png)

This view illustrates the clock distribution network generated during CTS to deliver the clock signal to sequential elements with controlled timing differences.

![CTS Clock Tree Layout](cts_default_core_clock_layout.webp.png)

This layout view highlights the physical arrangement of the clock-tree network within the design.

![CTS Clock Tree View](cts_default_core_clock.webp.png)

This view focuses on the clock-tree structure and its connections to the design's clock sinks.

### 4. Final Routing
![Final Routing](final_routing.webp.png)

This view shows the completed signal-routing stage, where interconnects are laid out to connect the design's cells and nets.

### 5. Routing Congestion
![Routing Congestion](final_congestion.webp.png)

This view visualizes routing congestion, helping identify areas where routing resources are heavily utilized.

### 6. Worst Timing Path
![Worst Timing Path](final_worst_path.webp.png)

This view highlights a critical timing path analyzed by the implementation flow. Timing analysis helps evaluate whether signal propagation meets the design's timing constraints.
