LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  GENERIC (
    DEPTH : INTEGER := 32
  );
  PORT (
    clk_i   : IN STD_LOGIC; -- Clock input.
    reset_i : IN STD_LOGIC; -- Synchronous reset input.
    d_i     : IN STD_LOGIC; -- Serial data input.
    q_o     : OUT STD_LOGIC -- Serial data output.
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
-- Vector representing the shift-register stages.
-- The number of stages is determined by the DEPTH generic.
-- In this example, DEPTH = 32. Therefore, DEPTH - 1 DOWNTO 0 becomes 31 DOWNTO 0.
-- This creates a 32-bit vector with indices from 31 to 0.
  SIGNAL stages_s : STD_LOGIC_VECTOR(DEPTH - 1 DOWNTO 0);
BEGIN
  -- Parameterized shift register. At each rising edge, the data moves forward by one stage.
  p_shift_register : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Synchronous reset: Clear all shift-register stages when reset_i is '1'.
      IF reset_i = '1' THEN
        stages_s <= ((OTHERS => '0'));
      ELSE
        -- Shift all stored values forward by one stage
        -- and place the current d_i value into the first stage.
        stages_s <= stages_s(DEPTH - 2 DOWNTO 0) & d_i;
      END IF;
    END IF;
  END PROCESS p_shift_register;
  -- Connect the final stage of the shift register to the output.
  q_o <= stages_s(DEPTH - 1);
END ARCHITECTURE behavioral;
