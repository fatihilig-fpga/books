-- Requires VHDL-2008
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL data_s      : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
  SIGNAL first_one_s : INTEGER RANGE 0 TO 4;   -- 4 means "not found"
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION: apply the four test values, 10 ns each.
  p_stimulus : PROCESS
  BEGIN
    data_s <= "0001";  WAIT FOR 10 ns;   -- expected 0
    data_s <= "0100";  WAIT FOR 10 ns;   -- expected 2
    data_s <= "1010";  WAIT FOR 10 ns;   -- expected 1
    data_s <= "0000";  WAIT FOR 10 ns;   -- expected 4 (not found)
    WAIT;
  END PROCESS p_stimulus;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART: search from index 0 toward index 3.
  p_find_first : PROCESS (ALL) IS
    VARIABLE index_v : INTEGER RANGE 0 TO 4;
  BEGIN
    index_v := 4;                   -- default: no '1' found
    FOR i IN 0 TO 3 LOOP
      IF data_s(i) = '1' THEN
        index_v := i;               -- store the index of the first '1'
        EXIT;                       -- leave the loop immediately
      END IF;
    END LOOP;
    first_one_s <= index_v;
  END PROCESS p_find_first;
END ARCHITECTURE behavioral;
