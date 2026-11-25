-- Requires VHDL-2008
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
  -- No input or output ports are  
  -- needed in this example. Internal 
  -- signals are used only for simulation. 
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal input signals
  SIGNAL a_s : STD_LOGIC := '0';
  SIGNAL b_s : STD_LOGIC := '0';
  SIGNAL c_s : STD_LOGIC := '0';
  -- Internal output signals
  SIGNAL out1_s : STD_LOGIC;
  SIGNAL out2_s : STD_LOGIC;
  SIGNAL out3_s : STD_LOGIC;
  SIGNAL out4_s : STD_LOGIC;
  SIGNAL out5_s : STD_LOGIC;
BEGIN
  -- ------------------------------
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
    WAIT; -- Stop this process here
  END PROCESS p_stimulus;
  -- ------------------------------
  -- MAIN SECTION TO FOCUS ON
  -- 4. Second process
  p_second : PROCESS (ALL) BEGIN
    -- Sequential statement
    out3_s <= b_s XOR c_s;
  END PROCESS p_second;
  -- 3. Concurrent signal assignment
  out1_s <= a_s AND b_s;
  -- 2. First process
  p_first : PROCESS (ALL) BEGIN
    -- Sequential statement 1
    out2_s <= a_s OR c_s;
    -- Sequential statement 2
    out4_s <= NOT out2_s;
  END PROCESS p_first;
  -- 1. Concurrent signal assignment
  out5_s <= NOT out1_s;

END ARCHITECTURE behavioral;
