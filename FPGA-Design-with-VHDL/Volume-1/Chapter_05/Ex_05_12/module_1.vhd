LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; -- Required for unsigned and signed types

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  --------------------------------------------------------------------
  -- Unsigned signals
  --------------------------------------------------------------------
  -- unsigned_a_s is an 8-bit unsigned number. VHDL treats this signal as a positive number.
  SIGNAL unsigned_a_s : UNSIGNED(7 DOWNTO 0);
  -- unsigned_b_s is another 8-bit unsigned number.
  SIGNAL unsigned_b_s : UNSIGNED(7 DOWNTO 0);
  --------------------------------------------------------------------
  -- Signed signals
  --------------------------------------------------------------------
  -- signed_a_s is an 8-bit signed number. VHDL treats this signal as a two's complement number.
  -- This means it can represent positive and negative values.
  SIGNAL signed_a_s : SIGNED(7 DOWNTO 0);
  -- signed_b_s is another 8-bit signed number.
  SIGNAL signed_b_s : SIGNED(7 DOWNTO 0);
BEGIN
  --------------------------------------------------------------------
  -- Unsigned example
  --------------------------------------------------------------------
  -- Assign 5 to unsigned_a_s. "00000101" is 5 in unsigned decimal.
  unsigned_a_s <= "00000101";

  -- Assign 3 to unsigned_b_s. "00000011" is 3 in unsigned decimal.
  unsigned_b_s <= "00000011";
  --------------------------------------------------------------------
  -- Signed example
  --------------------------------------------------------------------
  -- Assign -5 to signed_a_s. "11111011" is -5 in 8-bit two's complement.
  signed_a_s <= "11111011";

  -- Assign +3 to signed_b_s. "00000011" is +3 in 8-bit two's complement.
  signed_b_s <= "00000011";
END ARCHITECTURE sim;
