LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  SIGNAL data_byte1_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL data_byte2_s : STD_LOGIC_VECTOR(0 TO 7);
  -- These signals are single-bit std_logic signals. Each one can store only one bit.
  SIGNAL single_bit1_s : STD_LOGIC;
  SIGNAL single_bit2_s : STD_LOGIC;
  SIGNAL single_bit3_s : STD_LOGIC;
BEGIN
  -- Assign the same 8-bit binary value to both vectors.
  data_byte1_s <= "11100000";
  data_byte2_s <= "11100000";
  --
  -- Select bit 7 from data_byte1_s. Since data_byte1_s uses 7 DOWNTO 0, bit 7 is the leftmost 
  -- bit. Therefore, single_bit1_s gets '1'.
  single_bit1_s <= data_byte1_s(7);
  -- Select bit 0 from data_byte2_s. Since data_byte2_s uses 0 TO 7, bit 0 is the leftmost bit.
  -- Therefore, single_bit2_s gets '1'.
  single_bit2_s <= data_byte2_s(0);
  -- Select bit 0 from data_byte1_s. Since data_byte1_s uses 7 DOWNTO 0, bit 0 is the rightmost 
  -- bit. Therefore, single_bit3_s gets '0'.
  single_bit3_s <= data_byte1_s(0);
END ARCHITECTURE sim;
