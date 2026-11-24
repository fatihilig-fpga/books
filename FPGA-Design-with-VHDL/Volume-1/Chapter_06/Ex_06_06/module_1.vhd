LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  --------------------------------------------------------------------
  -- 1. Constrained array type
  --------------------------------------------------------------------
  -- Create a constrained array type called t_Rom. This array has a fixed index range 
  -- from 0 to 1. Therefore, it has 2 elements. Each element is an 8-bit STD_LOGIC_VECTOR.
  TYPE t_Rom IS ARRAY (0 TO 1) OF STD_LOGIC_VECTOR(7 DOWNTO 0);

  -- Create a constant named ROM1 using the t_Rom type.
  --
  -- The values are initialized at the moment of declaration:
  -- ROM1(0) = x"AB"
  -- ROM1(1) = x"12"
  --
  -- Initialization means giving values when the object is declared.
  -- This is different from signal assignment using <= after BEGIN.
  CONSTANT ROM1 : t_Rom := (x"AB", x"12");
  --------------------------------------------------------------------
  -- 2. Unconstrained array type
  --------------------------------------------------------------------
  -- Create an unconstrained array type called t_Byte_Array. NATURAL RANGE <> means the index 
  -- range is not fixed here. The range will be chosen later when a signal is declared.
  -- Each element is still an 8-bit STD_LOGIC_VECTOR.
  TYPE t_Byte_Array IS ARRAY (NATURAL RANGE <>) OF STD_LOGIC_VECTOR(7 DOWNTO 0);

  -- Create a signal using the t_Byte_Array type. Here, the range is chosen as 0 TO 10.
  -- Therefore, lut_s has 11 elements each include 8-bit STD_LOGIC_VECTOR.
  SIGNAL lut_s : t_Byte_Array(0 TO 10);

  -- Create another signal using the same t_Byte_Array type. Here, the range is chosen as 
  -- 0 TO 63. Therefore, fifo_s has 64 elements each include 8-bit STD_LOGIC_VECTOR.
  SIGNAL fifo_s : t_Byte_Array(0 TO 63);
BEGIN

  -- Assign values to selected elements of lut_s.
  lut_s(0)  <= x"55";
  lut_s(10) <= x"AA";

  -- Assign values to selected elements of fifo_s.
  fifo_s(0)  <= x"11";
  fifo_s(63) <= x"FF";

  -- ROM1 is a constant, so it is not assigned here. Its values were already initialized.
END ARCHITECTURE sim;
