LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  ------------------------------------------------------------
  -- DEFINE A SUBTYPE
  ------------------------------------------------------------
  -- t_Byte is not a completely new data type. It is a subtype of STD_LOGIC_VECTOR with a fixed 
  -- width of 8 bits.
  SUBTYPE t_Byte IS STD_LOGIC_VECTOR(7 DOWNTO 0);
  ------------------------------------------------------------
  -- DEFINE A NEW ARRAY TYPE
  ------------------------------------------------------------
  -- t_Rom is a new array type. It contains 2 elements, indexed from 0 to 1. Each element has 
  -- the subtype t_Byte, so each element is an 8-bit STD_LOGIC_VECTOR.
  TYPE t_Rom IS ARRAY (0 TO 1) OF t_Byte;
  ------------------------------------------------------------
  -- CREATE SIGNALS USING THE ARRAY TYPE
  ------------------------------------------------------------
  -- Both signals contain 2 elements. Each element can store one 8-bit value.
  SIGNAL store_value1_s : t_Rom;
  SIGNAL store_value2_s : t_Rom;
BEGIN
  ------------------------------------------------------------
  -- ASSIGN VALUES TO INDIVIDUAL ARRAY ELEMENTS
  ------------------------------------------------------------
  -- store_value1_s contains:
  -- index 0 = x"AB"
  -- index 1 = x"12"
  store_value1_s(0) <= x"AB";
  store_value1_s(1) <= x"12";

  -- store_value2_s contains:
  -- index 0 = x"FA"
  -- index 1 = x"AF"
  store_value2_s(0) <= x"FA";
  store_value2_s(1) <= x"AF";
END ARCHITECTURE sim;
