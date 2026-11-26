# Chapter 9. Concurrent Statements

[← Back to the Solutions index](../README.md)

**Code files for this chapter** (compiled and simulated; add them to a Vivado project like the book examples):

| Exercise | Files |
| --- | --- |
| 9.2 | [module_1.vhd](Exercise_09_02/module_1.vhd) |
| 9.3 | [module_1.vhd](Exercise_09_03/module_1.vhd) |
| 9.4 | [module_1.vhd](Exercise_09_04/module_1.vhd) |
| 9.6 | [module_1.vhd](Exercise_09_06/module_1.vhd) |
| 9.7 | [module_1.vhd](Exercise_09_07/module_1.vhd) |
| 9.8 | [module_1.vhd](Exercise_09_08/module_1.vhd) |

## Exercise 1 - What concurrent means

Concurrent statements all describe hardware that exists and works at the same time, like separate circuits on a board. Each statement is re-evaluated whenever one of the signals it reads changes, regardless of where it is written in the architecture.

No. Changing the order of two concurrent signal assignments does **not** change the hardware or its behavior. The order in the file is only for readability.

## Exercise 2 - 2-to-1 multiplexer with WHEN ... ELSE

As in the chapter's examples, the input ports have default values, so you can simulate the design directly. Change the default values (for example `sel_i := '1'`) and relaunch the simulation to test other cases.

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

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- Select input_a_i when sel_i = '0'. Otherwise, select input_b_i.
  result_o <= input_a_i WHEN sel_i = '0' ELSE input_b_i;
END ARCHITECTURE behavioral;
```

## Exercise 3 - The same multiplexer with WITH ... SELECT

The entity is the same as in Exercise 2. Only the architecture changes:

```vhdl
ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- The same multiplexer described with a selected signal assignment.
  WITH sel_i SELECT
    result_o <= input_a_i WHEN '0',
                input_b_i WHEN OTHERS;
END ARCHITECTURE behavioral;
```

`WHEN OTHERS` is required because `sel_i` is `STD_LOGIC` and has nine possible values, not only '0' and '1'.

## Exercise 4 - Priority selection

```vhdl
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

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- The first TRUE condition wins: request_a_i has the highest priority.
  result_o <= input_a_i WHEN request_a_i = '1' ELSE
              input_b_i WHEN request_b_i = '1' ELSE
              input_c_i;
END ARCHITECTURE behavioral;
```

## Exercise 5 - Understanding priority

**`input_a_i` is selected.** A chained `WHEN ... ELSE` checks its conditions from top to bottom and uses the first one that is TRUE. `request_a_i = '1'` is checked first and is TRUE, so `request_b_i` is never considered. The hardware is a chain of multiplexers in which the `request_a_i` path is closest to the output.

## Exercise 6 - 4-to-1 multiplexer with WITH ... SELECT

```vhdl
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    input_a_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    input_b_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    input_c_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
    input_d_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";
    sel_i     : IN STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    result_o  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- 4-to-1 multiplexer. WHEN OTHERS covers the remaining value "11".
  WITH sel_i SELECT
    result_o <= input_a_i WHEN "00",
                input_b_i WHEN "01",
                input_c_i WHEN "10",
                input_d_i WHEN OTHERS;
END ARCHITECTURE behavioral;
```

## Exercise 7 - The | choice separator

```vhdl
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    input_a_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    input_b_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    select_i  : IN INTEGER RANGE 0 TO 15 := 0;
    result_o  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  WITH select_i SELECT
    result_o <= input_a_i       WHEN 0,
                input_b_i       WHEN 2 | 5,   -- 2 or 5
                (OTHERS => '0') WHEN OTHERS;  -- "0000" for all other values
END ARCHITECTURE behavioral;
```

The range `0 TO 15` on `select_i` is an example. It keeps the input to 4 bits in hardware, as explained for integer ranges in Chapter 5.

## Exercise 8 - A choice range

Add `input_c_i` to the port list and one line to the selected assignment:

```vhdl
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    input_a_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    input_b_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    input_c_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
    select_i  : IN INTEGER RANGE 0 TO 15 := 0;
    result_o  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  WITH select_i SELECT
    result_o <= input_a_i       WHEN 0,
                input_b_i       WHEN 2 | 5,    -- choice separator
                input_c_i       WHEN 6 TO 9,   -- choice range
                (OTHERS => '0') WHEN OTHERS;
END ARCHITECTURE behavioral;
```

| `select_i` | `result_o` |
| --- | --- |
| 0 | `input_a_i` |
| 2, 5 | `input_b_i` |
| 6, 7, 8, 9 | `input_c_i` |
| 1, 3, 4, 10 to 15 | `"0000"` |

---

[← Back to the Solutions index](../README.md)
