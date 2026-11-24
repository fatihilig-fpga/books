LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY MODULE_1 IS
  PORT (
    operand_a : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := x"12";
    operand_b : IN STD_LOGIC_VECTOR(7 DOWNTO 0) := x"ab";
    alu_op    : IN STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    result    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    carry_o   : OUT STD_LOGIC
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL alu_result_s : UNSIGNED(8 DOWNTO 0);
BEGIN
  p_alu : PROCESS (ALL) IS BEGIN
    CASE alu_op IS
      WHEN "00" => -- ADD
        alu_result_s <= ('0' & UNSIGNED(operand_a)) + ('0' & UNSIGNED(operand_b));
      --
      WHEN "01" => -- SUBTRACT
        alu_result_s <= ('0' & UNSIGNED(operand_a)) - ('0' & UNSIGNED(operand_b));
      --
      WHEN OTHERS => -- PASS-THROUGH
        alu_result_s <= '0' & UNSIGNED(operand_a);
      --
    END CASE;
  END PROCESS p_alu;
  result  <= STD_LOGIC_VECTOR(alu_result_s(7 DOWNTO 0));
  carry_o <= alu_result_s(8);
END ARCHITECTURE behavioral;
