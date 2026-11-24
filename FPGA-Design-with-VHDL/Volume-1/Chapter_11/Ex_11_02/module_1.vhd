LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    a_i   : IN STD_LOGIC;
    b_i   : IN STD_LOGIC;
    sel_i : IN STD_LOGIC;
    mux_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;

ARCHITECTURE RTL OF MODULE_1 IS
BEGIN
  p_mux : PROCESS (a_i, b_i, sel_i) IS
  BEGIN
    IF sel_i = '0' THEN
      mux_o <= a_i;
    ELSE
      mux_o <= b_i;
    END IF;
  END PROCESS p_mux;
END ARCHITECTURE RTL;
