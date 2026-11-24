LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
  PORT (
    -- 4-bit unsigned input port
    a_i : IN UNSIGNED(3 DOWNTO 0) := "1010"; -- Decimal 10
    -- 4-bit unsigned output port for the integer division result
    result_o : OUT UNSIGNED(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Constant divisor with the value 2
  CONSTANT MYVAL_C : INTEGER := 2;
BEGIN
  -- Divide the unsigned input value by the constant 2. Vivado can implement this operation as a 
  -- one-bit right shift. Any fractional part of the integer result is discarded.
  result_o <= a_i / MYVAL_C;
END ARCHITECTURE behavioral;
