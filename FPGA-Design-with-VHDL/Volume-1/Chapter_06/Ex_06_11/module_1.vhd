LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- Define a 2D array type called t_Matrix. This array has two index ranges:
  --   0 TO 3  -> column index
  --   0 TO 7  -> row index
  -- This means the array has 4 columns and 8 rows. Each element of the array is an INTEGER.
  TYPE t_Matrix IS ARRAY (0 TO 7, 0 TO 3) OF INTEGER;

  -- Create a signal using the t_Matrix type. matrix_s is now a 8x4 matrix.
  -- It contains 32 integer elements in total.
  SIGNAL matrix_s : t_Matrix;
BEGIN
  -- Assign the value 5 to one element of the matrix. matrix_s(1, 3) means:
  -- row index    = 1
  -- column index = 3
  -- So this line assigns 5 to the element located at row 1 and column 3.
  matrix_s(1, 3) <= 5;

END ARCHITECTURE sim;
