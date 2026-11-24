LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL data_s  : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL count_s : INTEGER;
BEGIN
  -- -------------------------------
  -- SIMULATION-ONLY SECTION.
  p_stimulus : PROCESS
  BEGIN
    -- Test 1
    data_s <= "0001";
    WAIT FOR 10 ns;
    -- Test 2
    data_s <= "1011";
    WAIT FOR 10 ns;
    -- Test 3
    data_s <= "1111";
    WAIT FOR 10 ns;
    -- End simulation
    WAIT;
  END PROCESS p_stimulus;
  -- -------------------------------
  -- FOCUS ON THIS PART
  p_count_ones_reverse_range : PROCESS (data_s)
    VARIABLE v_count : INTEGER;
  BEGIN
    v_count := 0;
    --
    FOR i IN data_s'REVERSE_RANGE LOOP
      IF data_s(i) = '1' THEN
        v_count := v_count + 1;
      END IF;
    END LOOP;
    --
    count_s <= v_count;
  END PROCESS p_count_ones_reverse_range;
  -- -------------------------------
END ARCHITECTURE behavioral;
