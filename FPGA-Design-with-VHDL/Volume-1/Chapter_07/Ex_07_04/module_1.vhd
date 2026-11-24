LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  --------------------------------------------------------------------
  -- Clock signal declarations
  -- clk_50MHz_s is initialized to '0'. A 50 MHz clock has a period of 20 ns.
  SIGNAL clk_50MHz_s : STD_LOGIC := '0';
  -- clk_100MHz_s is initialized to '0'. A 100 MHz clock has a period of 10 ns.
  SIGNAL clk_100MHz_s : STD_LOGIC := '0';
  -- clk_200MHz_s is initialized to '0'. A 200 MHz clock has a period of 5 ns.
  SIGNAL clk_200MHz_s : STD_LOGIC := '0';
BEGIN
  --------------------------------------------------------------------
  -- Generate the 50 MHz clock
  -- The signal changes every 10 ns. One complete clock period is 20 ns.
  clk_50MHz_s <= NOT clk_50MHz_s AFTER 10 ns;
  --------------------------------------------------------------------
  -- Generate the 100 MHz clock
  -- The signal changes every 5 ns. One complete clock period is 10 ns.
  clk_100MHz_s <= NOT clk_100MHz_s AFTER 5 ns;
  --------------------------------------------------------------------
  -- Generate the 200 MHz clock
  -- The signal changes every 2.5 ns. One complete clock period is 5 ns.
  clk_200MHz_s <= NOT clk_200MHz_s AFTER 2.5 ns;
END ARCHITECTURE sim;
