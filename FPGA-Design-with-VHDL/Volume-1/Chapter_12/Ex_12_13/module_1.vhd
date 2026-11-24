LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signal that stores the register value.
  SIGNAL dq_s : STD_LOGIC;
  -- Signals used for this simulation example.
  SIGNAL clk_i   : STD_LOGIC := '0'; -- Clock signal.
  SIGNAL reset_i : STD_LOGIC;        -- Asynchronous reset signal.
  SIGNAL d_i     : STD_LOGIC;        -- Data input.
  SIGNAL q_o     : STD_LOGIC;        -- Register output.
BEGIN
  -- SIMULATION-ONLY SECTION. 
  -- This section is used only to generate input values for simulation.
  PROCESS BEGIN
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
  -- FOCUS ON THIS PART: Clocked process with an asynchronous reset.
  -- The process wakes up whenever clk_i or reset_i changes.
  p_register : PROCESS (clk_i, reset_i) IS
  BEGIN
    -- Asynchronous reset: If reset_i is '1', clear the register immediately.
    -- There is no need to wait for a rising edge of clk_i.
    IF reset_i = '1' THEN
      dq_s <= '0';
    -- Normal clocked operation: If reset_i is not active, check for a rising edge of clk_i.
    ELSIF rising_edge(clk_i) THEN
      -- Feedback operation: The previous value of dq_s is ORed with d_i.
      -- The result is stored back into dq_s.
      dq_s <= dq_s OR d_i;
    END IF;
  END PROCESS p_register;

  -- Connect the stored value of dq_s to the output.
  q_o <= dq_s;
END ARCHITECTURE behavioral;
