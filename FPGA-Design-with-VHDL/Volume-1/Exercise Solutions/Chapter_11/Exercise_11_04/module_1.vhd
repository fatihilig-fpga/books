-- Requires VHDL-2008
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    input_a_i   : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    input_b_i   : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    input_c_i   : IN STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
    request_a_i : IN STD_LOGIC := '0';
    request_b_i : IN STD_LOGIC := '0';
    result_o    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE RTL OF MODULE_1 IS
BEGIN
  p_priority : PROCESS (ALL) IS
  BEGIN
    IF request_a_i = '1' THEN      -- highest priority
      result_o <= input_a_i;
    ELSIF request_b_i = '1' THEN   -- checked only if request_a_i is not '1'
      result_o <= input_b_i;
    ELSE                           -- default when no request is active
      result_o <= input_c_i;
    END IF;
  END PROCESS p_priority;
END ARCHITECTURE RTL;
