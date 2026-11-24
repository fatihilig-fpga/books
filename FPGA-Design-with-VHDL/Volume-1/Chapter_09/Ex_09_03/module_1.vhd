LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-- Entity declaration
ENTITY MODULE_1 IS
  GENERIC (
    -- Width of the data inputs and output
    data_width : INTEGER := 4;
    -- Width of the control vector
    control_data_width : INTEGER := 8
  );
  PORT (
    -- Data inputs
    input_a_i : IN STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0) := "0001";
    input_b_i : IN STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0) := "0010";
    input_c_i : IN STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0) := "0100";
    -- Inputs used to control the selection
    request_a_i : IN STD_LOGIC := '0';
    request_b_i : IN STD_LOGIC_VECTOR((control_data_width - 1) DOWNTO 0) := x"FA";
    -- Selected output
    result_o : OUT STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0)
  );
END ENTITY MODULE_1;
-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signal that stores the selected input value
  SIGNAL result_s : STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
BEGIN
  -- Select input_a_i when request_a_i = '1'.
  -- Otherwise, select input_b_i when request_b_i = x"FA".
  -- If neither condition is true, select input_c_i by default.
  result_s <= input_a_i WHEN request_a_i = '1' ELSE
              input_b_i WHEN request_b_i = x"FA" ELSE
              input_c_i;
  -- Connect the selected value to the output port
  result_o <= result_s;
END ARCHITECTURE behavioral;
