LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- Define a 1D array type called t_Accumulator. This array has 8 elements.The index range is  
  -- 0 TO 7. Each element is a BIT, so each element can only be '0' or '1'.
  TYPE t_Accumulator IS ARRAY (0 TO 7) OF BIT;

  -- These five signals all use the same array type.
  -- Each signal will be assigned using a different method.
  SIGNAL accumulator_1_s : t_Accumulator;
  SIGNAL accumulator_2_s : t_Accumulator;
  SIGNAL accumulator_3_s : t_Accumulator;
  SIGNAL accumulator_4_s : t_Accumulator;
  SIGNAL accumulator_5_s : t_Accumulator;
BEGIN
  ---------------------------------------------------------
  -- Example 1: Assign selected indexes using an aggregate
  ---------------------------------------------------------
  -- This assignment sets:
  -- accumulator_1_s(7) = '1'
  -- accumulator_1_s(2) = '1'
  --
  -- OTHERS => '0' sets all remaining elements to '0'.
  accumulator_1_s <= (
    7      => '1',
    2      => '1',
    OTHERS => '0'
    );
  -------------------------------------------------------
  -- Example 2: Assign individual array elements
  -------------------------------------------------------
  -- This method assigns specific elements one by one.
  --
  -- accumulator_2_s(7) is set to '1'.
  -- accumulator_2_s(2) is set to '1'.
  --
  -- Since BIT elements start from '0' by default in simulation, the other elements remain '0'.
  accumulator_2_s(7) <= '1';
  accumulator_2_s(2) <= '1';
  --------------------------------------------------------------------
  -- Example 3: Assign multiple indexes together
  --------------------------------------------------------------------
  -- This is another aggregate assignment.
  -- The | symbol here means 'or'. It lets you assign the same value to multiple indexes at 
  -- once. Writing 2 | 7 => '1' means: set index 2 AND index 7 to '1'.
  -- The indexes 2 and 7 are both assigned '1'. All other elements are assigned '0'.
  accumulator_3_s <= (
    2 | 7  => '1',
    OTHERS => '0'
    );
  --------------------------------------------------------------------
  -- Example 4: Assign the whole array using a string
  --------------------------------------------------------------------
  -- This assigns all 8 elements at once.
  --
  -- The array index range is 0 TO 7. Therefore, the leftmost bit goes to index 0,
  -- and the rightmost bit goes to index 7.
  --
  -- accumulator_4_s(0) = '0'
  -- accumulator_4_s(1) = '0'
  -- accumulator_4_s(2) = '1'
  -- accumulator_4_s(3) = '0'
  -- accumulator_4_s(4) = '0'
  -- accumulator_4_s(5) = '0'
  -- accumulator_4_s(6) = '0'
  -- accumulator_4_s(7) = '1'
  accumulator_4_s <= "00100001";
  --------------------------------------------------------------------
  -- Example 5: Assign array slices
  --------------------------------------------------------------------
  -- This method assigns smaller parts of the array.
  --
  -- The slice accumulator_5_s(0 TO 3) gets "0010".
  -- The slice accumulator_5_s(4 TO 7) gets "0001".
  --
  -- Together, the full array becomes "00100001".
  accumulator_5_s(0 TO 3) <= "0010";
  accumulator_5_s(4 TO 7) <= "0001";

END ARCHITECTURE sim;
