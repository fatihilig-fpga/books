LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i     : IN STD_LOGIC;                     -- Common clock input.
    reset_i   : IN STD_LOGIC;                     -- Synchronous reset.
    count_a_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- First counter output.
    count_b_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Second counter output.
    count_c_o : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)  -- Sum of the two counter values.
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Registers used by the two separate clocked processes.
  SIGNAL count_a_s : UNSIGNED(7 DOWNTO 0);
  SIGNAL count_b_s : UNSIGNED(7 DOWNTO 0);
  SIGNAL count_c_s : UNSIGNED(8 DOWNTO 0); -- Stores the sum of count_a_s and count_b_s.
BEGIN
  -- First clocked process. This process uses clk_i as its clock.
  p_counter_a : PROCESS (clk_i) IS BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        count_a_s <= (OTHERS => '0');
      ELSE
        count_a_s <= count_a_s + 1; -- Increase the first counter by 1.
      END IF;
    END IF;
  END PROCESS p_counter_a;
  -- Second clocked process.This process also uses the same clk_i signal.
  p_counter_b_c : PROCESS (clk_i) IS BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        -- Clear both registers controlled by this process.
        count_b_s <= (OTHERS => '0');
        count_c_s <= (OTHERS => '0');
      ELSE
        count_b_s <= count_b_s + 2; -- Increase the second counter by 2.
        -- Add the previous values of count_a_s and count_b_s
        -- and store the result in count_c_s.
        count_c_s <= ('0' & count_a_s) +  ('0' & count_b_s);
      END IF;
    END IF;
  END PROCESS p_counter_b_c;
  -- Connect the internal register values to the outputs.
  count_a_o <= STD_LOGIC_VECTOR(count_a_s);
  count_b_o <= STD_LOGIC_VECTOR(count_b_s);
  count_c_o <= STD_LOGIC_VECTOR(count_c_s);
END ARCHITECTURE behavioral;
