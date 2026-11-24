LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
  PORT (
    -- Inputs 
    a_i : IN STD_LOGIC := '1';
    b_i : IN STD_LOGIC := '0';
    c_i : IN STD_LOGIC := '0';
    --  output
    result_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS

BEGIN
  -- Concurrent form
  result_o <= a_i AND (b_i OR c_i);



END ARCHITECTURE behavioral;
