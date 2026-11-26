# Chapter 14. LOOPS

[← Back to the Solutions index](../README.md)

**Code files for this chapter** (compiled and simulated; add them to a Vivado project like the book examples):

| Exercise | Files |
| --- | --- |
| 14.1 | [module_1.vhd](Exercise_14_01/module_1.vhd) |
| 14.2 | [module_1.vhd](Exercise_14_02/module_1.vhd) |
| 14.3 | [module_1.vhd](Exercise_14_03/module_1.vhd) |

## Exercise 1 - Counting '1' bits with a FOR loop

```vhdl
-- Requires VHDL-2008
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL data_s       : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL ones_count_s : INTEGER RANGE 0 TO 8;
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION: apply the four test values, 10 ns each.
  p_stimulus : PROCESS
  BEGIN
    data_s <= "00000000";  WAIT FOR 10 ns;   -- expected 0
    data_s <= "00001111";  WAIT FOR 10 ns;   -- expected 4
    data_s <= "10101010";  WAIT FOR 10 ns;   -- expected 4
    data_s <= "11111111";  WAIT FOR 10 ns;   -- expected 8
    WAIT;
  END PROCESS p_stimulus;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART: count the '1' bits with a FOR loop.
  p_count_ones : PROCESS (ALL) IS
    VARIABLE count_v : INTEGER RANGE 0 TO 8;
  BEGIN
    count_v := 0;                     -- start from 0 every time the process runs
    FOR i IN 0 TO 7 LOOP
      IF data_s(i) = '1' THEN
        count_v := count_v + 1;
      END IF;
    END LOOP;
    ones_count_s <= count_v;          -- final result after all 8 bits
  END PROCESS p_count_ones;
END ARCHITECTURE behavioral;
```

| `data_s` | `ones_count_s` |
| --- | --- |
| `00000000` | 0 |
| `00001111` | 4 |
| `10101010` | 4 |
| `11111111` | 8 |

`count_v` must be set to 0 at the start of the process. A variable keeps its value between process runs, so without this line the count would continue from the previous result.

## Exercise 2 - Searching for the first '1' with EXIT

```vhdl
-- Requires VHDL-2008
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL data_s      : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL first_one_s : INTEGER RANGE 0 TO 4;   -- 4 means "not found"
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION: apply the four test values, 10 ns each.
  p_stimulus : PROCESS
  BEGIN
    data_s <= "0001";  WAIT FOR 10 ns;   -- expected 0
    data_s <= "0100";  WAIT FOR 10 ns;   -- expected 2
    data_s <= "1010";  WAIT FOR 10 ns;   -- expected 1
    data_s <= "0000";  WAIT FOR 10 ns;   -- expected 4 (not found)
    WAIT;
  END PROCESS p_stimulus;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART: search from index 0 toward index 3.
  p_find_first : PROCESS (ALL) IS
    VARIABLE index_v : INTEGER RANGE 0 TO 4;
  BEGIN
    index_v := 4;                   -- default: no '1' found
    FOR i IN 0 TO 3 LOOP
      IF data_s(i) = '1' THEN
        index_v := i;               -- store the index of the first '1'
        EXIT;                       -- leave the loop immediately
      END IF;
    END LOOP;
    first_one_s <= index_v;
  END PROCESS p_find_first;
END ARCHITECTURE behavioral;
```

| `data_s` | `first_one_s` | Explanation |
| --- | --- | --- |
| `"0001"` | 0 | Bit 0 (the rightmost bit) is '1' |
| `"0100"` | 2 | Bits 0 and 1 are '0'; bit 2 is '1' |
| `"1010"` | 1 | Bit 1 is found first; the loop exits before bit 3 |
| `"0000"` | 4 | No '1' found; the default value stays |

Remember that with `DOWNTO`, index 0 is the **rightmost** character of the string. Searching from index 0 therefore starts at the right.

## Exercise 3 - Generating pulses with a WHILE loop

This follows the same structure as Example 14.19.

```vhdl
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL pulse_s : STD_LOGIC := '0'; -- initialize to 0
BEGIN
  -- SIMULATION-ONLY: three pulse cycles of 10 ns HIGH and 10 ns LOW.
  p_simulation : PROCESS
    VARIABLE cycle_v : INTEGER;  -- number of completed cycles
  BEGIN
    cycle_v := 0;

    WHILE cycle_v < 3 LOOP
      pulse_s <= '1';
      WAIT FOR 10 ns;            -- HIGH for 10 ns

      pulse_s <= '0';
      WAIT FOR 10 ns;            -- LOW for 10 ns

      cycle_v := cycle_v + 1;    -- one cycle completed
    END LOOP;

    WAIT;                        -- stop the process
  END PROCESS p_simulation;
END ARCHITECTURE behavioral;
```

**Expected waveform:** `pulse_s` is HIGH from 0 to 10 ns, 20 to 30 ns and 40 to 50 ns, and LOW at all other times. The `WHILE` condition is checked at the start of every cycle. When `cycle_v` reaches 3 the loop ends, and the final `WAIT;` stops the process, so `pulse_s` stays LOW after 60 ns.

---

[← Back to the Solutions index](../README.md)
