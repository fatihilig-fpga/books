LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- PYNQ-Z1 (125 MHz clock):
  -- 12,500,000 clock cycles = 0.1 seconds.
  CONSTANT C_MAX_COUNT : INTEGER := 12_499_999;
  -- Basys 3 / Arty A7 (100 MHz clock): use this line instead, and also
  -- change the simulation clock below to AFTER 5 ns.
  -- CONSTANT C_MAX_COUNT : INTEGER := 9_999_999;
  SIGNAL clk_s   : STD_LOGIC := '0';
  SIGNAL reset_s : STD_LOGIC := '1';
  SIGNAL count_s : INTEGER RANGE 0 TO C_MAX_COUNT := 0;
  SIGNAL led_s   : STD_LOGIC := '0';
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION: Generate a clock with an 8 ns period (125 MHz clock)
  clk_s <= NOT clk_s AFTER 4 ns;
  -- Basys 3 / Arty A7: use a 10 ns period (100 MHz clock) instead.
  -- clk_s <= NOT clk_s AFTER 5 ns;

  p_stimulus : PROCESS
  BEGIN
    -- Keep reset active for two rising edges.
    reset_s <= '1';
    WAIT UNTIL rising_edge(clk_s);
    WAIT UNTIL rising_edge(clk_s);
    -- Release reset.
    reset_s <= '0';
    -- Allow the design to continue running.
    WAIT;
  END PROCESS p_stimulus;
  -- SYNTHESIZABLE LED BLINK LOGIC
  p_led_blink : PROCESS (clk_s) IS
  BEGIN
    IF rising_edge(clk_s) THEN
      IF reset_s = '1' THEN
        count_s <= 0;
        led_s   <= '0';
      ELSE
        IF count_s = C_MAX_COUNT THEN
          count_s <= 0;
          led_s   <= NOT led_s;
        ELSE
          count_s <= count_s + 1;
        END IF;
      END IF;
    END IF;
  END PROCESS p_led_blink;
END ARCHITECTURE behavioral;
