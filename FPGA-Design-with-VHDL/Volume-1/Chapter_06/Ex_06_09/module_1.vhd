LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS

  -- An array containing eight INTEGER elements
  TYPE t_Vector IS ARRAY (0 TO 7) OF INTEGER;

  SIGNAL vector_s : t_Vector := (OTHERS => 0);

  -- An unconstrained array type whose elements are 8-bit vectors
  TYPE t_Byte_Array IS ARRAY (NATURAL RANGE <>) OF STD_LOGIC_VECTOR(7 DOWNTO 0);

  -- Set every bit of every array element to '0'
  SIGNAL lut_s : t_Byte_Array(0 TO 10) := (OTHERS => (OTHERS => '0'));

  SIGNAL fifo_s : t_Byte_Array(0 TO 63) := (OTHERS => (OTHERS => '0'));

  -- An array containing eight BIT elements
  TYPE t_Accumulator IS ARRAY (0 TO 7) OF BIT;

  SIGNAL accumulator_1_s : t_Accumulator := (OTHERS => '0');
  SIGNAL accumulator_2_s : t_Accumulator := (OTHERS => '0');
  SIGNAL accumulator_3_s : t_Accumulator := (OTHERS => '0');
  SIGNAL accumulator_4_s : t_Accumulator := (OTHERS => '0');
  SIGNAL accumulator_5_s : t_Accumulator := (OTHERS => '0');

BEGIN

END ARCHITECTURE sim;
