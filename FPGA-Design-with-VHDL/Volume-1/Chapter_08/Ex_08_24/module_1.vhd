LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Main address signal
  SIGNAL addr_s : STD_LOGIC_VECTOR(7 DOWNTO 0) := x"42"; -- assign a number
  -- These signals use the same range as addr_s.
  -- If addr_s changes size, these signals change automatically.
  SIGNAL addr_copy_s : STD_LOGIC_VECTOR(addr_s'RANGE);
  SIGNAL addr_mask_s : STD_LOGIC_VECTOR(addr_s'RANGE);
BEGIN
  -- Copy addr_s into addr_copy_s
  addr_copy_s <= addr_s;
  -- Create a mask with the same size as addr_s
  addr_mask_s <= (OTHERS => '1');
END ARCHITECTURE behavioral;
