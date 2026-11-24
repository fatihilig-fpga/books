LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- Entity declaration
ENTITY MODULE_1 IS
  PORT (
    -- 2-bit decoder input
    data_i   : IN STD_LOGIC_VECTOR(1 DOWNTO 0):="10";
    -- Enable input
    enable_i : IN STD_LOGIC :='1';
    -- 4-bit decoder output
    result_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;
-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signal that combines enable_i and data_i
  SIGNAL select_s : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
  -- Internal signal that stores the decoder result
  SIGNAL result_s : STD_LOGIC_VECTOR(result_o'RANGE);
BEGIN
  -- Combine the enable bit with the 2-bit data input
  select_s <= enable_i & data_i;
  -- Decode select_s into one of four output patterns
  WITH select_s SELECT
    result_s <= "0001" WHEN "100",
                "0010" WHEN "101",
                "0100" WHEN "110",
                "1000" WHEN "111",
                "0000" WHEN OTHERS;
  -- Connect the internal result to the output port
  result_o <= result_s;
END ARCHITECTURE behavioral;
