LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- used to change reset signal 
  SIGNAL reset_s  : STD_LOGIC;
  SIGNAL enable_s : STD_LOGIC;
  SIGNAL count_s  : UNSIGNED(7 DOWNTO 0);
  SIGNAL index_s  : INTEGER;
BEGIN
  ------------------------------------------------------------
  -- DO NOT WORRY ABOUT THIS PROCESS YET. NOT SYNTHESIZABLE.
  ------------------------------------------------------------
  PROCESS BEGIN
    reset_s <= '1';
    WAIT FOR 20 ns;
    reset_s <= '0';
    WAIT FOR 50 ns;
    reset_s <= '1';
    WAIT;
  END PROCESS;
  ------------------------------------------------------------
  p_reset_system : PROCESS (reset_s) BEGIN
    IF (reset_s = '1') THEN
      -- Reset state
      enable_s <= '0';
      count_s  <= (OTHERS => '0');
      index_s  <= 0;
    ELSE
      -- Normal operating state
      -- Assign different values to demonstrate how the signals change when reset is released.
      enable_s <= '1';
      count_s  <= x"AB";
      index_s  <= 10;
    END IF;
  END PROCESS p_reset_system;

END ARCHITECTURE behavioral;
