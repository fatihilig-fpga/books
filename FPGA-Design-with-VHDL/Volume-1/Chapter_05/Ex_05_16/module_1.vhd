LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- count_s is an integer signal. It can only store values from 0 to 255.
  SIGNAL count_s : INTEGER RANGE 0 TO 255;
BEGIN
  -- Assign a value outside the allowed range of count_s.
  count_s <= 256;
END ARCHITECTURE sim;
