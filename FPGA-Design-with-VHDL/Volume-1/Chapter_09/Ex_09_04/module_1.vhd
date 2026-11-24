LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-- Entity declaration
ENTITY MODULE_1 IS
  PORT (
    -- Data inputs
    input_a_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    input_b_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    input_c_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
    input_d_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";

    -- Select input
    sel_i : IN STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";

    -- Selected output
    mux_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;
-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- Select one input according to sel_i
  WITH sel_i SELECT
    mux_o <= input_a_i WHEN "00",
             input_b_i WHEN "01",
             input_c_i WHEN "10",
             input_d_i WHEN OTHERS;
END ARCHITECTURE behavioral;
