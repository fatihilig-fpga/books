LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Simulation input signals
  SIGNAL a : STD_LOGIC;
  SIGNAL b : STD_LOGIC;
BEGIN
  -- Stimulus process
  -- This process has no sensitivity list.
  -- It starts automatically when the simulation begins.
  p_stimulus : PROCESS
  BEGIN
    -- First input combination
    a <= '1';
    b <= '1';
    -- Keep these values for 10 ns
    WAIT FOR 10 ns;
    -- Second input combination
    a <= '1';
    b <= '0';
    -- Keep these values for 20 ns
    WAIT FOR 20 ns;
    -- Third input combination
    a <= '0';
    b <= '1';
    -- Keep these values for 5 ns
    WAIT FOR 5 ns;
    -- There is no final WAIT statement here.
    -- After reaching END PROCESS, the process starts again immediately from the beginning.
  END PROCESS p_stimulus;

END ARCHITECTURE behavioral;
