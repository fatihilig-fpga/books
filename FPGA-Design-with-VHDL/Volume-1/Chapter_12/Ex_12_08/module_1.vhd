LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signal that stores the register value.
  SIGNAL dq_s : STD_LOGIC;
  -- NOTE: You have not learned testbenches yet. For now, these signals are declared here to   
  -- make the simulation example easier to follow. In the previous example, they were declared
  -- in the entity port list.
  SIGNAL clk_i   : STD_LOGIC := '0'; -- Clock input.
  SIGNAL reset_i : STD_LOGIC;        -- Reset input.
  SIGNAL d_i     : STD_LOGIC;        -- Data input.
  SIGNAL q_o     : STD_LOGIC;        -- Register output.
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION
  -- This section is used only to generate input values for simulation.
  PROCESS BEGIN
    -- Start with d_i at '0' and activate the reset.
    d_i     <= '0';
    reset_i <= '1';
    -- Keep the reset active for two rising edges. Wait for 2 clock period time.
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    -- Release the reset.
    reset_i <= '0';
    -- Change d_i after a falling edge so that it is stable before the next rising edge.
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
  -- FOCUS ON THIS PART
  -- This clocked process describes the register and its feedback.
  p_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- If reset_i is '1', clear the register.
      IF reset_i = '1' THEN
        dq_s <= '0';
      ELSE
        -- Feedback operation: The previous value of dq_s is ORed with d_i.
        -- The result is stored back into dq_s.
        dq_s <= dq_s OR d_i;
      END IF;
    END IF;
  END PROCESS p_register;

  -- Connect the stored value of dq_s to the output.
  q_o <= dq_s;

END ARCHITECTURE behavioral;
