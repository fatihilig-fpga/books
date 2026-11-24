LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL sel_s      : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
  SIGNAL data_out_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL valid_s    : STD_LOGIC;
BEGIN
  ------------------------------------------------------------
  -- DO NOT WORRY ABOUT THIS PROCESS YET. NOT SYNTHESIZABLE.
  -- It is used only to generate different values of sel_s during simulation.
  ------------------------------------------------------------
  p_stimulus: PROCESS
  BEGIN
    sel_s <= "00";
    WAIT FOR 10 ns;
    sel_s <= "01";
    WAIT FOR 10 ns;
    sel_s <= "11";
    WAIT FOR 20 ns;
    sel_s <= "10";
    WAIT FOR 20 ns;
    sel_s <= "00";
    WAIT;
  END PROCESS p_stimulus;
  ------------------------------------------------------------
  -- FOCUS ON THIS PROCESS.
  -- The CASE statement checks the value of sel_s.
  -- The matching WHEN choice determines the output values.
  ------------------------------------------------------------
  p_combinational : PROCESS (sel_s) IS
  BEGIN
    CASE sel_s IS

      WHEN "00" =>
        data_out_s <= x"AA";
        valid_s    <= '0';

      WHEN "01" =>
        data_out_s <= x"BB";
        valid_s    <= '1';

      WHEN OTHERS =>
        data_out_s <= (OTHERS => '0');
        valid_s    <= '0';
    END CASE;
  END PROCESS p_combinational;

END ARCHITECTURE behavioral;
