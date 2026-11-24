LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  --------------------------------------------------------------------
  -- Individual clock signals
  --------------------------------------------------------------------
  SIGNAL clk_50MHz_s  : STD_LOGIC;
  SIGNAL clk_100MHz_s : STD_LOGIC;
  SIGNAL clk_200MHz_s : STD_LOGIC;
  --------------------------------------------------------------------
  -- Clock vector
  --------------------------------------------------------------------
  -- Each bit represents one clock signal.
  -- Initialize all bits to '0' so that the clocks can start toggling.
  SIGNAL clk_signals_s : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');
  --------------------------------------------------------------------
  -- Half-period constants
  --------------------------------------------------------------------
  -- Each constant defines when its clock signal changes value.
  CONSTANT C_HALF_PERIOD_50MHZ  : TIME := 10 ns;
  CONSTANT C_HALF_PERIOD_100MHZ : TIME := 5 ns;
  CONSTANT C_HALF_PERIOD_200MHZ : TIME := 2.5 ns;
BEGIN
  --------------------------------------------------------------------
  -- Generate the clock signals
  --------------------------------------------------------------------
  -- Bit 0 generates the 50 MHz clock.
  clk_signals_s(0) <= NOT clk_signals_s(0) AFTER C_HALF_PERIOD_50MHZ;

  -- Bit 1 generates the 100 MHz clock.
  clk_signals_s(1) <= NOT clk_signals_s(1) AFTER C_HALF_PERIOD_100MHZ;

  -- Bit 2 generates the 200 MHz clock.
  clk_signals_s(2) <= NOT clk_signals_s(2) AFTER C_HALF_PERIOD_200MHZ;
  --------------------------------------------------------------------
  -- Connect each vector bit to an individual signal
  --------------------------------------------------------------------
  clk_50MHz_s  <= clk_signals_s(0);
  clk_100MHz_s <= clk_signals_s(1);
  clk_200MHz_s <= clk_signals_s(2);

END ARCHITECTURE sim;
