LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
  PORT (
    -- 4-bit unsigned input ports
    a_i : IN UNSIGNED(3 DOWNTO 0) := "1010"; -- Decimal 10
    b_i : IN UNSIGNED(3 DOWNTO 0) := "1100"; -- Decimal 12
    -- 8-bit output port for the complete 4-bit × 4-bit result
    result_o : OUT UNSIGNED(7 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- Multiplying two 4-bit unsigned values requires up to 8 bits to store the complete result.
  result_o <= a_i * b_i;
END ARCHITECTURE behavioral;
