LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Example 8-bit signal using TO direction
  SIGNAL addr_s : STD_LOGIC_VECTOR(0 TO 7);
  -- Integer signals used to store attribute values
  SIGNAL left_index_s  : INTEGER;
  SIGNAL right_index_s : INTEGER;
  SIGNAL high_index_s  : INTEGER;
  SIGNAL low_index_s   : INTEGER;
BEGIN
  -- addr_s'LEFT returns the index written on the left side of the range.
  -- For STD_LOGIC_VECTOR(0 TO 7), this is 0.
  left_index_s <= addr_s'LEFT;
  -- addr_s'RIGHT returns the index written on the right side of the range.
  -- For STD_LOGIC_VECTOR(0 TO 7), this is 7.
  right_index_s <= addr_s'RIGHT;
  -- addr_s'HIGH returns the numerically largest index.
  -- For STD_LOGIC_VECTOR(0 TO 7), this is 7.
  high_index_s <= addr_s'HIGH;
  -- addr_s'LOW returns the numerically smallest index.
  -- For STD_LOGIC_VECTOR(0 TO 7), this is 0.
  low_index_s <= addr_s'LOW;
END ARCHITECTURE behavioral;
