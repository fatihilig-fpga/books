LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Integer signal that stores the value we want to convert
  SIGNAL data_s : INTEGER := 25;
  -- 8-bit unsigned signal that will store the converted value
  SIGNAL count_s : UNSIGNED(7 DOWNTO 0);
BEGIN
  -- Convert data_s from INTEGER to UNSIGNED. count_s'LENGTH tells TO_UNSIGNED how many bits the 
  -- result should have. Since count_s is 8 bits, TO_UNSIGNED creates an 8-bit unsigned value.
  count_s <= TO_UNSIGNED(data_s, count_s'LENGTH);
END ARCHITECTURE behavioral;
