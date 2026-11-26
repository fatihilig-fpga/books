# Chapter 12. Sequential Logic and Clocked Processes

[← Back to the Solutions index](../README.md)

**Code files for this chapter** (compiled and simulated; add them to a Vivado project like the book examples):

| Exercise | Files |
| --- | --- |
| 12.1 | [module_1.vhd](Exercise_12_01/module_1.vhd), [module_1_sim.vhd](Exercise_12_01/module_1_sim.vhd) |
| 12.2 | [module_1.vhd](Exercise_12_02/module_1.vhd), [module_1_sim.vhd](Exercise_12_02/module_1_sim.vhd) |
| 12.3 | [module_1.vhd](Exercise_12_03/module_1.vhd), [module_1_sim.vhd](Exercise_12_03/module_1_sim.vhd) |

`module_1.vhd` is the design version (for Open Elaborated Design > Schematic) and `module_1_sim.vhd` is the simulation version, as in the book's example pairs. Both use the entity name `MODULE_1`, so add only one of them to a Vivado project at a time.

As in the chapter, each answer gives a **design version** (with ports, for Open Elaborated Design > Schematic) and a **simulation version** (the same logic in a self-contained `MODULE_1` with a simulation-only section).

## Exercise 1 - D flip-flop with synchronous reset

**Design version:**

```vhdl
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i   : IN STD_LOGIC;  -- Clock input.
    reset_i : IN STD_LOGIC;  -- Synchronous reset input.
    d_i     : IN STD_LOGIC;  -- Data input.
    q_o     : OUT STD_LOGIC  -- Register output.
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- Rising-edge D flip-flop with a synchronous reset.
  p_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Synchronous reset: checked only at the rising edge of clk_i.
      IF reset_i = '1' THEN
        q_o <= '0';
      ELSE
        -- Store the value of d_i.
        q_o <= d_i;
      END IF;
    END IF;
  END PROCESS p_register;
END ARCHITECTURE behavioral;
```

**Elaborated schematic:** open **Open Elaborated Design > Schematic**. You should see one register labelled `RTL_REG_SYNC`, with `d_i` on its D input, `clk_i` on its clock input and `reset_i` connected to its RST input. The word SYNC shows that the reset described in the VHDL code is synchronous: it is checked only at the rising edge of `clk_i`.

**Simulation version:**

```vhdl
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- NOTE: These signals are declared here to make the simulation example easier to follow.
  -- In the design version, they are declared in the entity port list.
  SIGNAL clk_i   : STD_LOGIC := '0'; -- Clock input.
  SIGNAL reset_i : STD_LOGIC;        -- Synchronous reset input.
  SIGNAL d_i     : STD_LOGIC;        -- Data input.
  SIGNAL q_o     : STD_LOGIC;        -- Register output.
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION
  -- This section is used only to generate input values for simulation.
  PROCESS BEGIN
    -- Start with d_i at '1' and activate the reset. The reset must win.
    d_i     <= '1';
    reset_i <= '1';
    -- Keep the reset active for two rising edges.
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    -- Release the reset. q_o now follows d_i at each rising edge.
    reset_i <= '0';
    -- Change d_i after a falling edge so that it is stable before the next rising edge.
    WAIT UNTIL falling_edge(clk_i);
    WAIT UNTIL falling_edge(clk_i);
    d_i <= '0';
    WAIT UNTIL falling_edge(clk_i);
    d_i <= '1';
    WAIT;
  END PROCESS;
  -- Generate the clock for simulation. clk_i changes every 5 ns, giving a 10 ns clock period.
  clk_i <= NOT clk_i AFTER 5 ns;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART
  p_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        q_o <= '0';
      ELSE
        q_o <= d_i;
      END IF;
    END IF;
  END PROCESS p_register;
END ARCHITECTURE behavioral;
```

**Expected waveform:** `q_o` stays '0' during reset even though `d_i = '1'`, because the reset has priority. After reset is released, `q_o` changes only at rising edges of `clk_i`: it becomes '1', then '0', then '1' again, one clock edge after each change of `d_i`.

