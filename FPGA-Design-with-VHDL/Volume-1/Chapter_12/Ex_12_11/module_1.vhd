LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- A 3-bit counter can represent values from 0 to 7.
  SIGNAL count_s : UNSIGNED(2 DOWNTO 0);
  -- Signals used for this simulation example.
  SIGNAL clk_i   : STD_LOGIC := '0';             -- Clock signal.
  SIGNAL reset_i : STD_LOGIC;                    -- Synchronous reset.
  SIGNAL count_o : STD_LOGIC_VECTOR(2 DOWNTO 0); -- Counter output.
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION. 
  -- This section is used only to generate input values for simulation.
  PROCESS
  BEGIN
    -- Activate the reset.
    reset_i <= '1';
    -- Keep the reset active for two rising edges.
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    -- Release the reset.
    reset_i <= '0';
    -- Allow the counter to run for 100 ns.
    WAIT FOR 100 ns;
    -- Activate the reset again.
    WAIT UNTIL falling_edge(clk_i);
    reset_i <= '1';
    WAIT;
  END PROCESS;
  -- Generate the clock for simulation.
  -- clk_i changes every 5 ns, giving a 10 ns clock period.
  clk_i <= NOT clk_i AFTER 5 ns;

  -- ---------------------------------------------
  -- FOCUS ON THIS PART
  -- This clocked process describes the counter register and its feedback operation.
  p_counter : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Clear the counter when the synchronous reset is active.
      IF reset_i = '1' THEN
        count_s <= (OTHERS => '0');
      ELSE
        -- Add 1 to the previous counter value.
        count_s <= count_s + 1;
      END IF;
    END IF;
  END PROCESS p_counter;

  -- Convert the UNSIGNED counter value to STD_LOGIC_VECTOR and connect it to the output.
  count_o <= STD_LOGIC_VECTOR(count_s);

END ARCHITECTURE behavioral;
