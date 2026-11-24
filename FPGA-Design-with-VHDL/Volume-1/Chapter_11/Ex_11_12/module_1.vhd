LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
  PORT (
    a_i      : IN STD_LOGIC_VECTOR(2 DOWNTO 0) := "001"; -- Input A
    b_i      : IN STD_LOGIC_VECTOR(2 DOWNTO 0) := "010"; -- Input B
    c_i      : IN STD_LOGIC_VECTOR(2 DOWNTO 0) := "100"; -- Input C
    sel_i    : IN STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";  -- Select signal
    output_o : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)          -- 3-bit output
  );
END ENTITY MODULE_1;

ARCHITECTURE RTL OF MODULE_1 IS
BEGIN
  -- Select one of the 3-bit input vectors according to sel_i
  p_select : PROCESS (a_i, b_i, c_i, sel_i) IS
  BEGIN
    IF sel_i = "00" THEN
      output_o <= a_i; -- Select input A
    ELSIF sel_i = "01" THEN
      output_o <= b_i; -- Select input B
    ELSE
      output_o <= c_i; -- Select input C for other sel_i values
    END IF;
  END PROCESS p_select;
END ARCHITECTURE RTL;
