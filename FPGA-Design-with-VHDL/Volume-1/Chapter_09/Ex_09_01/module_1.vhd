LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- Entity declaration
ENTITY MODULE_1 IS
  PORT (
    -- Select signal
    sel_i : IN STD_LOGIC:= '1';
    -- Input signals
    a_i : IN STD_LOGIC := '1';
    b_i : IN STD_LOGIC := '0';
    -- Selected output
    result_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;
-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- Assign a_i when sel_i = '1'. Otherwise, assign b_i.
  result_o <= a_i WHEN sel_i = '1' ELSE b_i;
END ARCHITECTURE behavioral;
