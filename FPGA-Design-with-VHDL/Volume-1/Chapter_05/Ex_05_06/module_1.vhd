LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- upper_nibble_s is a 4-bit vector. It will become the upper 4 bits of data_out_s.
  SIGNAL upper_nibble_s : STD_LOGIC_VECTOR(3 DOWNTO 0);
  -- lower_nibble_s is a 4-bit vector. It will become the lower 4 bits of data_out_s.
  SIGNAL lower_nibble_s : STD_LOGIC_VECTOR(3 DOWNTO 0);
  -- data_out_s is an 8-bit vector.
  -- It will store the result of joining upper_nibble_s and lower_nibble_s.
  SIGNAL data_out_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
  -- Assign a 4-bit value to upper_nibble_s.
  upper_nibble_s <= "1010";

  -- Assign a 4-bit value to lower_nibble_s.
  lower_nibble_s <= "0011";

  -- Concatenate upper_nibble_s and lower_nibble_s using the & operator.
  --
  -- The left side of & becomes the upper bits of the result.
  -- The right side of & becomes the lower bits of the result.
  --
  -- upper_nibble_s = "1010"
  -- lower_nibble_s = "0011"
  --
  -- data_out_s = "1010" & "0011"
  -- data_out_s = "10100011"
  data_out_s <= upper_nibble_s & lower_nibble_s;

END ARCHITECTURE sim;
