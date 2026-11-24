LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL a_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL y_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
  -- -------------------------------
  -- SIMULATION-ONLY SECTION. 
  -- Do not focus on this part yet.
  p_stimulus : PROCESS
  BEGIN
    -- Test 1
    a_s <= "00001111";
    WAIT FOR 10 ns;
    -- Test 2
    a_s <= "10101010";
    WAIT FOR 10 ns;
    -- Test 3
    a_s <= "00110011";
    WAIT FOR 10 ns;
    -- End simulation
    WAIT;
  END PROCESS p_stimulus;
  -- -------------------------------
  -- FOCUS ON THIS PART
  PROCESS (a_s)
  BEGIN
    FOR k IN 0 TO 7 LOOP
      y_s(k) <= NOT a_s(k);
    END LOOP;
  END PROCESS;
  -- -------------------------------
END ARCHITECTURE behavioral;
