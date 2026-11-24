LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i   : IN STD_LOGIC; -- Clock input.
    reset_i : IN STD_LOGIC; -- Asynchronous reset input.
    d_i     : IN STD_LOGIC; -- Data input.
    q_o     : OUT STD_LOGIC -- Register output.
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signal that stores the register value.
  SIGNAL dq_s : STD_LOGIC;
BEGIN
  -- Clocked process with an asynchronous reset.
  -- The process wakes up when either clk_i or reset_i changes.
  p_register : PROCESS (clk_i, reset_i) IS
  BEGIN
    -- Asynchronous reset:
    -- If reset_i becomes '1', clear the register immediately.
    -- There is no need to wait for a rising edge of clk_i.
    IF reset_i = '1' THEN
      dq_s <= '0';
      -- Normal register operation:
      -- This part is executed only on the rising edge of clk_i
      -- when reset_i is not active.
    ELSIF rising_edge(clk_i) THEN
      -- Feedback operation:
      -- The previous value of dq_s is ORed with d_i.
      -- The result is stored back into dq_s.
      dq_s <= dq_s OR d_i;
    END IF;
  END PROCESS p_register;
  -- Connect the stored value of dq_s to the output.
  q_o <= dq_s;
END ARCHITECTURE behavioral;
