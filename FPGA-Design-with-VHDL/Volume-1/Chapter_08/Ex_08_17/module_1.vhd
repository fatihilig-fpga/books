LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- 8-bit signed signals
  SIGNAL a_s : SIGNED(7 DOWNTO 0) := "00001010"; -- Decimal 10
  SIGNAL b_s : SIGNED(7 DOWNTO 0) := "00001100"; -- Decimal 12
  -- 9-bit signed result signal for safe subtraction
  SIGNAL diff_s : SIGNED(8 DOWNTO 0);
BEGIN
  -- Extend both signed operands to 9 bits before subtracting. resize performs sign extension 
  -- and preserves the sign. This allows diff_s to store the complete subtraction result.
  diff_s <= resize(a_s, 9) - resize(b_s, 9);
END ARCHITECTURE behavioral;
