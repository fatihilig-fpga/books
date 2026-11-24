LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- clk_s is a single-bit clock signal. It is initialized to '0' at the beginning of the 
  -- simulation. You can change the initial value to '1' and observe the result.
  SIGNAL clk_s : STD_LOGIC := '0';
BEGIN
  -- Invert the current value of clk_s after 5 ns.
  -- If clk_s is '0', it becomes '1'.
  -- If clk_s is '1', it becomes '0'.
  -- This repeats continuously and generates a clock signal.
  -- The signal changes every 5 ns, so one full clock period is 10 ns.
  clk_s <= NOT clk_s AFTER 5 ns;
END ARCHITECTURE sim;
