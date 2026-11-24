LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i   : IN  STD_LOGIC;                     -- Clock input.
    reset_i : IN  STD_LOGIC;                     -- Synchronous reset.
    count_o : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)   -- Counter output.
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL count_s : UNSIGNED(2 DOWNTO 0); -- 3-bit counter can represent values from 0 to 7.
BEGIN
  p_counter : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN -- Clear the counter when reset is active.
        count_s <= (OTHERS => '0');
      ELSE
        count_s <= count_s + 1; -- Add 1 to the previous counter value.
      END IF;
    END IF;
  END PROCESS p_counter;
  count_o <= STD_LOGIC_VECTOR(count_s); -- Convert UNSIGNED counter value to STD_LOGIC_VECTOR.
END ARCHITECTURE behavioral;
