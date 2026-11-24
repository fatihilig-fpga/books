LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Simulation input signals
  SIGNAL a : STD_LOGIC;
  SIGNAL b : STD_LOGIC;
  -- Clock signals
  SIGNAL clk_s      : STD_LOGIC;
  SIGNAL clk_slow_s : STD_LOGIC := '0';
BEGIN
  -- Stimulus process
  -- This process has no sensitivity list.
  p_stimulus : PROCESS
  BEGIN
    a <= '1';
    b <= '1';
    WAIT FOR 10 ns;
    a <= '1';
    b <= '0';
    WAIT FOR 20 ns;
    -- Suspend the process indefinitely
    WAIT;
    a <= '0';
    b <= '1';
    WAIT FOR 5 ns;
  END PROCESS p_stimulus;
  -- Clock generation process
  -- Generates a clock with a 10 ns period.
  p_sens : PROCESS
  BEGIN
    clk_s <= '1';
    WAIT FOR 5 ns;
    clk_s <= '0';
    WAIT FOR 5 ns;
  END PROCESS p_sens;
  -- Clocked process
  -- Toggles clk_slow_s on every rising edge of clk_s.
  p_seq_logic : PROCESS (clk_s)
  BEGIN
    IF rising_edge(clk_s) THEN
      clk_slow_s <= NOT clk_slow_s;
    END IF;
  END PROCESS p_seq_logic;

END ARCHITECTURE behavioral;
