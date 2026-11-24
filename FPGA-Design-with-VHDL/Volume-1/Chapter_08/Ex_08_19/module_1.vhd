LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Example 8-bit signal
  SIGNAL data_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
  -- Integer signals used to store attribute values
  SIGNAL left_index_s  : INTEGER;
  SIGNAL right_index_s : INTEGER;
  SIGNAL high_index_s  : INTEGER;
  SIGNAL low_index_s   : INTEGER;
BEGIN
  -- data_s'LEFT returns the index written on the left side of the range.
  -- For STD_LOGIC_VECTOR(7 DOWNTO 0), this is 7.
  left_index_s <= data_s'LEFT;
  -- data_s'RIGHT returns the index written on the right side of the range.
  -- For STD_LOGIC_VECTOR(7 DOWNTO 0), this is 0.
  right_index_s <= data_s'RIGHT;
  -- data_s'HIGH returns the numerically largest index.
  -- For STD_LOGIC_VECTOR(7 DOWNTO 0), this is 7.
  high_index_s <= data_s'HIGH;
  -- data_s'LOW returns the numerically smallest index.
  -- For STD_LOGIC_VECTOR(7 DOWNTO 0), this is 0.
  low_index_s <= data_s'LOW;
END ARCHITECTURE behavioral;
