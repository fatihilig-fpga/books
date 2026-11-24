LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Example 8-bit unsigned value
  SIGNAL value_s : UNSIGNED(7 DOWNTO 0) := "00001100"; -- Decimal 12
  -- Result signals
  SIGNAL value_mul2_s : UNSIGNED(7 DOWNTO 0);
  SIGNAL value_mul4_s : UNSIGNED(7 DOWNTO 0);
  SIGNAL value_div2_s : UNSIGNED(7 DOWNTO 0);
  SIGNAL value_div4_s : UNSIGNED(7 DOWNTO 0);
BEGIN
  -- Multiply by 2: Keep bits 6 DOWNTO 0 and add one zero on the right. Bit 7 is discarded.
  value_mul2_s <= value_s(6 DOWNTO 0) & '0';
  -- Multiply by 4: Keep bits 5 DOWNTO 0 and add two zeros on the right.
  -- Bits 7 and 6 are discarded.
  value_mul4_s <= value_s(5 DOWNTO 0) & "00";
  -- Divide by 2: Add one zero on the left and keep bits 7 DOWNTO 1. Bit 0 is discarded.
  value_div2_s <= '0' & value_s(7 DOWNTO 1);
  -- Divide by 4: Add two zeros on the left and keep bits 7 DOWNTO 2.Bits 1 and 0 are discarded.
  value_div4_s <= "00" & value_s(7 DOWNTO 2);
END ARCHITECTURE behavioral;
