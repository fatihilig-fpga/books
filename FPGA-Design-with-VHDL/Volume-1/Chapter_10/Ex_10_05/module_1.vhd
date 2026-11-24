LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-- Entity declaration
ENTITY MODULE_1 IS
  -- No input or output ports are needed in this example.
  -- Internal signals will be used for simulation.
END ENTITY MODULE_1;
-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signals
  SIGNAL a_s : STD_LOGIC;
  SIGNAL b_s : STD_LOGIC;
  SIGNAL y_s : STD_LOGIC;
  SIGNAL z_s : STD_LOGIC;
BEGIN
  -- DO NOT WORRY ABOUT THIS PROCESS YET. WAIT FOR was introduced in Chapter 7.
  -- It is only used to change a_s and b_s during simulation.
  -- We will explain this type of process later.
  p_stimulus: PROCESS BEGIN
    -- Sequential statements are evaluated from top to bottom.
    -- Initial values
    a_s <= '0';
    b_s <= '0';
    -- After 10 ns, change a_s to '1'
    WAIT FOR 10 ns;
    a_s <= '1';
    -- After another 10 ns, change b_s to '1'
    WAIT FOR 10 ns;
    b_s <= '1';
    -- After another 10 ns, change b_s back to '0'
    WAIT FOR 10 ns;
    b_s <= '0';
    -- Stop this process here
    WAIT;
  END PROCESS p_stimulus;

  -- FOCUS ON THIS PROCESS.
  -- PROCESS(ALL) automatically includes every signal that is read inside the process.
  -- In this example, the process reads a_s and b_s.
  -- Therefore, a change in either a_s or b_s will wake up the process.
  p_logic: PROCESS (ALL) BEGIN
    -- AND operation
    y_s <= a_s AND b_s;
    -- OR operation
    z_s <= a_s OR b_s;
  END PROCESS p_logic;

END ARCHITECTURE behavioral;
