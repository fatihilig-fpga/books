# Chapter 15. Practical FPGA Examples

[← Back to the Solutions index](../README.md)

**Code files for this chapter** (compiled and simulated; add them to a Vivado project like the book examples):

| Exercise | Files |
| --- | --- |
| 15.1 | [module_1.vhd](Exercise_15_01/module_1.vhd), [module_1_sim.vhd](Exercise_15_01/module_1_sim.vhd) |
| 15.2 | [module_1.vhd](Exercise_15_02/module_1.vhd), [module_1_sim.vhd](Exercise_15_02/module_1_sim.vhd) |
| 15.3 | [module_1.vhd](Exercise_15_03/module_1.vhd) |

For Exercises 15.1 and 15.2, `module_1.vhd` is the design for the board and `module_1_sim.vhd` is the simulation version, like Ex_15_03/Ex_15_04 and Ex_15_06/Ex_15_05 in the book. Both use the entity name `MODULE_1`, so add only one of them to a Vivado project at a time. Exercise 15.3 is a single simulation module.

The Exercise 15.1 files are set for the PYNQ-Z1 (125 MHz). For Basys 3 or Arty A7 (100 MHz), use the commented 100 MHz lines in both files: in `module_1_sim.vhd`, change **both** `C_MAX_COUNT` (to `9_999_999`) and the simulation clock (to `AFTER 5 ns`).

## Exercise 1 - Changing the LED blink rate

**Calculation.** The LED must change state every 0.1 s.

```math
\text{cycles} = f_{clk} \times 0.1\ \text{s} \qquad C\_MAX\_COUNT = \text{cycles} - 1
```

The counter starts at 0, so it counts *cycles* values from 0 to C\_MAX\_COUNT; that is why 1 is subtracted.

| Board | Clock | Cycles in 0.1 s | `C_MAX_COUNT` |
| --- | --- | --- | --- |
| PYNQ-Z1 | 125 MHz | 12,500,000 | `12_499_999` |
| Basys 3 | 100 MHz | 10,000,000 | `9_999_999` |
| Arty A7 | 100 MHz | 10,000,000 | `9_999_999` |

The LED is then ON for 0.1 s and OFF for 0.1 s, so it blinks 5 times per second (a 0.2 s period).

**Updated VHDL code.** Only the constant changes:

```vhdl
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i   : IN STD_LOGIC;
    reset_i : IN STD_LOGIC;
    led_o   : OUT STD_LOGIC
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- 125 MHz clock (PYNQ-Z1):
  -- 12,500,000 clock cycles = 0.1 seconds.
  CONSTANT C_MAX_COUNT : INTEGER := 12_499_999;
  -- For a 100 MHz clock (Basys 3, Arty A7) use instead:
  -- CONSTANT C_MAX_COUNT : INTEGER := 9_999_999;

  SIGNAL count_s : INTEGER RANGE 0 TO C_MAX_COUNT := 0;
  SIGNAL led_s   : STD_LOGIC := '0';
BEGIN

  p_led_blink : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        count_s <= 0;
        led_s   <= '0';
      ELSE
        IF count_s = C_MAX_COUNT THEN
          count_s <= 0;
          led_s   <= NOT led_s;
        ELSE
          count_s <= count_s + 1;
        END IF;
      END IF;
    END IF;
  END PROCESS p_led_blink;

  led_o <= led_s;

END ARCHITECTURE behavioral;
```

**Simulation.** Use the simulation version, Example 15.4 (Ex\_15\_04) and change `C_MAX_COUNT` to the same value. Set the simulation run time to 300 ms in the toolbar and click **Run For**, as in Section 15.3. Then measure the time between two consecutive changes of `led_s`: it should be **100 ms**. With the PYNQ-Z1 version, the first change appears at about 100 ms (just after reset is released) and the second at about 200 ms. Simulating this many clock cycles takes some time; to check only the logic quickly, use a small value such as `C_MAX_COUNT := 4`, as the book does in Example 15.5.

**Basys 3 and Arty A7 (100 MHz).** Example 15.4 generates a 125 MHz simulation clock (8 ns period). For a 100 MHz board, change **both** settings in the simulation version:

