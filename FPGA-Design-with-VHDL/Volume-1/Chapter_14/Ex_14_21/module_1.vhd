LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
  GENERIC (
    data_width_g : INTEGER := 3
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL data_s     : STD_LOGIC_VECTOR(data_width_g - 1 DOWNTO 0);
  SIGNAL position_s : INTEGER RANGE 0 TO data_width_g;
BEGIN
  -- Simulation stimulus
  p_stimulus : PROCESS
  BEGIN
    -- First '1' is at index 0
    data_s <= "001";
    WAIT FOR 10 ns;
    -- First '1' is at index 3
    data_s <= "100";
    WAIT FOR 10 ns;
    -- First '1' is at index 2
    data_s <= "010";
    WAIT FOR 10 ns;
    -- Multiple '1's: search starts from index 0, so first '1' is at index 1
    data_s <= "110";
    WAIT FOR 10 ns;
    -- No '1' found
    data_s <= "000";
    WAIT FOR 10 ns;
    WAIT;
  END PROCESS p_stimulus;
  -- FOCUS ON THIS PART 
  p_find_one : PROCESS (ALL)
    VARIABLE position_v : INTEGER RANGE 0 TO data_width_g;
  BEGIN
    position_v := data_width_g;

    FOR i IN 0 TO (data_width_g - 1) LOOP
      IF data_s(i) = '1' THEN
        position_v := i;
        EXIT;
      END IF;
    END LOOP;
    position_s <= position_v;
  END PROCESS p_find_one;

END ARCHITECTURE behavioral;
