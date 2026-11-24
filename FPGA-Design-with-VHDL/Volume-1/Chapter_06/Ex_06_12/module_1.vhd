LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  TYPE t_Matrix IS ARRAY (0 TO 3, 0 TO 7) OF INTEGER;
  SIGNAL matrix_s : t_Matrix := (OTHERS => (OTHERS => 1));
BEGIN
  -- All elements of matrix_s start with the value 1. Assign the value 5 to one element of the 
  -- matrix. matrix_s(1, 3) means:
  --   row index    = 1
  --   column index = 3
  -- So this line changes the element at row 1 and column 3 to 5.
  matrix_s(1, 3) <= 5;
END ARCHITECTURE sim;
