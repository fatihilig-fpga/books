LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    input_a_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    input_b_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    select_i  : IN INTEGER RANGE 0 TO 15 := 0;
    result_o  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  WITH select_i SELECT
    result_o <= input_a_i       WHEN 0,
                input_b_i       WHEN 2 | 5,   -- 2 or 5
                (OTHERS => '0') WHEN OTHERS;  -- "0000" for all other values
END ARCHITECTURE behavioral;
