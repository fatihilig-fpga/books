LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- value_s is an 8-bit SIGNED signal. The decimal value is -12.
  -- In 8-bit two's complement form, -12 is: value_s = "11110100"
  SIGNAL value_s : SIGNED(7 DOWNTO 0) := "11110100";
  -- value_mul2_s will store value_s multiplied by 2.
  -- The result is 9 bits wide because multiplying by 2 may need one extra bit.
  SIGNAL value_mul2_s : SIGNED(8 DOWNTO 0);
  -- value_mul4_s will store value_s multiplied by 4.
  -- The result is 10 bits wide because multiplying by 4 may need two extra bits.
  SIGNAL value_mul4_s : SIGNED(9 DOWNTO 0);
  -- value_div2_s will store value_s divided by 2.
  -- Division by 2 does not need extra bits, so the result is 8 bits wide.
  SIGNAL value_div2_s : SIGNED(7 DOWNTO 0);
  -- value_div4_s will store value_s divided by 4.
  SIGNAL value_div4_s : SIGNED(7 DOWNTO 0);
BEGIN
  -- Multiply by 2 using concatenation.
  -- value_s = "11110100"  -- -12
  -- Add one '0' on the right:
  -- value_mul2_s = "111101000"  -- -24
  value_mul2_s <= value_s & '0';
  -- Multiply by 4 using concatenation.
  -- value_s = "11110100"  -- -12
  -- Add two '0' bits on the right:
  -- value_mul4_s = "1111010000"  -- -48
  value_mul4_s <= value_s & "00";
  -- Divide by 2 using concatenation. For signed division by shifting right, the sign bit must 
  -- be copied into the empty left-side position.
  -- value_s = "11110100"  -- -12
  -- Copy value_s(7), then keep value_s(7 DOWNTO 1):
  -- value_div2_s = "11111010"  -- -6
  value_div2_s <= value_s(7) & value_s(7 DOWNTO 1);
  -- Divide by 4 using concatenation.
  -- For division by 4, two sign bits are copied into the left side.
  -- value_s = "11110100" = -12
  -- Copy value_s(7) twice, then keep value_s(7 DOWNTO 2): value_div4_s = "11111101"  = -3
  value_div4_s <= value_s(7) & value_s(7) & value_s(7 DOWNTO 2);
END ARCHITECTURE behavioral;
