LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- data_byte_s is an 8-bit vector.
  SIGNAL data_byte_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
  -- upper_nibble_s is a 4-bit vector.
  SIGNAL upper_nibble_s : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
  -- Assign an 8-bit binary value to data_byte_s.
  data_byte_s <= "01100001";
  -- This line is intentionally wrong.
  -- data_byte_s(7 DOWNTO 3) selects 5 bits: bit 7, bit 6, bit 5, bit 4, and bit 3.
  -- However, upper_nibble_s can store only 4 bits.
  -- Therefore, this assignment causes a size mismatch error.
  upper_nibble_s <= data_byte_s(7 DOWNTO 3);
END ARCHITECTURE sim;
