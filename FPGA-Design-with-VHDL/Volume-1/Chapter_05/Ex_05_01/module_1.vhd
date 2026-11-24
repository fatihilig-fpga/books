LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  -- This example does not need any input or output ports.
  -- The signals are only used internally for simulation.
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- These signals are used to display different std_logic values in the simulation waveform.
  SIGNAL sig_0 : STD_LOGIC;
  SIGNAL sig_1 : STD_LOGIC;
  SIGNAL sig_Z : STD_LOGIC;
  SIGNAL sig_X : STD_LOGIC;
  -- This signal has no initial value. Therefore, it starts as 'U' in simulation.
  SIGNAL sig_U : STD_LOGIC;
  -- This signal is used to demonstrate a bus conflict.
  SIGNAL bus_line : STD_LOGIC;
BEGIN
  --------------------------------------------------------------------
  -- Direct std_logic value demonstration
  --------------------------------------------------------------------
  sig_0 <= '0'; -- strong logic zero
  sig_1 <= '1'; -- strong logic one
  sig_Z <= 'Z'; -- high impedance
  sig_X <= 'X'; -- forced unknown
  --------------------------------------------------------------------
  -- Multiple-driver example to produce 'X'. It is an issue because concurrent assignments  
  -- exist at the same time, these two assignments act like two hardware drivers connected to 
  -- the same wire. It is causing 'X'!
  --------------------------------------------------------------------
  -- If one driver drives '1' and another drives '0', the resolved result becomes 'X'.
  bus_line <= '1'; -- first driver drives the signal high
  bus_line <= '0'; -- second driver drives the same signal low
  -- Because bus_line has two conflicting drivers,The simulator resolves the final value to 'X'.
END ARCHITECTURE sim;
