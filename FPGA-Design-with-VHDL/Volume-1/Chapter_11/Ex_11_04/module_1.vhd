LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- Entity declaration
ENTITY MODULE_1 IS
  -- No input or output ports are needed in this example.
  -- Internal signals are used for simulation.
END ENTITY MODULE_1;
-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signals
  SIGNAL input_vector_s    : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL match_s           : STD_LOGIC;
  SIGNAL match_int_s       : INTEGER;
  SIGNAL match_std_logic_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
  ------------------------------------------------------------
  -- DO NOT WORRY ABOUT THIS PROCESS YET. NOT SYNTHESIZABLE.
  -- It is used only to generate input values for simulation.
  ------------------------------------------------------------
  p_stimulus: PROCESS BEGIN
    input_vector_s <= "0000"; -- Does not match "1010"
    WAIT FOR 10 ns;
    input_vector_s <= "0101"; -- Does not match "1010"
    WAIT FOR 10 ns;
    input_vector_s <= "1010"; -- Matches "1010"
    WAIT FOR 20 ns;
    input_vector_s <= "1111"; -- Does not match "1010"
    WAIT FOR 20 ns;
    input_vector_s <= "1010"; -- Matches "1010" again
    WAIT;
  END PROCESS p_stimulus;
  ------------------------------------------------------------
  -- FOCUS ON THIS PROCESS.
  -- The IF condition checks all four bits of input_vector_s.
  ------------------------------------------------------------
  p_vector_check : PROCESS (input_vector_s) IS
  BEGIN
    IF input_vector_s = "1010" THEN -- Check whether all 4 bits match
      match_s           <= '1';
      match_int_s       <= 10;
      match_std_logic_s <= x"FA";
    ELSE -- The condition is FALSE
      match_s           <= '0';
      match_int_s       <= 90;
      match_std_logic_s <= x"BC";
    END IF;
  END PROCESS p_vector_check;
  ------------------------------------------------------------
END ARCHITECTURE behavioral;
