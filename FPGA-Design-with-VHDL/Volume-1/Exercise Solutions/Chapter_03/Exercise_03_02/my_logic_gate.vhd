-- ============================================================
-- File    : my_logic_gate.vhd
-- Purpose : A simple 2-input AND gate (renamed entity)
-- ============================================================
-- Library
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- Entity declaration
ENTITY my_logic_gate IS
  PORT (
    a_i      : IN STD_LOGIC;
    b_i      : IN STD_LOGIC;
    result_o : OUT STD_LOGIC
  );
END ENTITY my_logic_gate;
-- Architecture body
ARCHITECTURE behavioral OF my_logic_gate IS
BEGIN
  result_o <= a_i AND b_i;
END ARCHITECTURE behavioral;
