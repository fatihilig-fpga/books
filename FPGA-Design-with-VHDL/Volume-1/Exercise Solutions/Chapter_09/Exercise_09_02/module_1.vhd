LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    input_a_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    input_b_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    sel_i     : IN STD_LOGIC := '0';
    result_o  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- Select input_a_i when sel_i = '0'. Otherwise, select input_b_i.
  result_o <= input_a_i WHEN sel_i = '0' ELSE input_b_i;
END ARCHITECTURE behavioral;