## Exercise 2 - 5-stage shift register

This is Example 12.18 extended from four to five stages, keeping its synchronous reset.

**Design version:**

```vhdl
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i   : IN STD_LOGIC; -- Clock input.
    reset_i : IN STD_LOGIC; -- Synchronous reset input.
    d_i     : IN STD_LOGIC; -- Serial data input.
    q_o     : OUT STD_LOGIC -- Serial data output.
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signals representing the five register stages.
  SIGNAL stages_s : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
  -- Five-stage shift register. At each rising edge, the data moves one stage forward.
  p_shift_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Synchronous reset: Clear all five stages when reset_i is '1'.
      IF reset_i = '1' THEN
        stages_s <= (OTHERS => '0');
      ELSE
        -- Shift the data one stage forward.
        stages_s(0)          <= d_i;
        stages_s(4 DOWNTO 1) <= stages_s(3 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS p_shift_register;

  q_o <= stages_s(4); -- Connect the last stage of the shift register to the output.
END ARCHITECTURE behavioral;
```

The two assignments inside the `ELSE` branch are register transfers. Both read the values that existed just before the clock edge, so their order does not matter.

**Simulation version:**

```vhdl
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Signals used only for this simulation example.
  SIGNAL clk_i   : STD_LOGIC := '0'; -- Clock signal.
  SIGNAL reset_i : STD_LOGIC;        -- Synchronous reset signal.
  SIGNAL d_i     : STD_LOGIC;        -- Serial data input.
  SIGNAL q_o     : STD_LOGIC;        -- Serial data output.
  -- Vector representing the five stages of the shift register.
  SIGNAL stages_s : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION: This section generates the input values required for simulation.
  PROCESS BEGIN
    -- Start with d_i at '0' and activate the reset.
    d_i     <= '0';
    reset_i <= '1';
    -- Keep the reset active for two rising edges.
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    -- Release the reset.
    reset_i <= '0';
    -- Wait for a falling edge, then set d_i to '1' so that it is stable before the next rising edge.
    WAIT UNTIL falling_edge(clk_i);
    d_i <= '1';
    -- Keep d_i at '1' for one clock cycle, then return it to '0' at the next falling edge.
    WAIT UNTIL falling_edge(clk_i);
    d_i <= '0';
    WAIT;
  END PROCESS;
  -- Generate the clock for simulation. clk_i changes every 5 ns, giving a 10 ns clock period.
  clk_i <= NOT clk_i AFTER 5 ns;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART: At each rising edge, the stored data moves forward by one stage.
  p_shift_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        stages_s <= (OTHERS => '0');
      ELSE
        stages_s(0)          <= d_i;
        stages_s(4 DOWNTO 1) <= stages_s(3 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS p_shift_register;
  -- Connect the final stage of the shift register to the output.
  q_o <= stages_s(4);
END ARCHITECTURE behavioral;
```

**Expected waveform:** add `stages_s` to the waveform. The single '1' on `d_i` is stored in `stages_s(0)` at the first rising edge after it is applied, moves one position forward at each following rising edge, and reaches `q_o` on the fifth rising edge, counting the edge when it first entered `stages_s(0)` (four further rising edges after the first capture). It then leaves the register and `q_o` returns to '0'.

## Exercise 3 - Modified parameterized counter

The counter in Example 12.21 already has every feature the exercise asks for: synchronous reset, enable, counting by 1, returning to 0 after the maximum, and `max_reached_o`. Only the default value of `G_MAX_COUNT` changes from 7 to 10.

**Design version:**

