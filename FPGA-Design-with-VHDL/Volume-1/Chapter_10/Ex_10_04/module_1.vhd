LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-- Entity declaration
ENTITY MODULE_1 IS
PORT (
   a_i : IN STD_LOGIC;
   b_i : IN STD_LOGIC;
   y_o : OUT STD_LOGIC;
   z_o : OUT STD_LOGIC
);
END ENTITY MODULE_1;
-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
 p_logic: PROCESS (a_i) BEGIN
    -- AND operation
    y_o <= a_i AND b_i;
    -- OR operation
    z_o <= a_i OR b_i;
  END PROCESS p_logic;
END ARCHITECTURE behavioral;
