# Chapter 3. Introduction to VHDL

[← Back to the Solutions index](../README.md)

**Code files for this chapter** (compiled and simulated; add them to a Vivado project like the book examples):

| Exercise | Files |
| --- | --- |
| 3.2 | [my_logic_gate.vhd](Exercise_03_02/my_logic_gate.vhd) |

## Exercise 1 - The three main sections

```vhdl
-- (1) LIBRARY SECTION: starts here ...
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- ... and ends here.

-- (2) ENTITY DECLARATION: starts here ...
ENTITY and_gate IS
  PORT (
    a_i      : IN STD_LOGIC;
    b_i      : IN STD_LOGIC;
    result_o : OUT STD_LOGIC
  );
END ENTITY and_gate;
-- ... and ends here.

-- (3) ARCHITECTURE BODY: starts here ...
ARCHITECTURE behavioral OF and_gate IS
BEGIN
  result_o <= a_i AND b_i;
END ARCHITECTURE behavioral;
-- ... and ends here.
```

- The **library section** begins at `LIBRARY IEEE;` and ends after the last `USE` clause.
- The **entity declaration** begins at `ENTITY and_gate IS` and ends at `END ENTITY and_gate;`.
- The **architecture body** begins at `ARCHITECTURE behavioral OF and_gate IS` and ends at `END ARCHITECTURE behavioral;`.

## Exercise 2 - Rename the entity

The entity name appears in three places: the `ENTITY` line, the `END ENTITY` line and the `ARCHITECTURE ... OF` line. All three must use the new name.

```vhdl
-- ============================================================
-- File    : my_logic_gate.vhd
-- Purpose : A simple 2-input AND gate (renamed entity)
-- ============================================================
-- Library
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- Entity declaration
ENTITY my_logic_gate IS
  PORT (
    a_i      : IN STD_LOGIC;
    b_i      : IN STD_LOGIC;
    result_o : OUT STD_LOGIC
  );
END ENTITY my_logic_gate;
-- Architecture body
ARCHITECTURE behavioral OF my_logic_gate IS
BEGIN
  result_o <= a_i AND b_i;
END ARCHITECTURE behavioral;
```

It is good practice to rename the file to `my_logic_gate.vhd` too, so the file name matches the entity name.

## Exercise 3 - Purpose of the architecture body

The architecture body describes what the module does inside: the logic and behavior that produce the outputs from the inputs. The entity defines only the outside connections (the ports); the architecture defines the hardware that sits between them.

---

[← Back to the Solutions index](../README.md)
