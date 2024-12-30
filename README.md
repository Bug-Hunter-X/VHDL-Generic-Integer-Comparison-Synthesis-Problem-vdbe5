# VHDL Generic Integer Comparison Synthesis Problem

This repository demonstrates a subtle bug in VHDL related to the comparison of integer generics within conditional statements during synthesis.  The issue arises when a generic integer value is directly compared to an integer literal; the synthesis tool may not optimize the comparison correctly, potentially leading to unexpected hardware implementation.

## Bug Description
The core problem lies in how certain synthesis tools handle the comparison of a generic integer to a literal value. In some cases, the tool may fail to optimize the comparison, resulting in unnecessary logic or incorrect behavior. This is often not immediately apparent during simulation.

## Bug Solution
To mitigate this issue, it's recommended to either:

1. **Use a constant:** Define a constant of the appropriate type and use that in the comparison.  This improves readability and gives the synthesis tool more context for optimization.
2. **Type casting:** Explicitly cast the generic to another type and compare to a value of that type (e.g., integer to std_logic_vector).

The provided solution demonstrates the use of a constant to rectify the issue.

## How to reproduce
1. Clone the repository.
2. Synthesize both `bug.vhd` and `bugSolution.vhd` using your preferred VHDL synthesis tool.
3. Compare the synthesized results. You should observe differences in the synthesized netlist, particularly in the logic related to the generic comparison.
