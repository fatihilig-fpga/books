LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  GENERIC (
    -- G_CLK_FREQ_MHZ is a REAL generic.
    -- Its default value represents a clock frequency of 100.0 MHz.
    G_CLK_FREQ_MHZ : REAL := 100.0
  );
  -- No ports are required because this example only demonstrates how a REAL generic can be used 
  -- in a calculation.
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- clock_period_s is a REAL signal.
  -- It is used to display the calculated clock period in simulation.
  SIGNAL clock_period_s : REAL;

  -- C_CLK_PERIOD_NS is a REAL constant. It calculates the clock period in nanoseconds.
  -- For the default generic value: 1000.0 / 100.0 = 10.0 ns
  CONSTANT C_CLK_PERIOD_NS : REAL := 1000.0 / G_CLK_FREQ_MHZ;
BEGIN
  -- Assign the calculated clock period to clock_period_s.
  clock_period_s <= C_CLK_PERIOD_NS;
END ARCHITECTURE sim;
