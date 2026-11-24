LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL clock_loop_s : STD_LOGIC;
  SIGNAL reset_s      : STD_LOGIC;
BEGIN
  -- Simulation stimulus
  p_stimulus : PROCESS
  BEGIN
    reset_s <= '0';
    WAIT FOR 20 ns;
    reset_s <= '1';
    WAIT FOR 100 ns;
    reset_s <= '0';
    WAIT;
  END PROCESS p_stimulus;
  -- -------------------------------
  -- FOCUS ON THIS PART
  -- Generating 100 MHz Clock
  p_clock_100MHz : PROCESS
  BEGIN

    LOOP
      clock_loop_s <= '0';
      WAIT FOR 5 ns;
      clock_loop_s <= '1';
      WAIT FOR 5 ns;

      IF reset_s = '1' THEN
        EXIT;
      END IF;

    END LOOP;

    -- Keep the clock LOW while reset is active
    WHILE reset_s = '1' LOOP
      clock_loop_s <= '0';
      WAIT FOR 5 ns;
    END LOOP;

  END PROCESS p_clock_100MHz;
  -- -------------------------------
END ARCHITECTURE behavioral;
