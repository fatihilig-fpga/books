LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration
ENTITY MODULE_1 IS
  PORT (
    -- Data inputs
    input_a_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    input_b_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    input_c_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
    input_d_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";
    -- Select input used to choose one of the data inputs
    sel_i : IN STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
    -- Selected output
    result_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;
-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signal with the same range as result_o
  SIGNAL result_s : STD_LOGIC_VECTOR(result_o'RANGE);
BEGIN
  -- Select input_a_i when sel_i = "000".
  -- Select input_b_i when sel_i = "001".
  -- Select input_c_i when sel_i = "010".
  -- For all other sel_i values, select input_d_i.
  WITH sel_i SELECT
    result_s <= input_a_i WHEN "000",
                input_b_i WHEN "001",
                input_c_i WHEN "010",
                input_d_i WHEN OTHERS;

  -- Connect the selected value to the output port
  result_o <= result_s;
END ARCHITECTURE behavioral;
