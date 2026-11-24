LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- 8-bit unsigned input signals
  SIGNAL data_a_s : UNSIGNED(7 DOWNTO 0) := "00001010"; -- decimal 10
  SIGNAL data_b_s : UNSIGNED(7 DOWNTO 0) := "00001100"; -- decimal 12
  -- Output result signals
  SIGNAL equal_s  : STD_LOGIC;
  SIGNAL a_lt_b_s : STD_LOGIC;
BEGIN
  -- The WHEN/ELSE construct is a concurrent assignment. 
  -- Assign equal_s high when both values are the same
  equal_s <= '1' WHEN data_a_s = data_b_s ELSE '0';
  -- Assign a_lt_b_s high when data_a_s is less than data_b_s
  a_lt_b_s <= '1' WHEN data_a_s < data_b_s ELSE '0';
END ARCHITECTURE behavioral;
