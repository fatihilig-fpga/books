LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Signals used for this simulation example.
  SIGNAL clk_i     : STD_LOGIC := '0';             -- Common clock signal.
  SIGNAL reset_i   : STD_LOGIC;                    -- Synchronous reset signal.
  SIGNAL count_a_o : STD_LOGIC_VECTOR(7 DOWNTO 0); -- First counter output.
  SIGNAL count_b_o : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Second counter output.
  SIGNAL count_c_o : STD_LOGIC_VECTOR(8 DOWNTO 0); -- Sum output.
  -- Registers used by the two separate clocked processes.
  SIGNAL count_a_s : UNSIGNED(7 DOWNTO 0); -- First counter register.
  SIGNAL count_b_s : UNSIGNED(7 DOWNTO 0); -- Second counter register.
  SIGNAL count_c_s : UNSIGNED(8 DOWNTO 0); -- Stores the sum of count_a_s and count_b_s.
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION
  -- Do not focus on this part yet.
  -- This section is used only to generate the reset and clock
  -- signals required for the simulation.
  PROCESS BEGIN
    -- Activate the reset at the beginning of the simulation.
    reset_i <= '1';
    -- Keep the reset active for two rising edges.
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    -- Release the reset and allow the counters to operate normally.
    reset_i <= '0';
    WAIT;
  END PROCESS;
  -- Generate the clock for simulation.
  -- clk_i changes every 5 ns, giving a 10 ns clock period.
  clk_i <= NOT clk_i AFTER 5 ns;
  -- ---------------------------------------------  
  -- FOCUS ON THIS PART
  -- First clocked process. This process uses clk_i as its clock.
  p_counter_a : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        -- Clear the first counter register.
        count_a_s <= (OTHERS => '0');
      ELSE
        -- Increase the first counter by 1.
        count_a_s <= count_a_s + 1;
      END IF;
    END IF;
  END PROCESS p_counter_a;
  -- Second clocked process.
  -- This process also uses the same clk_i signal.
  p_counter_b_c : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        -- Clear both registers controlled by this process.
        count_b_s <= (OTHERS => '0');
        count_c_s <= (OTHERS => '0');
      ELSE
        -- Increase the second counter by 2.
        count_b_s <= count_b_s + 2;
        -- Add the previous values of count_a_s and count_b_s
        -- and store the result in count_c_s.
        count_c_s <= ('0' & count_a_s) +  ('0' & count_b_s);
      END IF;
    END IF;
  END PROCESS p_counter_b_c;
  -- Connect the internal register values to the output signals.
  count_a_o <= STD_LOGIC_VECTOR(count_a_s);
  count_b_o <= STD_LOGIC_VECTOR(count_b_s);
  count_c_o <= STD_LOGIC_VECTOR(count_c_s);
END ARCHITECTURE behavioral;
