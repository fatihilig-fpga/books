LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- Define a 1D array type: 8 elements, each an integer. This creates a new type called 
  -- t_Vector. It holds 8 integer values, indexed from 0 to 7.
  TYPE t_Vector IS ARRAY (0 TO 7) OF INTEGER;

  -- Declaring a signal with your new type works exactly the same way as declaring any other 
  -- signal. Recall the general pattern:
  -- SIGNAL signal_name : type_name;
  --
  -- Previously you used built-in types:
  --   SIGNAL led_s  : STD_LOGIC;
  --   SIGNAL data_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
  --
  -- Here the type is t_Vector, your own user-defined array type.
  -- The structure is identical, only the type name changes: SIGNAL signal_name : t_Vector;
  SIGNAL vector_s : t_Vector;
BEGIN
  -- Access a specific element using its index number.
  -- vector_s(3) refers to the 4th element because indexing starts at 0.
  vector_s(3) <= 42; -- Set the element at index 3 to value 42

END ARCHITECTURE sim;
