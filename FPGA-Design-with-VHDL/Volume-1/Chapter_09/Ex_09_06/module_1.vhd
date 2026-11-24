LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration
ENTITY MODULE_1 IS
  PORT (
    -- Input values
    input_a_i : IN INTEGER := 1;
    input_b_i : IN INTEGER := 2;
    input_c_i : IN INTEGER := 3;
    -- Select input
    select_i : IN INTEGER := 2;
    -- Selected output
    result_o : OUT INTEGER
  );
END ENTITY MODULE_1;
-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- Select one input according to the value of select_i
  WITH select_i SELECT
    result_o <= input_a_i WHEN 0,
                input_b_i WHEN 2 | 5,
                input_c_i WHEN 6 TO 9,
                0         WHEN OTHERS;
END ARCHITECTURE behavioral;
