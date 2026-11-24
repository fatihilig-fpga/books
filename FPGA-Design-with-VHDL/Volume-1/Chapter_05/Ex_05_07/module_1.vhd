LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- data_out1_s is an 8-bit vector.
  SIGNAL data_out1_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
  -- data_out2_s is also an 8-bit vector.
  SIGNAL data_out2_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
  -- data_s is a 7-bit vector. It will be used as the lower 7 bits of data_out1_s.
  SIGNAL data_s : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
  -- Assign a 7-bit binary value to data_s.
  data_s <= "1001110";

  -- Concatenate one single bit with a 7-bit vector.
  --
  -- '1' is placed on the left side. data_s is placed after it.
  --
  -- data_s      = "1001110"
  -- data_out1_s = '1' & "1001110"
  -- data_out1_s = "11001110"
  data_out1_s <= '1' & data_s;

  -- You can also use the concatenation operator more than once.
  --
  -- '1' is placed first.
  -- another '1' is placed second.
  -- "001110" is placed after them.
  --
  -- data_out2_s = '1' & '1' & "001110"
  -- data_out2_s = "11001110"
  data_out2_s <= '1' & '1' & "001110";

END ARCHITECTURE sim;
