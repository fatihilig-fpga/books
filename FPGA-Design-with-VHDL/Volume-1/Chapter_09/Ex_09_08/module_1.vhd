LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration
ENTITY MODULE_1 IS
  PORT (
    -- Data inputs
    input_a_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    input_b_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    -- Select input
    sel_i : IN STD_LOGIC := '0';
    -- Outputs
    result_when_o  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    result_select_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;
-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- First concurrent statement: WHEN ... ELSE
  result_when_o <= input_a_i WHEN sel_i = '0' ELSE
                   input_b_i;
  -- Second concurrent statement: WITH ... SELECT
  WITH sel_i SELECT
    result_select_o <= input_a_i WHEN '0',
                       input_b_i WHEN OTHERS;
END ARCHITECTURE behavioral;
