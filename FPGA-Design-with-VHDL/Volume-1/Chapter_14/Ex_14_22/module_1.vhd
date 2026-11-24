LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL clock_loop_s  : STD_LOGIC;
  SIGNAL clock_while_s : STD_LOGIC;
  SIGNAL clock_conc_s  : STD_LOGIC := '1';

BEGIN
  -- Generating approximately 33.33 MHz Clock
  p_clock_33MHz : PROCESS
  BEGIN
    LOOP
      clock_loop_s <= '0';
      WAIT FOR 15 ns;
      clock_loop_s <= '1';
      WAIT FOR 15 ns;
    END LOOP;
  END PROCESS p_clock_33MHz;

  -- Generating  50 MHz Clock
  p_clock_50MHz : PROCESS
  BEGIN
    WHILE (TRUE) LOOP -- always enabled
      clock_while_s <= '0';
      WAIT FOR 10 ns;
      clock_while_s <= '1';
      WAIT FOR 10 ns;
    END LOOP;
  END PROCESS p_clock_50MHz;

  -- Generating 100 MHz Clock (using concurrent signal assignment)
  clock_conc_s <= NOT clock_conc_s AFTER 5 ns;

END ARCHITECTURE behavioral;
