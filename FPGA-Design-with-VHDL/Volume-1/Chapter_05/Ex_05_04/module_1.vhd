LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- data_byte_s is an 8-bit vector. It contains bits 7 down to 0.
  SIGNAL data_byte_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
  -- upper_nibble_s is a 4-bit vector. It will store the upper 4 bits of data_byte_s.
  SIGNAL upper_nibble_s : STD_LOGIC_VECTOR(3 DOWNTO 0);
  -- lower_nibble_s is a 4-bit vector. It will store the lower 4 bits of data_byte_s.
  SIGNAL lower_nibble_s : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
  -- Assign an 8-bit binary value to data_byte_s.
  --
  -- Bit positions:
  -- data_byte_s(7) = '0'
  -- data_byte_s(6) = '1'
  -- data_byte_s(5) = '1'
  -- data_byte_s(4) = '0'
  -- data_byte_s(3) = '0'
  -- data_byte_s(2) = '0'
  -- data_byte_s(1) = '0'
  -- data_byte_s(0) = '1'
  data_byte_s <= "01100001";

  -- Select the upper 4 bits of data_byte_s.
  --
  -- data_byte_s(7 DOWNTO 4) selects: bit 7, bit 6, bit 5, and bit 4
  --
  -- These bits are assigned to upper_nibble_s in the same order:
  -- data_byte_s(7) goes to upper_nibble_s(3)
  -- data_byte_s(6) goes to upper_nibble_s(2)
  -- data_byte_s(5) goes to upper_nibble_s(1)
  -- data_byte_s(4) goes to upper_nibble_s(0)
  --
  -- Therefore, upper_nibble_s becomes "0110".
  upper_nibble_s <= data_byte_s(7 DOWNTO 4);

  -- Select the lower 4 bits of data_byte_s.
  --
  -- data_byte_s(3 DOWNTO 0) selects: bit 3, bit 2, bit 1, and bit 0
  --
  -- These bits are assigned to lower_nibble_s in the same order:
  -- data_byte_s(3) goes to lower_nibble_s(3)
  -- data_byte_s(2) goes to lower_nibble_s(2)
  -- data_byte_s(1) goes to lower_nibble_s(1)
  -- data_byte_s(0) goes to lower_nibble_s(0)
  --
  -- Therefore, lower_nibble_s becomes "0001".
  lower_nibble_s <= data_byte_s(3 DOWNTO 0);

END ARCHITECTURE sim;
