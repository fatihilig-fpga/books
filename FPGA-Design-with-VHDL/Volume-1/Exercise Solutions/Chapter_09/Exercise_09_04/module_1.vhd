LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    input_a_i   : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    input_b_i   : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    input_c_i   : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
    request_a_i : IN STD_LOGIC := '0';
    request_b_i : IN STD_LOGIC := '0';
    result_o    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- The first TRUE condition wins: request_a_i has the highest priority.
  result_o <= input_a_i WHEN request_a_i = '1' ELSE
              input_b_i WHEN request_b_i = '1' ELSE
              input_c_i;
END ARCHITECTURE behavioral;
