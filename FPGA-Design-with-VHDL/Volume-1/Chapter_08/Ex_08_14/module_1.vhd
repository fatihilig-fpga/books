LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Example 8-bit unsigned value
  SIGNAL value_s : UNSIGNED(7 DOWNTO 0) := "00001100"; -- decimal 12
  -- Result signals
  SIGNAL value_mul2_s : UNSIGNED(7 DOWNTO 0);
  SIGNAL value_mul4_s : UNSIGNED(7 DOWNTO 0);
  SIGNAL value_div2_s : UNSIGNED(7 DOWNTO 0);
  SIGNAL value_div4_s : UNSIGNED(7 DOWNTO 0);
BEGIN
  -- Multiply by 2: Shift left by 1 position (2**1). A zero enters from the right.
  value_mul2_s <= value_s SLL 1;
  -- Multiply by 4: Shift left by 2 positions (2**2).
  value_mul4_s <= value_s SLL 2;
  -- Divide by 2 for an unsigned value: Shift right by 1 position. A zero enters from the left.
  -- The fractional part, if any, is lost because the dropped bit is removed.
  value_div2_s <= value_s SRL 1;
  -- Divide by 4 for an unsigned value: Shift right by 2 positions.
  -- The fractional part, if any, is lost because the dropped bit is removed.
  value_div4_s <= value_s SRL 2;
END ARCHITECTURE behavioral;
