LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i   : IN STD_LOGIC;  -- Clock input.
    reset_i : IN STD_LOGIC;  -- Synchronous reset input.
    d_i     : IN STD_LOGIC;  -- Data input.
    q_o     : OUT STD_LOGIC  -- Register output.
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- Rising-edge D flip-flop with a synchronous reset.
  p_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Synchronous reset: checked only at the rising edge of clk_i.
      IF reset_i = '1' THEN
        q_o <= '0';
      ELSE
        -- Store the value of d_i.
        q_o <= d_i;
      END IF;
    END IF;
  END PROCESS p_register;
END ARCHITECTURE behavioral;
