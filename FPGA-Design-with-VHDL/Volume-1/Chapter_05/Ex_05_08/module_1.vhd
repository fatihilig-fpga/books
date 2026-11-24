LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- data_byte_s is an 8-bit vector.
  SIGNAL data_byte_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
  -- address_s is a 16-bit vector.
  SIGNAL address_s : STD_LOGIC_VECTOR(15 DOWNTO 0);
  -- msb_bit_s is a single-bit signal.
  SIGNAL msb_bit_s : STD_LOGIC;
  -- lower_nibble_s is a 4-bit vector.
  SIGNAL lower_nibble_s : STD_LOGIC_VECTOR(3 DOWNTO 0);
  -- full_word_s is a 16-bit vector.
  SIGNAL full_word_s : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
  --------------------------------------------------------------------
  -- Example input values
  --------------------------------------------------------------------
  -- Assign an 8-bit value to data_byte_s.
  data_byte_s <= "10110011";
  -- Assign a 16-bit value to address_s.
  address_s <= "1100110010100101";
  --------------------------------------------------------------------
  -- 1. Bit indexing: selecting one bit
  --------------------------------------------------------------------
  -- Select bit 7 from data_byte_s. 
  -- Since data_byte_s is declared as 7 DOWNTO 0, bit 7 is the MSB.
  -- data_byte_s = "10110011", data_byte_s(7) = '1'
  -- The result is one bit, so it is assigned to a std_logic signal.
  msb_bit_s <= data_byte_s(7);
  --------------------------------------------------------------------
  -- 2. Slicing: selecting a group of bits
  --------------------------------------------------------------------
  -- Select bits 3 down to 0 from data_byte_s. This takes the lower 4 bits of the 8-bit vector.
  -- data_byte_s = "10110011"
  -- data_byte_s(3 DOWNTO 0) = "0011"
  -- The result is 4 bits, so it is assigned to a 4-bit std_logic_vector.
  lower_nibble_s <= data_byte_s(3 DOWNTO 0);
  --------------------------------------------------------------------
  -- 3. Concatenation: joining vectors together
  --------------------------------------------------------------------
  -- Select the lower 8 bits of address_s and concatenate them with the full 8-bit data_byte_s.
  -- address_s(7 DOWNTO 0) gives an 8-bit value. data_byte_s is also an 8-bit value.
  -- 8 bits + 8 bits = 16 bits
  -- Therefore, the result can be assigned to full_word_s, which is a 16-bit std_logic_vector.
  full_word_s <= address_s(7 DOWNTO 0) & data_byte_s;
END ARCHITECTURE sim;
