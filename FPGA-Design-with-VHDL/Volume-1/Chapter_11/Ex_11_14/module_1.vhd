-- Requires VHDL-2008
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
  p_grant : PROCESS (ALL) IS
  BEGIN
    IF req0_i = '1' THEN
      grant_o <= a_i; 
    ELSIF req1_i = '1' THEN
      grant_o <= b_i; 
    ELSIF req2_i = '1' THEN
      grant_o <= c_i; 
    ELSE
      grant_o <= d_i; 
    END IF;
  END PROCESS p_grant;
END ARCHITECTURE behavioral;
