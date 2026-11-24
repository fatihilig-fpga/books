LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- natural_count_s is a NATURAL signal. NATURAL values can start from 0.
  -- Example values: 0, 1, 2, 3, ...
  SIGNAL natural_count_s : NATURAL;

  -- positive_count_s is a POSITIVE signal. POSITIVE values start from 1. It cannot be 0.
  -- Example values: 1, 2, 3, ...
  SIGNAL positive_count_s : POSITIVE;
BEGIN
  -- Assign 0 to the NATURAL signal. This is valid because NATURAL allows 0.
  natural_count_s <= 0;

  -- Assign 1 to the POSITIVE signal. This is valid because POSITIVE starts from 1.
  positive_count_s <= 1; 
END ARCHITECTURE sim;
