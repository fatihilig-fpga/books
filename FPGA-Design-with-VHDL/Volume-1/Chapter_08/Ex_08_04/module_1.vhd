LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
  PORT (
    -- Two-bit unsigned input ports
    data_a_i : IN UNSIGNED(1 DOWNTO 0) := "01";
    data_b_i : IN UNSIGNED(1 DOWNTO 0) := "10";
    -- Output result ports
    equal_o  : OUT STD_LOGIC;
    a_lt_b_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;
--
ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- Drive equal_o high when both input values are equal.
  equal_o <= '1' WHEN data_a_i = data_b_i ELSE '0';
  -- Drive a_lt_b_o high when data_a_i is less than data_b_i.
  a_lt_b_o <= '1' WHEN data_a_i < data_b_i ELSE '0';
END ARCHITECTURE behavioral;
