LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS

  SIGNAL age_s    : INTEGER := 0;
  SIGNAL school_s : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN
  p_school : PROCESS (age_s) IS
  BEGIN
    CASE age_s IS
      WHEN 0 TO 2 =>
        school_s <= "000"; -- Day Care

      WHEN 3 | 4 =>
        school_s <= "001"; -- Pre-School

      WHEN 5 =>
        school_s <= "010"; -- Kindergarten

      WHEN 6 TO 11 =>
        school_s <= "011"; -- Elementary School

      WHEN OTHERS =>
        school_s <= "111"; -- Not Defined
    END CASE;
  END PROCESS p_school;

  ------------------------------------------------------------
  -- DO NOT WORRY ABOUT THIS PART YET. NOT SYNTHESIZABLE.
  -- It is used only to change age_s during simulation.
  ------------------------------------------------------------
  p_stimulus : PROCESS BEGIN
    age_s <= 1;
    WAIT FOR 20 ns;
    age_s <= 6;
    WAIT FOR 10 ns;
    age_s <= 5;
    WAIT FOR 10 ns;
    age_s <= 11;
    WAIT FOR 10 ns;
    age_s <= 4;
    WAIT FOR 10 ns;
    age_s <= 15;
    WAIT;
  END PROCESS p_stimulus;

END ARCHITECTURE behavioral;
