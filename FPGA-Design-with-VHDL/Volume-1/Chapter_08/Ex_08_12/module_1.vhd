LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY MODULE_1 IS
  PORT (
    -- 10-bit unsigned input ports
    a_i : IN UNSIGNED(9 DOWNTO 0) := "0000001010"; -- Decimal 10
    b_i : IN UNSIGNED(9 DOWNTO 0) := "0000001100"; -- Decimal 12
    -- 20-bit output port for the complete 10-bit × 10-bit result
    result_o : OUT UNSIGNED(19 DOWNTO 0)
  );
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- Multiplying two 10-bit unsigned values requires up to 20 bits to store the complete result.
  result_o <= a_i * b_i;
END ARCHITECTURE behavioral;
