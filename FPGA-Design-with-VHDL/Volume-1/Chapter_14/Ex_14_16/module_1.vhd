LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  GENERIC (
    change_simulation_g : INTEGER RANGE 1 TO 10 := 1
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL enable_s : STD_LOGIC;
  SIGNAL result_s : INTEGER RANGE 0 TO 4;
BEGIN
  -- -------------------------------
  -- SIMULATION-ONLY SECTION.
  PROCESS BEGIN
    FOR I IN 0 TO change_simulation_g - 1 LOOP
      enable_s <= '0';
      WAIT FOR 10 NS;
      enable_s <= '1';
      WAIT FOR 10 NS;
      enable_s <= '0';
      WAIT FOR 20 NS;
    END LOOP;
    WAIT;
  END PROCESS;
  -- -------------------------------
  -- FOCUS ON THIS PART
  p_while_counter : PROCESS (enable_s)
    VARIABLE count_v : INTEGER RANGE 0 TO 4;
  BEGIN
    IF enable_s = '1' THEN
      WHILE count_v < 4 LOOP
        count_v := count_v + 1;
      END LOOP;
    ELSE
      count_v := 0;
    END IF;

    result_s <= count_v;
  END PROCESS p_while_counter;

END ARCHITECTURE behavioral;
