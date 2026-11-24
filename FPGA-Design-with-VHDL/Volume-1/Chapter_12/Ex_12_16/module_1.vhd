LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i   : IN  STD_LOGIC; -- Clock input.
    reset_i : IN  STD_LOGIC; -- Synchronous reset input.
    d_i     : IN  STD_LOGIC; -- Serial data input.
    q_o     : OUT STD_LOGIC  -- Serial data output.
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signals representing the four register stages.
  SIGNAL stage_1_s : STD_LOGIC;
  SIGNAL stage_2_s : STD_LOGIC;
  SIGNAL stage_3_s : STD_LOGIC;
  SIGNAL stage_4_s : STD_LOGIC;
BEGIN
  -- Four-stage shift register.
  -- At each rising edge, the data moves one stage forward.
  p_shift_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Synchronous reset:
      -- Clear all four stages when reset_i is '1'.
      IF reset_i = '1' THEN
        stage_1_s <= '0';
        stage_2_s <= '0';
        stage_3_s <= '0';
        stage_4_s <= '0';
      ELSE
        -- Shift the data one stage forward.
        stage_1_s <= d_i;
        stage_2_s <= stage_1_s;
        stage_3_s <= stage_2_s;
        stage_4_s <= stage_3_s;
      END IF;
    END IF;
  END PROCESS p_shift_register;

  -- Connect the last stage of the shift register to the output.
  q_o <= stage_4_s;
END ARCHITECTURE behavioral;
