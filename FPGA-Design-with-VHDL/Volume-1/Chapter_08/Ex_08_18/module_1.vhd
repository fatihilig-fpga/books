LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL a_s : STD_LOGIC := '1';
  SIGNAL b_s : STD_LOGIC := '0';
  SIGNAL c_s : STD_LOGIC := '1';
  SIGNAL result_without_parentheses_s : STD_LOGIC;
  SIGNAL result_with_parentheses_s    : STD_LOGIC;
BEGIN
  -- NOT is applied only to a_s. Result: '0'
  result_without_parentheses_s <= NOT a_s AND b_s AND c_s;
  -- The AND operation is performed first. The complete AND result is then inverted.
  -- Result: '1'
  result_with_parentheses_s <= NOT (a_s AND b_s AND c_s);
END ARCHITECTURE behavioral;
