-- Requires VHDL-2008
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  GENERIC (
    data_width : INTEGER := 3
  );
  PORT (
    data_i     : IN STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
    position_o : OUT INTEGER RANGE 0 TO data_width
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN

  p_find_one : PROCESS (ALL)
    VARIABLE position_v : INTEGER RANGE 0 TO data_width;
  BEGIN
    position_v := data_width;

    FOR i IN 0 TO (data_width - 1) LOOP
      IF data_i(i) = '1' THEN
        position_v := i;
        EXIT;
      END IF;
    END LOOP;

    position_o <= position_v;

  END PROCESS p_find_one;

END ARCHITECTURE behavioral;
