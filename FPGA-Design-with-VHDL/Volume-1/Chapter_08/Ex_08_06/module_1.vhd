LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Example 8-bit signal
  SIGNAL data_s : UNSIGNED(7 DOWNTO 0) := "00001111";
  -- Result signal for the shift-left operation
  SIGNAL sll_result_s : UNSIGNED(7 DOWNTO 0);
BEGIN
  -- Shift Left Logical by 4 bit positions. Bits move left by 4 positions.
  -- Zeros enter from the right.
  sll_result_s <= data_s SLL 4;
END ARCHITECTURE behavioral;
