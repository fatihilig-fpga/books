-- Requires VHDL-2008
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    a_i      : IN STD_LOGIC := '0';
    b_i      : IN STD_LOGIC := '1';
    sel_i    : IN STD_LOGIC := '0';
    enable_i : IN STD_LOGIC := '1';
    y_o      : OUT STD_LOGIC
  );
END ENTITY MODULE_1;

ARCHITECTURE RTL OF MODULE_1 IS
  SIGNAL stage_1_s : STD_LOGIC;  -- output of the first multiplexer
BEGIN
  -- First multiplexer: selects a_i or b_i.
  p_stage_1 : PROCESS (ALL) IS
  BEGIN
    IF sel_i = '0' THEN
      stage_1_s <= a_i;
    ELSE
      stage_1_s <= b_i;
    END IF;
  END PROCESS p_stage_1;

  -- Second multiplexer: passes stage_1_s or forces '0'.
  p_stage_2 : PROCESS (ALL) IS
  BEGIN
    IF enable_i = '1' THEN
      y_o <= stage_1_s;
    ELSE
      y_o <= '0';
    END IF;
  END PROCESS p_stage_2;
END ARCHITECTURE RTL;
