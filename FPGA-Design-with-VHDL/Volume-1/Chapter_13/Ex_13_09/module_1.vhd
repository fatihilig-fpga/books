LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL operand_a_s : UNSIGNED(7 DOWNTO 0)         := x"00";
  SIGNAL operand_b_s : UNSIGNED(7 DOWNTO 0)         := x"00";
  SIGNAL alu_op_s    : UNSIGNED(1 DOWNTO 0)         := "00";
  SIGNAL result_s    : STD_LOGIC_VECTOR(7 DOWNTO 0) := x"00";
  SIGNAL carry_s     : STD_LOGIC                    := '0';
BEGIN
  ------------------------------------------------------------
  -- SIMULATION-ONLY SECTION
  -- Do not focus on this part yet.
  -- This section is used only to generate input values for simulation.
  ------------------------------------------------------------
  p_stimulus : PROCESS
  BEGIN
    operand_a_s <= x"06";
    operand_b_s <= x"04";

    alu_op_s    <= "00"; -- ADD
    WAIT FOR 10 ns;

    alu_op_s <= "01"; -- SUBTRACT
    WAIT FOR 10 ns;

    alu_op_s <= "10"; -- AND
    WAIT FOR 10 ns;

    alu_op_s <= "11"; -- PASS-THROUGH
    WAIT FOR 10 ns;
    WAIT;
  END PROCESS p_stimulus;
  ------------------------------------------------------------
  -- 8-bit combinational ALU
  ------------------------------------------------------------
  p_alu : PROCESS (ALL) IS
    VARIABLE v_a      : UNSIGNED(8 DOWNTO 0);
    VARIABLE v_b      : UNSIGNED(8 DOWNTO 0);
    VARIABLE v_result : UNSIGNED(8 DOWNTO 0);
  BEGIN
    -- Extend the 8-bit operands to 9 bits.
    v_a := '0' & operand_a_s;
    v_b := '0' & operand_b_s;
    CASE alu_op_s IS
      WHEN "00" => -- ADD
        v_result := v_a + v_b;
      WHEN "01" => -- SUBTRACT
        v_result := v_a - v_b;
      WHEN "10" => -- AND
        v_result := '0' & (operand_a_s AND operand_b_s);
      WHEN OTHERS => -- PASS-THROUGH A
        v_result := v_a;
    END CASE;

    result_s <= STD_LOGIC_VECTOR(v_result(7 DOWNTO 0));
    -- The MSB represents the carry-out for addition.
    IF alu_op_s = "00" THEN
      carry_s <= v_result(8);
    ELSE
      carry_s <= '0';
    END IF;
  END PROCESS p_alu;

END ARCHITECTURE behavioral;
