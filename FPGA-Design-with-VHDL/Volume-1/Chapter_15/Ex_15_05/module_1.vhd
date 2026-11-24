LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Small value used only to make the simulation faster.
  CONSTANT C_MAX_COUNT : INTEGER := 4;
  SIGNAL clk_s         : STD_LOGIC := '0';
  SIGNAL reset_s       : STD_LOGIC := '1';
  SIGNAL count_s       : INTEGER RANGE 0 TO C_MAX_COUNT := 0;
  -- Stores the 4-bit binary counter value.
  SIGNAL led_s : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
  -- Represents the four LED outputs during simulation.
  SIGNAL led_o_s : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION
  -- Generate an 8 ns clock period. This represents the 125 MHz clock.
  clk_s <= NOT clk_s AFTER 4 ns;

  p_stimulus : PROCESS
  BEGIN
    -- Keep reset active for two rising edges.
    reset_s <= '1';
    WAIT UNTIL rising_edge(clk_s);
    WAIT UNTIL rising_edge(clk_s);
    -- Release reset.
    reset_s <= '0';
    -- Allow the counter to run for 100 rising edges.
    FOR I IN 0 TO 99 LOOP
      WAIT UNTIL rising_edge(clk_s);
    END LOOP;
    -- Apply reset again.
    reset_s <= '1';
    WAIT UNTIL rising_edge(clk_s);
    WAIT UNTIL rising_edge(clk_s);
    -- Release reset.
    reset_s <= '0';
    -- Allow the simulation to continue running.
    WAIT;
  END PROCESS p_stimulus;
  -- ---------------------------------------------

  -- Count clock cycles up to C_MAX_COUNT.
  p_counter : PROCESS (clk_s) IS
  BEGIN
    IF rising_edge(clk_s) THEN
      IF reset_s = '1' THEN
        count_s <= 0;
      ELSE
        IF count_s = C_MAX_COUNT THEN
          count_s <= 0;
        ELSE
          count_s <= count_s + 1;
        END IF;
      END IF;
    END IF;
  END PROCESS p_counter;
  -- ---------------------------------------------
  -- Increase the 4-bit LED value whenever the
  -- clock counter reaches its maximum value.
  p_led_counter : PROCESS (clk_s) IS
  BEGIN
    IF rising_edge(clk_s) THEN
      IF reset_s = '1' THEN
        led_s <= (OTHERS => '0');
      ELSE
        IF count_s = C_MAX_COUNT THEN
          led_s <= led_s + 1;
        END IF;
      END IF;
    END IF;
  END PROCESS p_led_counter;
  -- ---------------------------------------------
  -- Convert UNSIGNED to STD_LOGIC_VECTOR.
  led_o_s <= STD_LOGIC_VECTOR(led_s);
  -- ---------------------------------------------
END ARCHITECTURE behavioral;
