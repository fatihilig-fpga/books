LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
  -- No input or output ports are needed in this example. 
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal request signals
  SIGNAL req0_s : STD_LOGIC := '0';
  SIGNAL req1_s : STD_LOGIC := '0';
  SIGNAL req2_s : STD_LOGIC := '0';
  -- 2-bit grant result
  SIGNAL grant_s : STD_LOGIC_VECTOR(1 DOWNTO 0);
  -- Groups the three request signals together for simulation
  SIGNAL input_vector_s : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
  ------------------------------------------------------------
  -- DO NOT WORRY ABOUT THIS PROCESS YET. NOT SYNTHESIZABLE.
  -- It is used only to generate different request combinations during simulation.
  PROCESS BEGIN
    input_vector_s <= "000"; -- No request is active
    WAIT FOR 10 ns;
    input_vector_s <= "001"; -- Only req0_s is active
    WAIT FOR 10 ns;
    input_vector_s <= "011"; -- req0_s and req1_s are active
    WAIT FOR 20 ns;
    input_vector_s <= "010"; -- Only req1_s is active
    WAIT FOR 20 ns;
    input_vector_s <= "100"; -- Only req2_s is active
    WAIT;
  END PROCESS;
  -- Separate the 3-bit simulation vector into request signals
  req0_s <= input_vector_s(0);
  req1_s <= input_vector_s(1);
  req2_s <= input_vector_s(2);
  ------------------------------------------------------------
  -- FOCUS ON THIS PROCESS: Priority selection process
  -- The conditions are checked from top to bottom. The first TRUE condition determines grant_s.
  ------------------------------------------------------------
  p_grant : PROCESS (req0_s, req1_s, req2_s) IS
  BEGIN
    IF req0_s = '1' THEN
      grant_s <= "00"; -- req0_s has the highest priority
    ELSIF req1_s = '1' THEN
      grant_s <= "01"; -- req1_s has the second priority
    ELSIF req2_s = '1' THEN
      grant_s <= "10"; -- req2_s has the third priority
    ELSE
      grant_s <= "11"; -- No request is active
    END IF;
  END PROCESS p_grant;
END ARCHITECTURE behavioral;
