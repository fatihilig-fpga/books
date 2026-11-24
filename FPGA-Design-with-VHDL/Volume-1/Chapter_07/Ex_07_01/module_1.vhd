LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- voltage_s is a REAL signal. REAL values can include decimal points.
  SIGNAL voltage_s : REAL := 0.0;
  -- gain_s is another REAL signal. It is initialized to 2.5.
  SIGNAL gain_s : REAL := 2.5;
  -- result_s will store the result of a REAL calculation.
  SIGNAL result_s : REAL;
BEGIN
  -- Assign a decimal value to voltage_s.
  voltage_s <= 1.2;
  -- Multiply the REAL values together.
  -- voltage_s = 1.2
  -- gain_s    = 2.5
  -- result_s = 1.2 * 2.5 = 3.0
  result_s <= voltage_s * gain_s;
END ARCHITECTURE sim;
