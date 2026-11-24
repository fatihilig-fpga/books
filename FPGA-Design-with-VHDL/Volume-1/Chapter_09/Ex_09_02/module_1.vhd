LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-- Entity declaration
ENTITY MODULE_1 IS
  PORT (
    -- Inputs of the multiplexer
    a_i        : IN STD_LOGIC := '1';
    b_i        : IN STD_LOGIC := '0';
    -- Inputs used to generate the select condition
    control1_i : IN STD_LOGIC := '1';
    control2_i : IN STD_LOGIC := '0';
    -- Multiplexer output
    result_o   : OUT STD_LOGIC
  );
END ENTITY MODULE_1;
-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signals used to connect the logic gates
  SIGNAL sel_s        : STD_LOGIC;
  SIGNAL and_result_s : STD_LOGIC;
  SIGNAL or_result_s  : STD_LOGIC;
BEGIN
  -- Select a_i when sel_s = '1'. Otherwise, select b_i.
  result_o <= a_i WHEN sel_s = '1' ELSE b_i;
  -- First AND gate
  and_result_s <= control1_i AND control2_i;
  -- OR gate
  or_result_s <= control1_i OR control2_i;
  -- Generate the multiplexer select signal
  sel_s <= and_result_s AND or_result_s;
END ARCHITECTURE behavioral;
