LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL D_s     : STD_LOGIC  := '0';
  SIGNAL clk_s   : STD_LOGIC  := '0';
  SIGNAL s_count:UNSIGNED(3 DOWNTO 0):= x"0";
BEGIN
  -------------------------------------------
  -- Simulation-only trigger
  D_s <= '1' AFTER 10 ns, '0' AFTER 20 ns;
  -- Generate the clock for simulation.
  clk_s <= NOT clk_s AFTER 5 ns;
  -------------------------------------------
  -- PROCESS : Variable
  p_variable : PROCESS (clk_s)
    VARIABLE v_c:UNSIGNED(3 DOWNTO 0):= x"0";
  BEGIN
    IF (rising_edge(clk_s)) THEN
      v_c (0)          := D_s;
      v_c (3 DOWNTO 1) := v_c(2 DOWNTO 0);
    END IF;
    s_count <= v_c;
  END PROCESS p_variable;
END ARCHITECTURE behavioral;
