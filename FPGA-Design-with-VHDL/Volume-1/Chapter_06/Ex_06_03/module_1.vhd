LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- Create a subtype called t_Byte. This subtype is based on STD_LOGIC_VECTOR.
  -- It defines an 8-bit vector from bit 7 downto bit 0. This is useful when you want to use 
  -- the same 8-bit vector type many times in your design.
  SUBTYPE t_Byte IS STD_LOGIC_VECTOR(7 DOWNTO 0);

  -- Create a signal using the t_Byte subtype. Since t_Byte is an 8-bit STD_LOGIC_VECTOR,
  -- data_byte_s is also an 8-bit signal.
  SIGNAL data_byte_s : t_Byte;

  -- Create another signal using the same subtype t_Byte.
  SIGNAL another_data_byte_s : t_Byte := (OTHERS => '1');
BEGIN
  -- Assign an 8-bit value to data_byte_s. This is valid because data_byte_s uses the t_Byte 
  -- subtype, and t_Byte is defined as STD_LOGIC_VECTOR(7 DOWNTO 0).
  data_byte_s <= "10101010";
END ARCHITECTURE sim;
