LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    A_i : IN  STD_LOGIC;
    B_i : IN  STD_LOGIC;
    C_i : IN  STD_LOGIC;
    F_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Combine the three inputs for the CASE statement.
  SIGNAL ABC_s : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
  -- Create a 3-bit input vector.
  ABC_s <= A_i & B_i & C_i;
  p_minterm_case : PROCESS (ABC_s) IS
  BEGIN
    CASE ABC_s IS
      -- F = 1 for m2, m3, m6, and m7.
      WHEN "010" =>
        F_o <= '1';
      WHEN "011" =>
        F_o <= '1';
      WHEN "110" =>
        F_o <= '1';
      WHEN "111" =>
        F_o <= '1';
      -- F = 0 for all other input combinations.
      WHEN OTHERS =>
        F_o <= '0';
    END CASE;

  END PROCESS p_minterm_case;

END ARCHITECTURE behavioral;
