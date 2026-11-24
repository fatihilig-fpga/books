LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL pulse_s : STD_LOGIC;
BEGIN
  p_simulation : PROCESS
    VARIABLE cycle_v : INTEGER;
  BEGIN
    cycle_v := 0;

    WHILE cycle_v < 5 LOOP
      pulse_s <= '1';
      WAIT FOR 5 ns;

      pulse_s <= '0';
      WAIT FOR 5 ns;

      cycle_v := cycle_v + 1;
    END LOOP;

    WAIT;
  END PROCESS p_simulation;

END ARCHITECTURE behavioral;
