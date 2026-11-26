# Chapter 11. Combinational Logic

[← Back to the Solutions index](../README.md)

**Code files for this chapter** (compiled and simulated; add them to a Vivado project like the book examples):

| Exercise | Files |
| --- | --- |
| 11.2 | [module_1.vhd](Exercise_11_02/module_1.vhd) |
| 11.3 | [module_1.vhd](Exercise_11_03/module_1.vhd) |
| 11.4 | [module_1.vhd](Exercise_11_04/module_1.vhd) |
| 11.6 | [module_1.vhd](Exercise_11_06/module_1.vhd) |
| 11.7 | [module_1.vhd](Exercise_11_07/module_1.vhd) |

## Exercise 1 - What sequential means here

Inside a process, the statements are read **one after another, from top to bottom**, like a recipe. If a signal is assigned more than once, the last assignment wins. This is only how the description is read. The hardware that synthesis builds from a combinational process is still ordinary combinational logic (gates and multiplexers) with no clock and no stored value. Sequential describes the order of the statements, not a sequence of events in time.

## Exercise 2 - 2-to-1 multiplexer with IF ... ELSE

As in the book's Chapter 9 and 11 examples, the input ports have default values, so you can simulate the design directly and change the values to try other cases.

```vhdl
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    input_a_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    input_b_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    sel_i     : IN STD_LOGIC := '0';
    result_o  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE RTL OF MODULE_1 IS
BEGIN
  -- Combinational process: every signal that is read is in the list.
  p_mux : PROCESS (sel_i, input_a_i, input_b_i) IS
  BEGIN
    IF sel_i = '0' THEN
      result_o <= input_a_i;
    ELSE
      result_o <= input_b_i;
    END IF;
  END PROCESS p_mux;
END ARCHITECTURE RTL;
```

## Exercise 3 - The same multiplexer with PROCESS(ALL)

```vhdl
-- Requires VHDL-2008
ARCHITECTURE RTL OF MODULE_1 IS
BEGIN
  -- PROCESS(ALL): the sensitivity list is built automatically.
  p_mux : PROCESS (ALL) IS
  BEGIN
    IF sel_i = '0' THEN
      result_o <= input_a_i;
    ELSE
      result_o <= input_b_i;
    END IF;
  END PROCESS p_mux;
END ARCHITECTURE RTL;
```

The entity is unchanged. `PROCESS(ALL)` automatically includes every signal the process **reads**: `sel_i`, `input_a_i` and `input_b_i`. `result_o` is not included because the process only **writes** to it; it appears only on the left side of `<=`. A change on an output cannot change what the process calculates, so the process does not need to wake up for it.

## Exercise 4 - Priority logic with IF ... ELSIF ... ELSE

```vhdl
-- Requires VHDL-2008
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    input_a_i   : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    input_b_i   : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    input_c_i   : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
    request_a_i : IN STD_LOGIC := '0';
    request_b_i : IN STD_LOGIC := '0';
    result_o    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE RTL OF MODULE_1 IS
BEGIN
  p_priority : PROCESS (ALL) IS
  BEGIN
    IF request_a_i = '1' THEN      -- highest priority
      result_o <= input_a_i;
    ELSIF request_b_i = '1' THEN   -- checked only if request_a_i is not '1'
      result_o <= input_b_i;
    ELSE                           -- default when no request is active
      result_o <= input_c_i;
    END IF;
  END PROCESS p_priority;
END ARCHITECTURE RTL;
```

The `ELSE` branch gives `result_o` a value when neither request is '1', so `result_o` is assigned in every case.

## Exercise 5 - Understanding priority

**`input_a_i` is selected.** `IF ... ELSIF ... ELSE` checks the conditions in order and stops at the first TRUE one. `request_a_i = '1'` is checked first, so the `ELSIF` is never reached.

If the order were reversed (`IF request_b_i = '1'` first, then `ELSIF request_a_i = '1'`), `request_b_i` would have the higher priority and `input_b_i` would be selected when both requests are '1'. When only one request is '1', both orders give the same result. Only the case where both are '1' changes.

## Exercise 6 - CASE statement for level\_s

The module below includes a short simulation section that steps `level_s` from 0 to 15, so you can run it directly and check the table.

```vhdl
-- Requires VHDL-2008
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL level_s : INTEGER RANGE 0 TO 15 := 0;
  SIGNAL code_o  : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION: step level_s through 0 to 15, 10 ns each.
  p_stimulus : PROCESS
  BEGIN
    FOR i IN 0 TO 15 LOOP
      level_s <= i;
      WAIT FOR 10 ns;
    END LOOP;
    WAIT;
  END PROCESS p_stimulus;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART
  p_level_code : PROCESS (ALL) IS
  BEGIN
    CASE level_s IS
      WHEN 0 TO 2 =>
        code_o <= "001";
      WHEN 3 | 5 =>
        code_o <= "010";
      WHEN 6 TO 9 =>
        code_o <= "011";
      WHEN OTHERS =>          -- 4 and 10 to 15
        code_o <= "111";
    END CASE;
  END PROCESS p_level_code;
END ARCHITECTURE behavioral;
```

| `level_s` | `code_o` |
| --- | --- |
| 0, 1, 2 | `001` |
| 3, 5 | `010` |
| 6, 7, 8, 9 | `011` |
| 4, 10 to 15 | `111` |

Note that 4 is not listed in any choice, so it falls into `WHEN OTHERS`.

## Exercise 7 - From RTL schematic to VHDL code

The schematic shows two multiplexers in series. The first (`stage_1_s`) selects `a_i` or `b_i` using `sel_i`. The second (`y_o`) passes `stage_1_s` when `enable_i = '1'` and outputs '0' (the ground symbol) otherwise.

```vhdl
-- Requires VHDL-2008
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    a_i      : IN STD_LOGIC := '0';
    b_i      : IN STD_LOGIC := '1';
    sel_i    : IN STD_LOGIC := '0';
    enable_i : IN STD_LOGIC := '1';
    y_o      : OUT STD_LOGIC
  );
END ENTITY MODULE_1;

ARCHITECTURE RTL OF MODULE_1 IS
  SIGNAL stage_1_s : STD_LOGIC;  -- output of the first multiplexer
BEGIN
  -- First multiplexer: selects a_i or b_i.
  p_stage_1 : PROCESS (ALL) IS
  BEGIN
    IF sel_i = '0' THEN
      stage_1_s <= a_i;
    ELSE
      stage_1_s <= b_i;
    END IF;
  END PROCESS p_stage_1;

  -- Second multiplexer: passes stage_1_s or forces '0'.
  p_stage_2 : PROCESS (ALL) IS
  BEGIN
    IF enable_i = '1' THEN
      y_o <= stage_1_s;
    ELSE
      y_o <= '0';
    END IF;
  END PROCESS p_stage_2;
END ARCHITECTURE RTL;
```

Open **RTL Analysis > Open Elaborated Design > Schematic** to check your result. You should see the same two `RTL_MUX` blocks connected by `stage_1_s`.

---

[← Back to the Solutions index](../README.md)
