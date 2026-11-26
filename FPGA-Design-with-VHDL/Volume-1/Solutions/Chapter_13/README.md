# Chapter 13. Variables

[← Back to the Solutions index](../README.md)

**Code files for this chapter** (compiled and simulated; add them to a Vivado project like the book examples):

| Exercise | Files |
| --- | --- |
| 13.1 | [module_1.vhd](Exercise_13_01/module_1.vhd) |
| 13.3 | [module_1.vhd](Exercise_13_03/module_1.vhd) |

## Exercise 1 - Variable assignment

```vhdl
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- This signal is used to observe the final value of the variable in the waveform.
  SIGNAL count_result_s : INTEGER := 0;
BEGIN
  p_variable : PROCESS
    -- Variables are declared in the process declarative region.
    VARIABLE v_count : INTEGER := 0;
  BEGIN
    WAIT FOR 10 ns;
    -- v_count becomes 10 immediately.
    v_count := 10;
    -- The new value of v_count is already available, so 10 + 5 = 15.
    v_count := v_count + 5;
    -- Copy the variable to a signal so that the result can be seen in the waveform.
    count_result_s <= v_count;
    WAIT;
  END PROCESS p_variable;
END ARCHITECTURE behavioral;
```

The final value is **15**. A variable is updated immediately, so the second line reads 10 and adds 5. As in Example 13.1, the variable is copied to a signal (`count_result_s`) so that the result can be seen in the waveform: it becomes 15 at 10 ns.

## Exercise 2 - Signal vs variable

| Version | Result | Why |
| --- | --- | --- |
| Variable | `v_temp = 6` | `:=` updates immediately. The second line reads the new value 5 and adds 1. |
| Signal | `s_temp` is scheduled to become **1** | `<=` does not update until the process suspends. Both lines read the old value 0. The second assignment (0 + 1 = 1) replaces the first, because the last assignment wins. |

Variables behave like steps in a calculation: each line sees the result of the line before. Signals behave like wires and registers: inside one process run, every line sees the value the signal had when the process started.

## Exercise 3 - Find and correct the mistake

1. **After the rising edge, `v_data = "0011"`.**
2. **Why:** variables update immediately. The first line sets `v_data(0) := '1'`, giving `"0001"`. The second line then copies `v_data(2 DOWNTO 0)`, which already contains the new '1', into bits 3 to 1. Bit 1 therefore also becomes '1', and the result is `"0011"`. The new bit has moved two places in one clock cycle.
3. **Corrected order:** shift the old bits first, then load the new bit.

```vhdl
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i  : IN STD_LOGIC;
    data_i : IN STD_LOGIC;
    data_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  p_shift : PROCESS (clk_i)
    VARIABLE v_data : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  BEGIN
    IF rising_edge(clk_i) THEN
      v_data(3 DOWNTO 1) := v_data(2 DOWNTO 0);  -- 1) shift the old bits first
      v_data(0) := data_i;                       -- 2) then load the new bit
      data_o <= v_data;                          -- make the result visible
    END IF;
  END PROCESS p_shift;
END ARCHITECTURE behavioral;
```

Now the first rising edge with `data_i = '1'` gives `"0001"`, as intended. The output port `data_o` was added so the result can be seen in the waveform; the original process stores the value only inside the variable. Using a signal for the shift register, as in Chapter 12, avoids this ordering problem completely.

---

[← Back to the Solutions index](../README.md)
