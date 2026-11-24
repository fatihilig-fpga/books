LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
  PORT (
    a_i     : IN STD_LOGIC := '0'; -- Input A
    b_i     : IN STD_LOGIC := '0'; -- Input B
    c_i     : IN STD_LOGIC := '1'; -- Input C
    sel_1_i : IN STD_LOGIC := '1'; -- Select signal for Process 1
    sel_2_i : IN STD_LOGIC := '1'; -- Select signal for Process 2
    mux_o   : OUT STD_LOGIC        -- Final output
  );
END ENTITY MODULE_1;
ARCHITECTURE RTL OF MODULE_1 IS
  -- Internal signal connecting Process 1 to Process 2
  SIGNAL p_mux1_internal_signal_s : STD_LOGIC;
BEGIN
  -- Process 1 selects between NOT a_i and NOT b_i
  p_mux1 : PROCESS (ALL) IS
  BEGIN
    IF sel_1_i = '1' THEN
      p_mux1_internal_signal_s <= NOT a_i; -- Select NOT a_i
    ELSE
      p_mux1_internal_signal_s <= NOT b_i; -- Select NOT b_i
    END IF;
  END PROCESS p_mux1;
  -- Process 2 uses the result produced by Process 1
  p_mux2 : PROCESS (ALL) IS
  BEGIN
    IF sel_2_i = '0' THEN
      mux_o <= c_i AND p_mux1_internal_signal_s; -- AND operation
    ELSE
      mux_o <= c_i OR p_mux1_internal_signal_s; -- OR operation
    END IF;
  END PROCESS p_mux2;
END ARCHITECTURE RTL;
