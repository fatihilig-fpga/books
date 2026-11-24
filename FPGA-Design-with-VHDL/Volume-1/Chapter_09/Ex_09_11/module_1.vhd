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
  -- Select input_a_i when sel_i = '0'.
  -- Otherwise, select input_b_i.
  result_s <= input_a_i WHEN sel_i = '0' ELSE
              input_b_i;

  -- Connect the selected value to the output port
  result_o <= result_s;
END ARCHITECTURE behavioral;
