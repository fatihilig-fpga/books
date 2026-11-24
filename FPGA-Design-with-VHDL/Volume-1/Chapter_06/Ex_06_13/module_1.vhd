LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE sim OF MODULE_1 IS
  TYPE t_Matrix IS ARRAY (0 TO 3, 0 TO 7) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
  -- Initialize every element of matrix_s to x"0000".
  -- x"0000" represents a 16-bit hexadecimal value of all zeros.
  SIGNAL matrix_s : t_Matrix := (OTHERS => (OTHERS => x"0000"));
  -- The same initialization could also be written in binary:
  -- SIGNAL matrix_s : t_Matrix := (OTHERS => (OTHERS => "0000000000000000"));
BEGIN
  matrix_s(1, 3) <= x"00ab";
END ARCHITECTURE sim;
