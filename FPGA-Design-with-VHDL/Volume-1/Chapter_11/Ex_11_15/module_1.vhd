LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--
ENTITY MODULE_1 IS
  PORT (
    req0_i  : IN STD_LOGIC := '0';
    req1_i  : IN STD_LOGIC := '0';
    req2_i  : IN STD_LOGIC := '0';
    a_i     : IN STD_LOGIC := '0';
    b_i     : IN STD_LOGIC := '0';
    c_i     : IN STD_LOGIC := '0';
    d_i     : IN STD_LOGIC := '0';
    grant_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;
--
ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN

  grant_o <= a_i WHEN req0_i = '1' ELSE
             b_i WHEN req1_i = '1' ELSE
             c_i WHEN req2_i = '1' ELSE
             d_i;
END ARCHITECTURE behavioral;
