-- Requires VHDL-2008
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
  -- No input or output ports are 
  -- needed in this example.
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal input signals
  SIGNAL a_s : STD_LOGIC := '0';
  SIGNAL b_s : STD_LOGIC := '0';
  SIGNAL c_s : STD_LOGIC := '0';
  -- Internal signals used between processes
  SIGNAL out1_s : STD_LOGIC;
  SIGNAL out2_s : STD_LOGIC;
  SIGNAL out3_s : STD_LOGIC;
  SIGNAL out4_s : STD_LOGIC;
BEGIN
  -- --------------------------------------
  -- DO NOT WORRY ABOUT THIS PROCESS YET.
  p_stimulus: PROCESS BEGIN
    -- After 10 ns, change a_s to '1'
    WAIT FOR 10 NS;
    a_s <= '1';
    -- After another 5 ns, change b_s to '1'
    WAIT FOR 5 NS;
    b_s <= '1';
    -- After another 5 ns, change c_s to '1'
    WAIT FOR 5 NS;
    c_s <= '1';
    -- After another 10 ns, 
    -- change a_s back to '0'
    WAIT FOR 10 NS;
    a_s <= '0';
    -- Stop this process here
    WAIT;
  END PROCESS p_stimulus;
  -- --------------------------------------
  -- MAIN SECTION TO FOCUS ON
  -- Processes communicate through signals.
  -- Process 1 - Produces out1_s
  p_process_1 : PROCESS (ALL) BEGIN
    out1_s <= a_s AND b_s;
    out4_s <= a_s OR b_s;
  END PROCESS p_process_1;
  -- Process 2 - Reads out1_s from Process 1
  -- and produces out2_s
  p_process_2 : PROCESS (ALL) BEGIN
    out2_s <= out1_s OR c_s;
  END PROCESS p_process_2;
  -- Process 3: Reads out2_s from Process 2
  -- and produces out3_s
  p_process_3 : PROCESS (ALL) BEGIN
    out3_s <= (NOT out2_s) AND out4_s;
  END PROCESS p_process_3;
END ARCHITECTURE behavioral;
