LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY my_first_fpga_tb IS
END ENTITY my_first_fpga_tb;

ARCHITECTURE behavioral OF my_first_fpga_tb IS
  -- Clock period for simulation
  CONSTANT C_CLK_PERIOD : TIME := 10 ns;
  -- The design will count from 0 to 15, then return to 0.
  CONSTANT C_MAX_COUNT : NATURAL := 15;
  -- Testbench signals
  SIGNAL clk_s   : STD_LOGIC := '0';
  SIGNAL reset_s : STD_LOGIC := '1';
  SIGNAL data_s  : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
  -- Clock generation
  clk_s <= NOT clk_s AFTER C_CLK_PERIOD / 2;

  -- Device Under Test
  u_dut : ENTITY work.my_first_fpga
    GENERIC MAP(
      G_MAX_COUNT => C_MAX_COUNT
    )
    PORT MAP(
      clk_i   => clk_s,
      reset_i => reset_s,
      data_o  => data_s
    );
  -- Stimulus process
  p_stimulus : PROCESS
  BEGIN
    -- Hold reset active for a few clock cycles.
    reset_s <= '1';
    WAIT FOR 3 * C_CLK_PERIOD;

    -- Release reset.
    reset_s <= '0';

    -- Let the counter run long enough to observe rollover from 15 back to 0.
    WAIT FOR 20 * C_CLK_PERIOD;

    -- Apply reset again to confirm the counter returns to zero.
    reset_s <= '1';
    WAIT FOR 2 * C_CLK_PERIOD;

    -- Release reset again.
    reset_s <= '0';
    WAIT FOR 10 * C_CLK_PERIOD;
    -- Print a completion message and stop the stimulus process.
    ASSERT false
    REPORT "Stimulus completed; inspect the waveform to verify the counter"
      SEVERITY note;
    WAIT;
  END PROCESS p_stimulus;

END ARCHITECTURE behavioral;
