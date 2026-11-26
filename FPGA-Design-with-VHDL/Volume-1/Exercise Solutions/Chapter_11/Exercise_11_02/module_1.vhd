LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    input_a_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    input_b_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    sel_i     : IN STD_LOGIC := '0';
    result_o  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE RTL OF MODULE_1 IS
BEGIN
  -- Combinational process: every signal that is read is in the list.
  p_mux : PROCESS (sel_i, input_a_i, input_b_i) IS
  BEGIN
    IF sel_i = '0' THEN
      result_o <= input_a_i;
    ELSE
      result_o <= input_b_i;
    END IF;
  END PROCESS p_mux;
END ARCHITECTURE RTL;
