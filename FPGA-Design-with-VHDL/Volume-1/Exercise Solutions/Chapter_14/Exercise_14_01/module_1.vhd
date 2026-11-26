-- Requires VHDL-2008
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL data_s       : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL ones_count_s : INTEGER RANGE 0 TO 8;
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION: apply the four test values, 10 ns each.
  p_stimulus : PROCESS
  BEGIN
    data_s <= "00000000";  WAIT FOR 10 ns;   -- expected 0
    data_s <= "00001111";  WAIT FOR 10 ns;   -- expected 4
    data_s <= "10101010";  WAIT FOR 10 ns;   -- expected 4
    data_s <= "11111111";  WAIT FOR 10 ns;   -- expected 8
    WAIT;
  END PROCESS p_stimulus;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART: count the '1' bits with a FOR loop.
  p_count_ones : PROCESS (ALL) IS
    VARIABLE count_v : INTEGER RANGE 0 TO 8;
  BEGIN
    count_v := 0;                     -- start from 0 every time the process runs
    FOR i IN 0 TO 7 LOOP
      IF data_s(i) = '1' THEN
        count_v := count_v + 1;
      END IF;
    END LOOP;
    ones_count_s <= count_v;          -- final result after all 8 bits
  END PROCESS p_count_ones;
END ARCHITECTURE behavioral;
