LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Signals used only for this simulation example.
  SIGNAL clk_i   : STD_LOGIC := '0'; -- Clock signal.
  SIGNAL reset_i : STD_LOGIC;        -- Synchronous reset signal.
  SIGNAL d_i     : STD_LOGIC;        -- Serial data input.
  SIGNAL q_o     : STD_LOGIC;        -- Serial data output.
  -- Vector representing the four stages of the shift register.
  SIGNAL stages_s : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION: This section generates the input values required for simulation.
  PROCESS BEGIN
    -- Start with d_i at '0' and activate the reset.
    d_i     <= '0';
    reset_i <= '1';
    -- Keep the reset active for two rising edges.
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    -- Release the reset.
    reset_i <= '0';
-- Wait for a falling edge, then set d_i to '1'so that it is stable before the next rising edge.
    WAIT UNTIL falling_edge(clk_i);
    d_i <= '1';
    -- Keep d_i at '1' for one clock cycle, then return it to '0' at the next falling edge.
    WAIT UNTIL falling_edge(clk_i);
    d_i <= '0';
    WAIT;
  END PROCESS;
  -- Generate the clock for simulation. clk_i changes every 5 ns, giving a 10 ns clock period.
  clk_i <= NOT clk_i AFTER 5 ns;
  -- ---------------------------------------------
  -- FOUR-STAGE SHIFT REGISTER: At each rising edge, the stored data moves forward by one stage.
  p_shift_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Synchronous reset: Clear all four stages when reset_i is '1'.
      IF reset_i = '1' THEN
        stages_s <= ((OTHERS => '0'));
      ELSE
        -- Store the current d_i value in the first stage.
        stages_s(0) <= d_i;
        -- Move the previous values of stages_s(2 DOWNTO 0)
        -- one position forward into stages_s(3 DOWNTO 1).
        stages_s(3 DOWNTO 1) <= stages_s(2 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS p_shift_register;
  -- Connect the final stage of the shift register to the output.
  q_o <= stages_s(3);
END ARCHITECTURE behavioral;
