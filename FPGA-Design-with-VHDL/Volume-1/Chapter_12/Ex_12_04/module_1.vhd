-- Requires VHDL-2008
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
  PORT (
    d_i : IN STD_LOGIC; 
    q_o : OUT STD_LOGIC 
  );
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL dq_s : STD_LOGIC;
BEGIN
  p_register : PROCESS (ALL) IS BEGIN
    dq_s <= dq_s OR d_i;
  END PROCESS p_register;
  -- 
  q_o <= dq_s;
END ARCHITECTURE behavioral;
