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
    -- Selected output
    result_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signal that stores the selected input value
  SIGNAL result_s : STD_LOGIC_VECTOR(result_o'RANGE);
BEGIN
  -- Select one input according to sel_i
  WITH sel_i SELECT
    result_s <= input_a_i WHEN '0',
                input_b_i WHEN OTHERS;

  -- Connect the selected value to the output port
  result_o <= result_s;
END ARCHITECTURE behavioral;
