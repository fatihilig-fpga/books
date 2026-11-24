LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- data_a_s is a 4-bit STD_LOGIC_VECTOR signal. It is initialized to "1010" for this example.
  SIGNAL data_a_s : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1010";
  -- data_b_s is another 4-bit STD_LOGIC_VECTOR signal.
  -- It is initialized to "1100" for this example.
  SIGNAL data_b_s : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1100";
  -- result_s will store the result of the bit-by-bit AND operation.
  SIGNAL result_s : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
  -- Apply the AND operator to data_a_s and data_b_s.
  -- data_a_s = "1010"
  -- data_b_s = "1100"
  -- Each bit of data_a_s is ANDed with the matching bit of data_b_s.
  -- result_s(3) = data_a_s(3) AND data_b_s(3) = '1' AND '1' = '1'
  -- result_s(2) = data_a_s(2) AND data_b_s(2) = '0' AND '1' = '0'
  -- result_s(1) = data_a_s(1) AND data_b_s(1) = '1' AND '0' = '0'
  -- result_s(0) = data_a_s(0) AND data_b_s(0) = '0' AND '0' = '0'
  -- Therefore:
  -- result_s = "1000"
  result_s <= data_a_s AND data_b_s;
END ARCHITECTURE behavioral;
