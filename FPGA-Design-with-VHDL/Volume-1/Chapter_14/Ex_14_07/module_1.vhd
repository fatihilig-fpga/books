LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL a_i : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL b_i : STD_LOGIC;
  SIGNAL g_o : STD_LOGIC;
BEGIN
  -- -------------------------------
  -- SIMULATION-ONLY SECTION. 
  p_stimulus : PROCESS
  BEGIN
    -- Test 1
    a_i <= "0000";
    b_i <= '0';
    WAIT FOR 10 ns;
    -- Test 2
    a_i <= "1011";
    b_i <= '0';
    WAIT FOR 10 ns;
    -- Test 3
    a_i <= "1011";
    b_i <= '1';
    WAIT FOR 10 ns;
    -- End simulation
    WAIT;
  END PROCESS p_stimulus;
  -- -------------------------------
  -- FOCUS ON THIS PART
  p_xor : PROCESS (a_i, b_i)
    VARIABLE C :STD_LOGIC_VECTOR(4 DOWNTO 0);
  BEGIN
    C(0) := b_i;
    FOR i IN 0 TO 3 LOOP
      C(i + 1) := a_i(i) XOR C(i);
    END LOOP;
    g_o <= C(4);
  END PROCESS p_xor;
  -- -------------------------------
END ARCHITECTURE behavioral;
