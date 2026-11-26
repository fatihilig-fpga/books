LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i  : IN STD_LOGIC;
    data_i : IN STD_LOGIC;
    data_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  p_shift : PROCESS (clk_i)
    VARIABLE v_data : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  BEGIN
    IF rising_edge(clk_i) THEN
      v_data(3 DOWNTO 1) := v_data(2 DOWNTO 0);  -- 1) shift the old bits first
      v_data(0) := data_i;                       -- 2) then load the new bit
      data_o <= v_data;                          -- make the result visible
    END IF;
  END PROCESS p_shift;
END ARCHITECTURE behavioral;
