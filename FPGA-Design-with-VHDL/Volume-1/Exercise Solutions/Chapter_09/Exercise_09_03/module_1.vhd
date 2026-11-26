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
  -- The same multiplexer described with a selected signal assignment.
  WITH sel_i SELECT
    result_o <= input_a_i WHEN '0',
                input_b_i WHEN OTHERS;
END ARCHITECTURE behavioral;
