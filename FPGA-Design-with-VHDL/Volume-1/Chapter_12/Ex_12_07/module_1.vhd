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
  -- This signal represents a 1-bit register. It remembers its value between clock edges.
  SIGNAL dq_s : STD_LOGIC;
BEGIN
  -- This process describes a register controlled by clk_i.
  -- The register updates only on a rising clock edge.
  p_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Please read the NOTE below to understand what is going on here.
      dq_s <= dq_s OR d_i;
    END IF;
  END PROCESS p_register;
  -- Connect the internal register value to the output.
  -- Whenever dq_s changes, q_o assigns its new value.
  q_o <= dq_s;
END ARCHITECTURE behavioral;
