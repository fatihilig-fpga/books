-- Requires VHDL-2008
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL level_s : INTEGER RANGE 0 TO 15 := 0;
  SIGNAL code_o  : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION: step level_s through 0 to 15, 10 ns each.
  p_stimulus : PROCESS
  BEGIN
    FOR i IN 0 TO 15 LOOP
      level_s <= i;
      WAIT FOR 10 ns;
    END LOOP;
    WAIT;
  END PROCESS p_stimulus;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART
  p_level_code : PROCESS (ALL) IS
  BEGIN
    CASE level_s IS
      WHEN 0 TO 2 =>
        code_o <= "001";
      WHEN 3 | 5 =>
        code_o <= "010";
      WHEN 6 TO 9 =>
        code_o <= "011";
      WHEN OTHERS =>          -- 4 and 10 to 15
        code_o <= "111";
    END CASE;
  END PROCESS p_level_code;
END ARCHITECTURE behavioral;
