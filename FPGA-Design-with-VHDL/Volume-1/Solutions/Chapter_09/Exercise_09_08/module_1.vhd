LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    input_a_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    input_b_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    input_c_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
    select_i  : IN INTEGER RANGE 0 TO 15 := 0;
    result_o  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  WITH select_i SELECT
    result_o <= input_a_i       WHEN 0,
                input_b_i       WHEN 2 | 5,    -- choice separator
                input_c_i       WHEN 6 TO 9,   -- choice range
                (OTHERS => '0') WHEN OTHERS;
END ARCHITECTURE behavioral;
