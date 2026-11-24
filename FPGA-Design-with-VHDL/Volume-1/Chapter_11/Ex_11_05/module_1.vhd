LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    a_i     : IN STD_LOGIC := '0';
    b_i     : IN STD_LOGIC := '0';
    c_i     : IN STD_LOGIC := '1';
    sel_1_i : IN STD_LOGIC := '1';
    sel_2_i : IN STD_LOGIC := '1';
    mux_o   : OUT STD_LOGIC
  );
END ENTITY MODULE_1;

ARCHITECTURE RTL OF MODULE_1 IS

BEGIN

  p_mux : PROCESS (a_i, b_i, sel_1_i,sel_2_i) IS
  BEGIN
    IF (sel_1_i AND sel_2_i) = '1' THEN
      mux_o <= a_i AND c_i;
    ELSE
      mux_o <= b_i OR c_i;
    END IF;
  END PROCESS p_mux;

END ARCHITECTURE RTL;
