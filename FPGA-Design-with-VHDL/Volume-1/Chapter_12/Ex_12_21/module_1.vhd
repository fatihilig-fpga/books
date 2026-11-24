LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
  GENERIC (
    -- Maximum counter value before the counter returns to zero.
    G_MAX_COUNT : INTEGER := 7
  );
  PORT (
    clk_i         : IN STD_LOGIC;        -- Clock input.
    reset_i       : IN STD_LOGIC;        -- Synchronous reset input.
    enable_i      : IN STD_LOGIC;        -- Counter enable input.
    max_reached_o : OUT STD_LOGIC;       -- Indicates that the maximum count has been reached.
    count_o       : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- Current counter value.
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- 8-bit register used to store the current counter value.
  SIGNAL count_s : UNSIGNED(7 DOWNTO 0);
BEGIN
  -- Clocked process that controls the counter.
  p_counter : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Synchronous reset:
      -- Clear the counter when reset_i is '1'.
      IF reset_i = '1' THEN
        count_s <= (OTHERS => '0');
      ELSIF (enable_i = '1') THEN
        -- Count only when enable_i is '1'. Otherwise keep the previous counter value.
        -- If the maximum count is reached, return the counter to zero.
        IF (count_s = G_MAX_COUNT) THEN
          count_s <= (OTHERS => '0');
        ELSE
          -- Increase the previous counter value by 1.
          count_s <= count_s + 1;
        END IF;
      END IF;
    END IF;
  END PROCESS p_counter;

  -- Convert the internal UNSIGNED counter value to STD_LOGIC_VECTOR for the output.
  count_o <= STD_LOGIC_VECTOR(count_s);

  -- Set max_reached_o to '1' when the counter reaches G_MAX_COUNT.
  max_reached_o <= '1' WHEN count_s = G_MAX_COUNT ELSE '0';

END ARCHITECTURE behavioral;
