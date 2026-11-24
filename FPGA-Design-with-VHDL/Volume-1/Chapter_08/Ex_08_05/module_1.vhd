LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Example 8-bit signal
  SIGNAL data_s : UNSIGNED(7 DOWNTO 0) := "00001111";
  -- Shift and rotate result signals
  SIGNAL sll_result_s : UNSIGNED(7 DOWNTO 0);
  SIGNAL srl_result_s : UNSIGNED(7 DOWNTO 0);
  SIGNAL rol_result_s : UNSIGNED(7 DOWNTO 0);
  SIGNAL ror_result_s : UNSIGNED(7 DOWNTO 0);
BEGIN
  -- Shift Left Logical. Bits move left. Zero enters from the right.
  sll_result_s <= data_s SLL 1;
  -- Shift Right Logical. Bits move right. Zero enters from the left.
  srl_result_s <= data_s SRL 1;
  -- Rotate Left. Bits move left. The bit that exits on the left wraps around to the right.
  rol_result_s <= data_s ROL 1;
  -- Rotate Right. Bits move right. The bit that exits on the right wraps around to the left.
  ror_result_s <= data_s ROR 1;
END ARCHITECTURE behavioral;
