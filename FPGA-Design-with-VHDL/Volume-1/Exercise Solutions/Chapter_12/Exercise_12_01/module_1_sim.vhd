LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- NOTE: These signals are declared here to make the simulation example easier to follow.
  -- In the design version, they are declared in the entity port list.
  SIGNAL clk_i   : STD_LOGIC := '0'; -- Clock input.
  SIGNAL reset_i : STD_LOGIC;        -- Synchronous reset input.
  SIGNAL d_i     : STD_LOGIC;        -- Data input.
  SIGNAL q_o     : STD_LOGIC;        -- Register output.
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION
  -- This section is used only to generate input values for simulation.
  PROCESS BEGIN
    -- Start with d_i at '1' and activate the reset. The reset must win.
    d_i     <= '1';
    reset_i <= '1';
    -- Keep the reset active for two rising edges.
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    -- Release the reset. q_o now follows d_i at each rising edge.
    reset_i <= '0';
    -- Change d_i after a falling edge so that it is stable before the next rising edge.
    WAIT UNTIL falling_edge(clk_i);
    WAIT UNTIL falling_edge(clk_i);
    d_i <= '0';
    WAIT UNTIL falling_edge(clk_i);
    d_i <= '1';
    WAIT;
  END PROCESS;
  -- Generate the clock for simulation. clk_i changes every 5 ns, giving a 10 ns clock period.
  clk_i <= NOT clk_i AFTER 5 ns;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART
  p_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        q_o <= '0';
      ELSE
        q_o <= d_i;
      END IF;
    END IF;
  END PROCESS p_register;
END ARCHITECTURE behavioral;
