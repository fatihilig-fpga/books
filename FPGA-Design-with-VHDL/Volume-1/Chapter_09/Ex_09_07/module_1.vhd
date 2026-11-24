LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration
ENTITY MODULE_1 IS
  PORT (
    -- Data inputs
    input_a_i : IN STD_LOGIC := '0';
    input_b_i : IN STD_LOGIC := '1';
    input_c_i : IN STD_LOGIC := '0';
    input_d_i : IN STD_LOGIC := '1';
    input_e_i : IN STD_LOGIC := '1';
    input_f_i : IN STD_LOGIC := '1';
    input_g_i : IN STD_LOGIC := '0';
    input_h_i : IN STD_LOGIC := '1';
    -- Select input
    sel_i : IN STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
    -- Selected output
    result_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;
-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- Select one input according to the value of sel_i
  WITH sel_i SELECT
    result_o <= input_a_i WHEN "000",
                input_b_i WHEN "001",
                input_c_i WHEN "010",
                input_d_i WHEN "011",
                input_e_i WHEN "100",
                input_f_i WHEN "101",
                input_g_i WHEN "110",
                input_h_i WHEN OTHERS;
END ARCHITECTURE behavioral;
