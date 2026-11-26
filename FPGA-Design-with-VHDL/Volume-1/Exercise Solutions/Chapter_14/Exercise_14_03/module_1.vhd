LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL pulse_s : STD_LOGIC := '0'; -- initialize to 0
BEGIN
  -- SIMULATION-ONLY: three pulse cycles of 10 ns HIGH and 10 ns LOW.
  p_simulation : PROCESS
    VARIABLE cycle_v : INTEGER;  -- number of completed cycles
  BEGIN
    cycle_v := 0;

    WHILE cycle_v < 3 LOOP
      pulse_s <= '1';
      WAIT FOR 10 ns;            -- HIGH for 10 ns

      pulse_s <= '0';
      WAIT FOR 10 ns;            -- LOW for 10 ns

      cycle_v := cycle_v + 1;    -- one cycle completed
    END LOOP;

    WAIT;                        -- stop the process
  END PROCESS p_simulation;
END ARCHITECTURE behavioral;
