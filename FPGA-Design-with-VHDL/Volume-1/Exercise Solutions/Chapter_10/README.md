# Chapter 10. Introduction to Processes

[← Back to the Solutions index](../README.md)

**Code files for this chapter** (compiled and simulated; add them to a Vivado project like the book examples):

| Exercise | Files |
| --- | --- |
| 10.4 | [module_1.vhd](Exercise_10_04/module_1.vhd) |

## Exercise 1 - The missing signal

**`b_s` is missing** from the sensitivity list. The process reads both `a_s` and `b_s`, but it wakes up only when `a_s` changes.

In simulation, if `b_s` changes while `a_s` stays the same, the process does not run, so `y_s` keeps its old value and is wrong. For example, with `a_s = '1'`, changing `b_s` from '0' to '1' should make `y_s = '1'`, but `y_s` stays '0' until `a_s` changes again. However, the synthesis tool can still recognize the intended AND logic and build the correct hardware. This creates a **simulation-to-hardware mismatch**: the FPGA responds to changes in both inputs, but the simulation does not.

## Exercise 2 - PROCESS(ALL)

```vhdl
-- Requires VHDL-2008
PROCESS(ALL)
BEGIN
    y_s <= a_s AND b_s;
END PROCESS;
```

With `PROCESS(ALL)`, the tool automatically puts every signal that the process reads into the sensitivity list. You cannot forget a signal, and the list stays correct when you edit the process later. This makes it safer for combinational logic. Remember to set the file type to VHDL 2008 in Vivado.

## Exercise 3 - Rearranging the blocks

**No, the behavior does not change.** A process is itself one concurrent statement, just like the two signal assignments. All three blocks describe hardware that works in parallel (an AND gate, an OR gate and an XOR gate). Each one reacts only when its own input signals change, not according to its position in the architecture. Only the statements *inside* a process are evaluated in order.

## Exercise 4 - Concurrent assignment rewritten as a process

The module below keeps both versions side by side, so they can be compared in one simulation. As in Example 10.2, the inputs are internal signals and a simulation-only process changes them.

```vhdl
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- Entity declaration
ENTITY MODULE_1 IS
  -- No input or output ports are needed in this example.
  -- Internal signals will be used for simulation.
END ENTITY MODULE_1;
-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signals
  SIGNAL a_i           : STD_LOGIC;
  SIGNAL b_i           : STD_LOGIC;
  SIGNAL c_i           : STD_LOGIC;
  SIGNAL result_o      : STD_LOGIC;  -- concurrent version
  SIGNAL result_proc_o : STD_LOGIC;  -- process version
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION
  -- This process only changes a_i, b_i and c_i during simulation.
  p_stimulus : PROCESS
  BEGIN
    a_i <= '0'; b_i <= '0'; c_i <= '0';   -- 000
    WAIT FOR 10 ns;
    c_i <= '1';                           -- 001
    WAIT FOR 10 ns;
    b_i <= '1'; c_i <= '0';               -- 010
    WAIT FOR 10 ns;
    c_i <= '1';                           -- 011
    WAIT FOR 10 ns;
    a_i <= '1'; b_i <= '0'; c_i <= '0';   -- 100
    WAIT FOR 10 ns;
    c_i <= '1';                           -- 101
    WAIT FOR 10 ns;
    b_i <= '1'; c_i <= '0';               -- 110
    WAIT FOR 10 ns;
    c_i <= '1';                           -- 111
    WAIT;
  END PROCESS p_stimulus;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART
  -- Version 1: concurrent signal assignment (original).
  result_o <= a_i AND (b_i OR c_i);

  -- Version 2: the same logic described with a process.
  -- The sensitivity list contains every signal the process reads.
  p_and_or : PROCESS (a_i, b_i, c_i) IS
  BEGIN
    result_proc_o <= a_i AND (b_i OR c_i);
  END PROCESS p_and_or;
END ARCHITECTURE behavioral;
```

**Expected waveform:** the stimulus process applies all eight input combinations, 10 ns each. `result_o` and `result_proc_o` are identical at every moment: both are '1' only for `a_i b_i c_i` = 101, 110 and 111.

---

[← Back to the Solutions index](../README.md)
