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
  SIGNAL C : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN

  C(0) <= b_i;

  C(1) <= a_i(0) XOR C(0);
  C(2) <= a_i(1) XOR C(1);
  C(3) <= a_i(2) XOR C(2);
  C(4) <= a_i(3) XOR C(3);

  g_o <= C(4);
END ARCHITECTURE behavioral;
