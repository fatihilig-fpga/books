LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    sel_i : IN STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    a_i   : IN STD_LOGIC                    := '1';
    b_i   : IN STD_LOGIC                    := '0';
    c_i   : IN STD_LOGIC                    := '0';
    d_i   : IN STD_LOGIC                    := '1';
    mux_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  p_mux : PROCESS (sel_i, a_i, b_i, c_i, d_i) IS
  BEGIN

    CASE sel_i IS

      WHEN "00" =>
        mux_o <= a_i;

      WHEN "01" =>
        mux_o <= b_i;
        
      WHEN "10" =>
        mux_o <= c_i;

      WHEN "11" =>
        mux_o <= d_i;

      WHEN OTHERS =>
        mux_o <= '0';
    END CASE;
  END PROCESS p_mux;

END ARCHITECTURE behavioral;
