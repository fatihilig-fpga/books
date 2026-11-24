LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- 8-bit unsigned signals
  SIGNAL a_s : UNSIGNED(7 DOWNTO 0) := "00001010"; -- Decimal 10
  SIGNAL b_s : UNSIGNED(7 DOWNTO 0) := "00001100"; -- Decimal 12
  -- 9-bit UNSIGNED result signal to hold a possible carry
  SIGNAL sum_s : UNSIGNED(8 DOWNTO 0);
  -- 9-bit STD_LOGIC_VECTOR signal for the converted result
  SIGNAL sum_slv_s : STD_LOGIC_VECTOR(8 DOWNTO 0);
BEGIN
  -- Extend both operands to 9 bits before adding them. Concatenating '0' to the left adds a  
  -- leading zero bit. This allows sum_s to store a possible carry.
  sum_s <= ('0' & a_s) + ('0' & b_s);
  -- Convert the UNSIGNED result to STD_LOGIC_VECTOR.
  sum_slv_s <= STD_LOGIC_VECTOR(sum_s);
END ARCHITECTURE behavioral;
