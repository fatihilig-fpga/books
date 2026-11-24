LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Signals used for this simulation example.
  SIGNAL clk_i   : STD_LOGIC := '0'; -- Clock signal.
  SIGNAL reset_i : STD_LOGIC;        -- Synchronous reset signal.
  SIGNAL d_i     : STD_LOGIC;        -- Serial data input.
  SIGNAL q_o     : STD_LOGIC;        -- Serial data output.
  -- Internal signals representing the four shift-register stages.
  SIGNAL stage_1_s : STD_LOGIC;
  SIGNAL stage_2_s : STD_LOGIC;
  SIGNAL stage_3_s : STD_LOGIC;
  SIGNAL stage_4_s : STD_LOGIC;
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION
  PROCESS BEGIN -- Generate the input signals required for the simulation.
    -- Start with d_i at '0' and activate the reset.
    d_i     <= '0';
    reset_i <= '1';
    -- Keep the reset active for two rising edges.
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    -- Release the reset.
    reset_i <= '0';
    -- Change d_i to '1' after a falling edge so that it is stable before the next rising edge.
    WAIT UNTIL falling_edge(clk_i);
    d_i <= '1';
    -- Return d_i to '0' after the next falling edge.
    WAIT UNTIL falling_edge(clk_i);
    d_i <= '0';
    WAIT;
  END PROCESS;
  -- Generate the clock for simulation. clk_i changes every 5 ns, giving a 10 ns clock period.
  clk_i <= NOT clk_i AFTER 5 ns;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART Four-stage shift register. At each rising edge of clk_i, the stored data 
  -- moves forward by one register stage.
  p_shift_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Synchronous reset: Clear all four register stages when reset_i is '1'.
      IF reset_i = '1' THEN
        stage_1_s <= '0';
        stage_2_s <= '0';
        stage_3_s <= '0';
        stage_4_s <= '0';
      ELSE
        -- Shift the data one stage forward.
        stage_1_s <= d_i;
        stage_2_s <= stage_1_s;
        stage_3_s <= stage_2_s;
        stage_4_s <= stage_3_s;
      END IF;
    END IF;
  END PROCESS p_shift_register;
  q_o <= stage_4_s; -- Connect the final stage of the shift register to the output.
END ARCHITECTURE behavioral;
