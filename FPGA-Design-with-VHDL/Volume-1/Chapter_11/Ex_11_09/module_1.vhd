LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
  PORT (
    reset_i : IN STD_LOGIC := '1'
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL enable_s : STD_LOGIC;
  SIGNAL count_s  : UNSIGNED(7 DOWNTO 0);
  SIGNAL index_s  : INTEGER;
BEGIN
  p_reset_system : PROCESS (reset_i) BEGIN
    IF (reset_i = '1') THEN
      -- Reset state
      enable_s <= '0';
      count_s  <= (OTHERS => '0');
      index_s  <= 0;
    ELSE
      -- Normal operating state. Assign different values to demonstrate
      -- how the signals change when reset is released.
      enable_s <= '1';
      count_s  <= x"AB";
      index_s  <= 10;
    END IF;
  END PROCESS p_reset_system;

END ARCHITECTURE behavioral;
