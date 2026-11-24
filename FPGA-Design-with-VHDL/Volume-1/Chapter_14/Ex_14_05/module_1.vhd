LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    a_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    b_i : IN STD_LOGIC;
    g_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  PROCESS (a_i, b_i) 
   VARIABLE C_v:STD_LOGIC_VECTOR(4 DOWNTO 0);
  BEGIN
      C_v(0) := b_i;
      C_v(1) := a_i(0) XOR C_v(0);
      C_v(2) := a_i(1) XOR C_v(1);
      C_v(3) := a_i(2) XOR C_v(2);
      C_v(4) := a_i(3) XOR C_v(3);
    
      g_o <= C_v(4);
  END PROCESS;
END ARCHITECTURE behavioral;
