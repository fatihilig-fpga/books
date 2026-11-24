LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Example 8-bit input signal
  SIGNAL data_s : UNSIGNED(7 DOWNTO 0) := "00001111";
  -- Shift and rotate result signals
  SIGNAL sll_result_s : UNSIGNED(7 DOWNTO 0);
  SIGNAL srl_result_s : UNSIGNED(7 DOWNTO 0);
  SIGNAL rol_result_s : UNSIGNED(7 DOWNTO 0);
  SIGNAL ror_result_s : UNSIGNED(7 DOWNTO 0);
BEGIN
  -- Shift Left Logical by 1 bit. Bits move left. A zero is added to the right.
  sll_result_s <= data_s(6 DOWNTO 0) & '0';
  -- Shift Right Logical by 1 bit. Bits move right. A zero is added to the left.
  srl_result_s <= '0' & data_s(7 DOWNTO 1);
  -- Rotate Left by 1 bit. Bits move left. The leftmost bit wraps around to the right.
  rol_result_s <= data_s(6 DOWNTO 0) & data_s(7);
  -- Rotate Right by 1 bit. Bits move right. The rightmost bit wraps around to the left.
  ror_result_s <= data_s(0) & data_s(7 DOWNTO 1);
END ARCHITECTURE behavioral;