```vhdl
CONSTANT C_MAX_COUNT : INTEGER := 9_999_999;   -- 10,000,000 cycles at 100 MHz = 0.1 s
...
clk_s <= NOT clk_s AFTER 5 ns;                  -- 10 ns period = 100 MHz
```

If you change only `C_MAX_COUNT` and keep the 8 ns clock, the simulated interval is 0.08 s instead of 0.1 s. With both changes, `led_s` again changes every 100 ms.

**On the board.** Generate the bitstream and program the device. The LED now blinks five times faster than before: 0.1 s ON, 0.1 s OFF, instead of 0.5 s ON, 0.5 s OFF.

## Exercise 2 - Counting downward

Two lines change in the LED counter process, and the initial value of `led_s` changes to match the reset value.

```vhdl
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i   : IN STD_LOGIC;
    reset_i : IN STD_LOGIC;
    led_o   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- 125 MHz clock: 62,500,000 clock cycles = 0.5 seconds.
  CONSTANT C_MAX_COUNT : INTEGER := 62_499_999;
  -- Counter used to create a slower timing interval.
  SIGNAL count_s : INTEGER RANGE 0 TO C_MAX_COUNT := 0;
  -- Stores the 4-bit LED count value. Starts from 1111.
  SIGNAL led_s : UNSIGNED(3 DOWNTO 0) := (OTHERS => '1');
BEGIN
  -- Count clock cycles up to C_MAX_COUNT (unchanged).
  p_counter : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        count_s <= 0;
      ELSE
        IF count_s = C_MAX_COUNT THEN
          count_s <= 0;
        ELSE
          count_s <= count_s + 1;
        END IF;
      END IF;
    END IF;
  END PROCESS p_counter;

  -- Decrease the LED value whenever the counter reaches
  -- its maximum value.
  p_led_counter : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        led_s <= (OTHERS => '1');        -- CHANGED: start from 1111
      ELSE
        IF count_s = C_MAX_COUNT THEN
          led_s <= led_s - 1;            -- CHANGED: count down
        END IF;
      END IF;
    END IF;
  END PROCESS p_led_counter;

  -- Convert UNSIGNED to STD_LOGIC_VECTOR for the output port.
  led_o <= STD_LOGIC_VECTOR(led_s);

END ARCHITECTURE behavioral;
```

No extra code is needed for the wrap-around. When `led_s = "0000"` and 1 is subtracted, a 4-bit `UNSIGNED` value wraps to `"1111"`, exactly like the up-counter wraps from `"1111"` to `"0000"`. For a 100 MHz board, use `C_MAX_COUNT := 49_999_999` for the same 0.5 s step.

**Simulation.** In the simulation version, Example 15.5 (Ex\_15\_05, with `C_MAX_COUNT := 4`), make the same three changes:

```vhdl
SIGNAL led_s   : UNSIGNED(3 DOWNTO 0) := (OTHERS => '1');
SIGNAL led_o_s : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '1');
...
        led_s <= (OTHERS => '1');        -- CHANGED: start from 1111
...
          led_s <= led_s - 1;            -- CHANGED: count down
```

With the radix set to Binary, `led_o_s` shows 1111, 1110, 1101 ... 0001, 0000, 1111, 1110, changing every 5 clock cycles. After reset is applied again, it restarts from 1111.

**On the board.** The four LEDs start all ON (1111) after reset and count down in binary, one step every 0.5 s.

## Exercise 3 - Comparing the three implementations

The three synthesizable versions are Examples 15.8, 15.9 and 15.10 in the book. To simulate and compare them in one run, the module below follows the simulation version, Example 15.7, and puts all three descriptions side by side, each with its own output signal.

