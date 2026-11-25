-- Requires VHDL-2008
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
  -- No input or output ports are needed 
  -- Internal signals are used for simulation.
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal input signals
  SIGNAL a_s : STD_LOGIC := '0';
  SIGNAL b_s : STD_LOGIC := '0';
  -- Internal output signals
  SIGNAL out_s : STD_LOGIC;
  SIGNAL not_a_s : STD_LOGIC;
BEGIN
  -- DO NOT WORRY ABOUT THIS PROCESS YET.
  PROCESS BEGIN
    -- After 10 ns, change a_s to '1'
    WAIT FOR 10 NS;
    a_s <= '1';
    -- After another 10 ns, change b_s to '1'
    WAIT FOR 10 NS;
    b_s <= '1';
    -- After another 10 ns, change a_s to '0'
    WAIT FOR 10 NS;
    a_s <= '0';
    WAIT;
  END PROCESS;
  -- ------------------------------
  -- MAIN SECTION TO FOCUS ON
  p_deferred_update : PROCESS (ALL) BEGIN
    -- Sequential statement
      not_a_s <= not a_s;
      out_s <= a_s;
      out_s <= b_s;
  END PROCESS p_deferred_update;
END ARCHITECTURE behavioral;
