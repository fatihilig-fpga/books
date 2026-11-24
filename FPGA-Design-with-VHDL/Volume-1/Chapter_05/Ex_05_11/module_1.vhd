LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- address_std_s is a 16-bit std_logic_vector signal. This is the type normally used in FPGA 
  -- designs.Each bit can represent values such as '0', '1', 'U', 'X', and 'Z' during simulation
  SIGNAL address_std_s : STD_LOGIC_VECTOR(15 DOWNTO 0);
  -- address_bit_s is a 16-bit bit_vector signal. This type is simpler than std_logic_vector.
  -- Each bit can only be '0' or '1'. It does not support states such as 'U', 'X', or 'Z'.
  SIGNAL address_bit_s : BIT_VECTOR(15 DOWNTO 0);

  SIGNAL single_bit_s : BIT;

BEGIN
  single_bit_s <= '1';
END ARCHITECTURE sim;
