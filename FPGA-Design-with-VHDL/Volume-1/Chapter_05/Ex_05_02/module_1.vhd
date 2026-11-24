LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  -- This example does not need any input or output ports.
  -- The signals are only used internally for simulation.
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- DOWNTO: MSB on the left
  SIGNAL data_byte1_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
  -- Positions:  7  6  5  4  3  2  1  0
  -- MSB = bit 7 (leftmost)    LSB = bit 0 (rightmost)

  -- TO: LSB on the left (less common)
  SIGNAL data_byte2_s : STD_LOGIC_VECTOR(0 TO 7);
  -- Positions:  0  1  2  3  4  5  6  7
  -- LSB = bit 0 (leftmost)    MSB = bit 7 (rightmost)
BEGIN
  -- data_byte1_s is 8 bits signal 
  -- Lets assign 11100000 as binary. 
  data_byte1_s <= "11100000";
  -- data_byte1_s is 8 bits signal 
  -- Lets assign 11100000 as binary. 
  data_byte2_s <= "11100000";
END ARCHITECTURE sim;
