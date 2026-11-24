LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL data_s     : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL position_s : INTEGER RANGE 0 TO 8;
BEGIN
  -- -------------------------------
  -- SIMULATION-ONLY SECTION
  p_stimulus : PROCESS
  BEGIN
    data_s <= "00000001";
    WAIT FOR 10 ns;
    data_s <= "10000000";
    WAIT FOR 10 ns;
    data_s <= "01000100";
    WAIT FOR 10 ns;
    data_s <= "00000000";
    WAIT;
  END PROCESS p_stimulus;
  -- -------------------------------
  -- FOCUS ON THIS PART
  p_find_one : PROCESS (data_s)
    VARIABLE index_v : INTEGER RANGE 0 TO 8;
  BEGIN
    index_v := 0;
    WHILE (index_v < 8) AND (data_s(index_v) = '0') LOOP
      index_v := index_v + 1;
    END LOOP;
    position_s <= index_v;
  END PROCESS p_find_one;
END ARCHITECTURE behavioral;
