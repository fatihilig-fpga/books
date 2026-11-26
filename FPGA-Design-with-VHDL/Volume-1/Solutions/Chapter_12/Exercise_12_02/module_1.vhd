LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i   : IN STD_LOGIC; -- Clock input.
    reset_i : IN STD_LOGIC; -- Synchronous reset input.
    d_i     : IN STD_LOGIC; -- Serial data input.
    q_o     : OUT STD_LOGIC -- Serial data output.
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signals representing the five register stages.
  SIGNAL stages_s : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
  -- Five-stage shift register. At each rising edge, the data moves one stage forward.
  p_shift_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Synchronous reset: Clear all five stages when reset_i is '1'.
      IF reset_i = '1' THEN
        stages_s <= (OTHERS => '0');
      ELSE
        -- Shift the data one stage forward.
        stages_s(0)          <= d_i;
        stages_s(4 DOWNTO 1) <= stages_s(3 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS p_shift_register;

  q_o <= stages_s(4); -- Connect the last stage of the shift register to the output.
END ARCHITECTURE behavioral;
