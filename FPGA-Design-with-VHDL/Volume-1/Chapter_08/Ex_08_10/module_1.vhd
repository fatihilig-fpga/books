LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- 8-bit unsigned signals
  SIGNAL a_s : UNSIGNED(7 DOWNTO 0) := "00001010"; -- Decimal 10
  SIGNAL b_s : UNSIGNED(7 DOWNTO 0) := "00001100"; -- Decimal 12
  -- 16-bit result signal for an 8-bit × 8-bit multiplication
  SIGNAL result_s : UNSIGNED(15 DOWNTO 0);
BEGIN
  -- Multiplying two 8-bit unsigned values can produce a result that requires up to 16 bits.
  result_s <= a_s * b_s;
END ARCHITECTURE behavioral;
