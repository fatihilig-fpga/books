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
  SIGNAL index_s  : INTEGER;
BEGIN

  -- First process
  p_enable : PROCESS (reset_i) BEGIN
    IF (reset_i = '1') THEN
      -- Reset state
      enable_s <= '0';
    ELSE
      -- Normal operating state
      enable_s <= '1';
    END IF;
  END PROCESS p_enable;

  -- Second process
  p_index : PROCESS (reset_i) BEGIN
    IF (reset_i = '1') THEN
      -- Reset state
      index_s <= 0;
    ELSE
      -- Normal operating state
      index_s <= 25;
    END IF;
  END PROCESS p_index;
END ARCHITECTURE behavioral;