```vhdl
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
  GENERIC (
    -- Maximum counter value before the counter returns to zero.
    G_MAX_COUNT : INTEGER := 10  -- CHANGED: default value 7 -> 10
  );
  PORT (
    clk_i         : IN STD_LOGIC;        -- Clock input.
    reset_i       : IN STD_LOGIC;        -- Synchronous reset input.
    enable_i      : IN STD_LOGIC;        -- Counter enable input.
    max_reached_o : OUT STD_LOGIC;       -- Indicates that the maximum count has been reached.
    count_o       : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- Current counter value.
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- 8-bit register used to store the current counter value.
  SIGNAL count_s : UNSIGNED(7 DOWNTO 0);
BEGIN
  -- Clocked process that controls the counter.
  p_counter : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Synchronous reset:
      -- Clear the counter when reset_i is '1'.
      IF reset_i = '1' THEN
        count_s <= (OTHERS => '0');
      ELSIF (enable_i = '1') THEN
        -- Count only when enable_i is '1'. Otherwise keep the previous counter value.
        -- If the maximum count is reached, return the counter to zero.
        IF (count_s = G_MAX_COUNT) THEN
          count_s <= (OTHERS => '0');
        ELSE
          -- Increase the previous counter value by 1.
          count_s <= count_s + 1;
        END IF;
      END IF;
    END IF;
  END PROCESS p_counter;

  -- Convert the internal UNSIGNED counter value to STD_LOGIC_VECTOR for the output.
  count_o <= STD_LOGIC_VECTOR(count_s);

  -- Set max_reached_o to '1' when the counter reaches G_MAX_COUNT.
  max_reached_o <= '1' WHEN count_s = G_MAX_COUNT ELSE '0';

END ARCHITECTURE behavioral;
```

**Simulation version** (Example 12.22 with the same change):

```vhdl
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  CONSTANT G_MAX_COUNT : INTEGER := 10; -- CHANGED: 7 -> 10
  SIGNAL clk_i      : STD_LOGIC := '0'; -- Clock input.
  SIGNAL reset_i    : STD_LOGIC;        -- Synchronous reset input.
  SIGNAL enable_i   : STD_LOGIC;        -- Counter enable input.
  SIGNAL max_reached_o : STD_LOGIC;     -- Indicates that the maximum count has been reached.
  SIGNAL count_o    : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Current counter value.
  SIGNAL count_s : UNSIGNED(7 DOWNTO 0); -- register used to store the current counter value.
BEGIN
  -- SIMULATION-ONLY SECTION. This section generates the input values required for simulation.
  clk_i <= NOT clk_i AFTER 5 NS;
  --
  PROCESS BEGIN
    enable_i <= '0';
    reset_i  <= '1';
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    reset_i <= '0';
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    enable_i <= '1';
    WAIT FOR 200 ns;
    WAIT UNTIL rising_edge(clk_i);
    enable_i <= '0';
    WAIT;
  END PROCESS;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART: Clocked process that controls the counter.
  p_counter : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Synchronous reset: Clear the counter when reset_i is '1'.
      IF reset_i = '1' THEN
        count_s <= (OTHERS => '0');
      ELSIF (enable_i = '1') THEN
        -- Count only when enable_i is '1'. Otherwise keep the previous counter value.
        -- If the maximum count is reached, return the counter to zero.
        IF (count_s = G_MAX_COUNT) THEN
          count_s <= (OTHERS => '0');
        ELSE
          count_s <= count_s + 1; -- Increase the previous counter value by 1.
        END IF;
      END IF;
    END IF;
  END PROCESS p_counter;
  -- Convert the internal UNSIGNED counter value to STD_LOGIC_VECTOR for the output.
  count_o <= STD_LOGIC_VECTOR(count_s);
  -- Set max_reached_o to '1' when the counter reaches G_MAX_COUNT.
  max_reached_o <= '1' WHEN count_s = G_MAX_COUNT ELSE '0';
END ARCHITECTURE behavioral;
```

**Expected waveform:** `count_o` stays at 0 during reset and while `enable_i = '0'`. When `enable_i` becomes '1', it counts 0, 1, 2 ... 10 and then returns to 0. `max_reached_o` is high whenever `count_o` equals 10. With `enable_i` continuously high, this normally lasts one clock cycle; if counting is disabled while the count is 10, it stays high until the count changes. When `enable_i` returns to '0', the counter keeps its last value.

---

[← Back to the Solutions index](../README.md)
