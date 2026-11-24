LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Main address signal
  -- The notation x"42" is a hexadecimal literal. For an 8-bit signal, it represents 
  -- "01000010" in binary.
  SIGNAL addr_s : STD_LOGIC_VECTOR(7 DOWNTO 0) := x"42"; -- initialize signal with hex 42
  -- These signals use the same range as addr_s.
  -- If addr_s changes size, these signals change automatically.
  SIGNAL addr_copy_s : STD_LOGIC_VECTOR(addr_s'HIGH DOWNTO addr_s'LOW); -- means (7 DOWNTO 0)
  SIGNAL addr_mask_s : STD_LOGIC_VECTOR(addr_s'HIGH DOWNTO addr_s'LOW); -- means (7 DOWNTO 0)
BEGIN
  -- Copy addr_s into addr_copy_s
  addr_copy_s <= addr_s;
  -- Create a mask with the same size as addr_s
  addr_mask_s <= (OTHERS => '1');
END ARCHITECTURE behavioral;
