LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Example 8-bit signal
  SIGNAL data_s : STD_LOGIC_VECTOR(7 DOWNTO 0) := x"42";
  -- This integer signal stores the length of data_s.
  SIGNAL data_length_s : INTEGER;
  -- This signal uses data_s'LENGTH to automatically match the size of data_s.
  SIGNAL data_copy_s : STD_LOGIC_VECTOR(data_s'LENGTH - 1 DOWNTO 0);
BEGIN
  -- data_s'LENGTH returns the number of elements in data_s.
  -- For STD_LOGIC_VECTOR(7 DOWNTO 0), the length is 8.
  data_length_s <= data_s'LENGTH;
  -- Copy data_s into data_copy_s.
  -- data_copy_s is also 8 bits because it uses data_s'LENGTH.
  data_copy_s <= data_s;
END ARCHITECTURE behavioral;
