LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i : IN STD_LOGIC; -- Clock input.
    d_i   : IN STD_LOGIC; -- Input value used to update the register.
    q_o   : OUT STD_LOGIC -- Output showing the stored register value.
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL dq_s : STD_LOGIC;
BEGIN
  p_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      dq_s <= dq_s OR d_i;
    END IF;
  END PROCESS p_register;
END ARCHITECTURE behavioral;
