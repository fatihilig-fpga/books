LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- count_s is an integer signal. It can store whole numbers such as 0, 1, 25, or 100.
  SIGNAL count_s : INTEGER;
  -- offset_s is another integer signal. It can also store negative whole numbers.
  SIGNAL offset_s : INTEGER;

  -- CLK_FREQ is an integer constant. Constants are useful when a value should not change.
  CONSTANT CLK_FREQ : INTEGER := 100_000_000; -- same as writing 100000000;
  -- Underscores can be used in large numbers to improve readability. 
BEGIN
  -- Assign a positive whole number to count_s.
  count_s <= 25;
  -- Assign a negative whole number to offset_s.
  offset_s <= - 10;
END ARCHITECTURE sim;
