LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i   : IN STD_LOGIC; -- Clock input.
    reset_i : IN STD_LOGIC; -- Reset input.
    d_i     : IN STD_LOGIC; -- Data input.
    q_o     : OUT STD_LOGIC -- Output of the register.
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signal that stores the register value.
  SIGNAL dq_s : STD_LOGIC;
BEGIN
  -- Clocked process.
  p_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- If reset_i is '1', clear the register.
      IF reset_i = '1' THEN
        dq_s <= '0';
      ELSE
        -- Feedback operation:
        -- The previous value of dq_s is ORed with d_i.
        -- The result is stored back into dq_s.
        dq_s <= dq_s OR d_i;
      END IF;
    END IF;
  END PROCESS p_register;

  -- Connect the stored value of dq_s to the output.
  q_o <= dq_s;
END ARCHITECTURE behavioral;
