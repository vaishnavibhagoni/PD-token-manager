
# Anti-Starvation Scheduling

## 1. What Is Starvation?

Starvation occurs when a request waits for an excessively long time because other requests are repeatedly selected for service ahead of it.

In a priority-based system, normal requests may experience starvation if priority requests continuously arrive and always receive service first.

## 2. Why Is Anti-Starvation Important?

An anti-starvation mechanism aims to improve fairness by ensuring that normal requests are not indefinitely neglected.

Benefits include:

- Improved fairness between priority and normal requests.
- Better handling of competing requests.
- Reduced risk of normal requests waiting indefinitely.
- More balanced scheduling behavior.

## 3. Scheduling Concept

The system manages priority and normal token requests. The scheduler selects requests according to the implemented scheduling policy.

An anti-starvation policy may use techniques such as waiting-time tracking, priority adjustment, or controlled selection of normal requests. The exact technique depends on the RTL implementation.

## 4. Verification

The Verilog testbench exercises the token management system and reports the behavior of priority service, normal service, queue counts, and anti-starvation-related checks.

Simulation output should be reviewed alongside the testbench code to understand which conditions are actually tested.

## 5. Limitations

A passing simulation does not automatically prove that starvation is impossible for every possible input sequence. Stronger verification would require additional test scenarios and, where appropriate, formal verification.

## 6. Conclusion

Anti-starvation scheduling is an important fairness consideration in priority-based digital systems. This project explores the implementation and evaluation of such scheduling behavior using Verilog HDL, simulation, and physical-design tools.
