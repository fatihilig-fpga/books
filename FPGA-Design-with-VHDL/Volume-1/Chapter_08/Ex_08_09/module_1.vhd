LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
  PORT (
    -- 6-bit unsigned input ports
    a_i   : IN  UNSIGNED(5 DOWNTO 0) := "011010"; -- Decimal 26
    b_i   : IN  UNSIGNED(5 DOWNTO 0) := "011001"; -- Decimal 25
    -- 7-bit output port to store a possible carry
    sum_o : OUT UNSIGNED(6 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- Extend both operands to 7 bits before adding them.
  sum_o <= ('0' & a_i) + ('0' & b_i);
END ARCHITECTURE behavioral;