```vhdl
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL A_s : STD_LOGIC := '0';
  SIGNAL B_s : STD_LOGIC := '0';
  SIGNAL C_s : STD_LOGIC := '0';
  -- Combine the three inputs for the CASE statement and WHEN...ELSE versions.
  SIGNAL ABC_s : STD_LOGIC_VECTOR(2 DOWNTO 0);
  -- One output for each implementation.
  SIGNAL F_sop_s  : STD_LOGIC;  -- 1. Boolean sum-of-minterms expression
  SIGNAL F_case_s : STD_LOGIC;  -- 2. CASE statement
  SIGNAL F_when_s : STD_LOGIC;  -- 3. WHEN...ELSE conditional signal assignment
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION: Apply all possible input combinations.
  p_stimulus : PROCESS
  BEGIN
    -- m0 = 000
    A_s <= '0';
    B_s <= '0';
    C_s <= '0';
    WAIT FOR 10 ns;
    -- m1 = 001
    A_s <= '0';
    B_s <= '0';
    C_s <= '1';
    WAIT FOR 10 ns;
    -- m2 = 010
    A_s <= '0';
    B_s <= '1';
    C_s <= '0';
    WAIT FOR 10 ns;
    -- m3 = 011
    A_s <= '0';
    B_s <= '1';
    C_s <= '1';
    WAIT FOR 10 ns;
    -- m4 = 100
    A_s <= '1';
    B_s <= '0';
    C_s <= '0';
    WAIT FOR 10 ns;
    -- m5 = 101
    A_s <= '1';
    B_s <= '0';
    C_s <= '1';
    WAIT FOR 10 ns;
    -- m6 = 110
    A_s <= '1';
    B_s <= '1';
    C_s <= '0';
    WAIT FOR 10 ns;
    -- m7 = 111
    A_s <= '1';
    B_s <= '1';
    C_s <= '1';
    WAIT FOR 10 ns;
    WAIT;
  END PROCESS p_stimulus;
  -- ---------------------------------------------
  -- 1. Sum-of-minterms implementation: F = A'BC' + A'BC + ABC' + ABC
  F_sop_s <= ((NOT A_s) AND B_s AND (NOT C_s)) OR
             ((NOT A_s) AND B_s AND C_s)       OR
             (A_s AND B_s AND (NOT C_s))       OR
             (A_s AND B_s AND C_s);
  -- ---------------------------------------------
  -- Create a 3-bit input vector for implementations 2 and 3.
  ABC_s <= A_s & B_s & C_s;
  -- ---------------------------------------------
  -- 2. CASE statement implementation.
  p_minterm_case : PROCESS (ABC_s) IS
  BEGIN
    CASE ABC_s IS
      -- F = 1 for m2, m3, m6, and m7.
      WHEN "010" =>
        F_case_s <= '1';
      WHEN "011" =>
        F_case_s <= '1';
      WHEN "110" =>
        F_case_s <= '1';
      WHEN "111" =>
        F_case_s <= '1';
      -- F = 0 for all other input combinations.
      WHEN OTHERS =>
        F_case_s <= '0';
    END CASE;
  END PROCESS p_minterm_case;
  -- ---------------------------------------------
  -- 3. WHEN...ELSE implementation.
  F_when_s <= '1' WHEN ABC_s = "010" OR
                       ABC_s = "011" OR
                       ABC_s = "110" OR
                       ABC_s = "111"
                       ELSE '0';
  -- ---------------------------------------------
END ARCHITECTURE behavioral;
```

**Expected result:**

| ABC | 000 | 001 | 010 | 011 | 100 | 101 | 110 | 111 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `F_sop_s`, `F_case_s`, `F_when_s` | 0 | 0 | **1** | **1** | 0 | 0 | **1** | **1** |

`F_sop_s`, `F_case_s` and `F_when_s` are the three versions of the book's `F_o`, so they should always agree. The three outputs are identical in the waveform: each is '1' only for 010, 011, 110 and 111.

**Comparison.** All three descriptions produce the same function. Looking at the table, the output is '1' exactly when B is '1', whatever A and C are, so the function simplifies to **F = B**. Because they describe the same logic, Vivado can build the same small piece of hardware for each. The choice between the three styles is about readability: the Boolean form matches the equation, the `CASE` form is closest to a truth table, and `WHEN ... ELSE` is the most compact.

To check each synthesizable version on its own, as in Section 15.5, use Examples 15.8, 15.9 and 15.10 unchanged.

---

[← Back to the Solutions index](../README.md)
