LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; -- Required for SIGNED and UNSIGNED types

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  --------------------------------------------------------------------
  -- Signed signals
  --------------------------------------------------------------------
  -- These signals represent signed 8-bit numbers.
  SIGNAL signed_a_s : SIGNED(7 DOWNTO 0);
  SIGNAL signed_b_s : SIGNED(7 DOWNTO 0);
  --------------------------------------------------------------------
  -- STD_LOGIC_VECTOR signals
  --------------------------------------------------------------------
  -- These signals contain the same bit patterns.
  -- However, STD_LOGIC_VECTOR does not define them as signed numbers.
  SIGNAL std_logic_vector_a_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL std_logic_vector_b_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
  --------------------------------------------------------------------
  -- Comparison results
  --------------------------------------------------------------------
  -- These signals show the result of each comparison.
  SIGNAL comparison_1_s : BOOLEAN;
  SIGNAL comparison_2_s : BOOLEAN;
BEGIN
  --------------------------------------------------------------------
  -- Assign values to the SIGNED signals
  --------------------------------------------------------------------
  -- "11111011" represents -5 as an 8-bit signed value.
  signed_a_s <= "11111011";
  -- "00000011" represents +3 as an 8-bit signed value.
  signed_b_s <= "00000011";
  --------------------------------------------------------------------
  -- Assign the same bit patterns to STD_LOGIC_VECTOR signals
  --------------------------------------------------------------------
  -- This signal contains the same bits as signed_a_s.
  std_logic_vector_a_s <= "11111011";
  -- This signal contains the same bits as signed_b_s.
  std_logic_vector_b_s <= "00000011";
  --------------------------------------------------------------------
  -- Compare the signals
  --------------------------------------------------------------------
  -- You have not learned the WHEN-ELSE statement yet. It assigns TRUE when the comparison is 
  -- true. Otherwise, it assigns FALSE. This compares two STD_LOGIC_VECTOR values.
  -- It does not perform a signed numeric comparison.
  comparison_1_s <= TRUE
                    WHEN std_logic_vector_a_s > std_logic_vector_b_s
                    ELSE FALSE;

  -- This compares two SIGNED values. VHDL correctly compares -5 and +3 as signed numbers.
  comparison_2_s <= TRUE
                    WHEN signed_a_s > signed_b_s
                    ELSE FALSE;
END ARCHITECTURE sim;
