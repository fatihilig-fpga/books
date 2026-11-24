LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i : IN STD_LOGIC;
    d_i   : IN STD_LOGIC;
    t_i   : IN STD_LOGIC;
    q_o   : OUT STD_LOGIC
  );
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL dq_s : STD_LOGIC;
BEGIN

  p_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      dq_s <= d_i AND t_i;
      q_o  <= NOT dq_s;
    END IF;
  END PROCESS p_register;

END ARCHITECTURE behavioral;
