LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  CONSTANT pulse_start_time_c : TIME := 20 ns;
  CONSTANT num_of_cycle_c: INTEGER:= 2;
  CONSTANT high_time_c : TIME := 10 ns; 
  CONSTANT low_time_c : TIME := 10 ns; 
  SIGNAL pulse_s : STD_LOGIC := '0'; -- initialize to 0
BEGIN
  p_simulation : PROCESS
    VARIABLE cycle_v : INTEGER;
  BEGIN
    cycle_v := 0;

    WAIT FOR pulse_start_time_c;

    WHILE cycle_v < num_of_cycle_c LOOP
      pulse_s <= '1';
      WAIT FOR high_time_c;

      pulse_s <= '0';
      WAIT FOR low_time_c;

      cycle_v := cycle_v + 1;
    END LOOP;

    WAIT;
  END PROCESS p_simulation;
END ARCHITECTURE behavioral;
