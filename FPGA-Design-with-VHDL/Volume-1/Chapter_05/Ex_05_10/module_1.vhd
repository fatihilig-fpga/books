LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- data_byte_s is an 8-bit vector.
  SIGNAL data_byte_s : STD_LOGIC_VECTOR(7 DOWNTO 0):= "10101010";
BEGIN
  data_byte_s(7 DOWNTO 4) <= (OTHERS => '0');
END ARCHITECTURE sim;
