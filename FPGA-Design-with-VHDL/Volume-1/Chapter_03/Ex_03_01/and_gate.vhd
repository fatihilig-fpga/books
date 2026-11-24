LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- Entity declaration
ENTITY and_gate IS
  PORT (
    a_i      : IN STD_LOGIC;
    b_i      : IN STD_LOGIC;
    result_o : OUT STD_LOGIC
  );
END ENTITY and_gate;
-- Architecture body
ARCHITECTURE behavioral OF and_gate IS
BEGIN
  result_o <= a_i AND b_i;
END ARCHITECTURE behavioral;
