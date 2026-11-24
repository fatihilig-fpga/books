LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; -- Required for UNSIGNED

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  --------------------------------------------------------------------
  -- UNSIGNED and NATURAL signals
  -- count_u_s is an 8-bit unsigned value.
  SIGNAL count_u_s : UNSIGNED(7 DOWNTO 0);
  -- count_n_s is a natural number with a range from 0 to 255.
  SIGNAL count_n_s : NATURAL RANGE 0 TO 255;
  --------------------------------------------------------------------
  -- Individual bit
  SIGNAL bit_u_s : STD_LOGIC;
  SIGNAL bit_n_s : STD_LOGIC;
BEGIN
  --------------------------------------------------------------------
  -- Assign the decimal value 255 to both signals
  count_u_s <= x"FF"; -- Hexadecimal FF is 255 in decimal.
  count_n_s <= 255;
  --------------------------------------------------------------------
  -- Access an individual bit. UNSIGNED is an array, so its individual bits can be accessed.
  bit_u_s <= count_u_s(0);

  -- NATURAL is not an array, so its individual bits cannot be accessed directly.
  -- Uncommenting the following line causes an error:
  -- bit_n_s <= count_n_s(0);
  --
  -- Vivado reports that the prefix type NATURAL is not an array type!
END ARCHITECTURE sim;
