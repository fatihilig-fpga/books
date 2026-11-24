LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- data_byte_s is an 8-bit vector.
  SIGNAL data_byte_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
  -- address_s is a 16-bit vector.
  SIGNAL address_s : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
  -- Set every bit of data_byte_s to 0
  data_byte_s <= (OTHERS => '0');
  -- Set every bit of address_s to 1
  address_s   <= (OTHERS => '1');
END ARCHITECTURE sim;
