LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- count_s is an integer signal. It can only store values from 0 to 255.
  SIGNAL count_s : INTEGER RANGE 0 TO 255;
  -- offset_s is an integer signal. It can store negative and positive values from -20 to 20.
  SIGNAL offset_s : INTEGER RANGE -20 TO 20;
BEGIN
  -- Assign a value inside the allowed range of count_s.
  count_s <= 25;
  -- Assign a value inside the allowed range of offset_s.
  offset_s <= -10;
END ARCHITECTURE sim;
