LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Main address signal
  SIGNAL addr_s : STD_LOGIC_VECTOR(7 DOWNTO 0) := x"F0"; -- assign a number
  -- This signal uses the reverse range of addr_s.
  -- addr_s'RANGE is 7 DOWNTO 0.
  -- addr_s'REVERSE_RANGE is 0 TO 7.
  SIGNAL addr_reverse_s : STD_LOGIC_VECTOR(addr_s'REVERSE_RANGE);
  -- This signal also uses the reverse range of addr_s.
  -- If addr_s changes size, this signal changes automatically.
  SIGNAL addr_reverse_mask_s : STD_LOGIC_VECTOR(addr_s'REVERSE_RANGE);
BEGIN
  -- Assign the same value to addr_reverse_s.
  -- The bit values are copied, but the index direction is reversed.
  addr_reverse_s <= addr_s;
  -- Create a mask with the same size as addr_s, but using the reverse index range.
  addr_reverse_mask_s <= "11110000";
END ARCHITECTURE behavioral;
