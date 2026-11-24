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

  p_xor : PROCESS (a_i, b_i)
    VARIABLE C : STD_LOGIC_VECTOR(4 DOWNTO 0);
  BEGIN

    C(0) := b_i;

    FOR i IN 0 TO 3 LOOP
      C(i + 1) := a_i(i) XOR C(i);
    END LOOP;

    g_o <= C(4);

  END PROCESS p_xor;

END ARCHITECTURE behavioral;
