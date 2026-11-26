LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- Entity declaration
ENTITY MODULE_1 IS
  -- No input or output ports are needed in this example.
  -- Internal signals will be used for simulation.
END ENTITY MODULE_1;
-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signals
  SIGNAL a_i           : STD_LOGIC;
  SIGNAL b_i           : STD_LOGIC;
  SIGNAL c_i           : STD_LOGIC;
  SIGNAL result_o      : STD_LOGIC;  -- concurrent version
  SIGNAL result_proc_o : STD_LOGIC;  -- process version
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION
  -- This process only changes a_i, b_i and c_i during simulation.
  p_stimulus : PROCESS
  BEGIN
    a_i <= '0'; b_i <= '0'; c_i <= '0';   -- 000
    WAIT FOR 10 ns;
    c_i <= '1';                           -- 001
    WAIT FOR 10 ns;
    b_i <= '1'; c_i <= '0';               -- 010
    WAIT FOR 10 ns;
    c_i <= '1';                           -- 011
    WAIT FOR 10 ns;
    a_i <= '1'; b_i <= '0'; c_i <= '0';   -- 100
    WAIT FOR 10 ns;
    c_i <= '1';                           -- 101
    WAIT FOR 10 ns;
    b_i <= '1'; c_i <= '0';               -- 110
    WAIT FOR 10 ns;
    c_i <= '1';                           -- 111
    WAIT;
  END PROCESS p_stimulus;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART
  -- Version 1: concurrent signal assignment (original).
  result_o <= a_i AND (b_i OR c_i);

  -- Version 2: the same logic described with a process.
  -- The sensitivity list contains every signal the process reads.
  p_and_or : PROCESS (a_i, b_i, c_i) IS
  BEGIN
    result_proc_o <= a_i AND (b_i OR c_i);
  END PROCESS p_and_or;
END ARCHITECTURE behavioral;
