LIBRARY IEEE; 
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  CONSTANT G_MAX_COUNT : INTEGER := 7;
  SIGNAL clk_i      : STD_LOGIC := '0'; -- Clock input.
  SIGNAL reset_i    : STD_LOGIC;        -- Synchronous reset input.
  SIGNAL enable_i   : STD_LOGIC;        -- Counter enable input.
  SIGNAL max_reached_o : STD_LOGIC;     -- Indicates that the maximum count has been reached.
  SIGNAL count_o    : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Current counter value.
  SIGNAL count_s : UNSIGNED(7 DOWNTO 0); -- register used to store the current counter value.
BEGIN
  -- SIMULATION-ONLY SECTION. This section generates the input values required for simulation.
  clk_i <= NOT clk_i AFTER 5 NS;
  --
  PROCESS BEGIN
    enable_i <= '0';
    reset_i  <= '1';
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    reset_i <= '0';
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    enable_i <= '1';
    WAIT FOR 200 ns;
    WAIT UNTIL rising_edge(clk_i);
    enable_i <= '0';
    WAIT;
  END PROCESS;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART: Clocked process that controls the counter.
  p_counter : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Synchronous reset: Clear the counter when reset_i is '1'.
      IF reset_i = '1' THEN
        count_s <= (OTHERS => '0');
      ELSIF (enable_i = '1') THEN
        -- Count only when enable_i is '1'. Otherwise keep the previous counter value.
        -- If the maximum count is reached, return the counter to zero.
        IF (count_s = G_MAX_COUNT) THEN
          count_s <= (OTHERS => '0');
        ELSE
          count_s <= count_s + 1; -- Increase the previous counter value by 1.
        END IF;
      END IF;
    END IF;
  END PROCESS p_counter;
  -- Convert the internal UNSIGNED counter value to STD_LOGIC_VECTOR for the output.
  count_o <= STD_LOGIC_VECTOR(count_s);
  -- Set max_reached_o to '1' when the counter reaches G_MAX_COUNT.
  max_reached_o <= '1' WHEN count_s = G_MAX_COUNT ELSE '0';
END ARCHITECTURE behavioral;
