LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- Entity declaration
ENTITY MODULE_1 IS
  -- No input or output ports are needed in this example.
  -- Internal signals are used for simulation.
END ENTITY MODULE_1;

-- Architecture body
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Internal signals
  SIGNAL a_s       : STD_LOGIC;                    -- Multiplexer input A
  SIGNAL b_s       : STD_LOGIC;                    -- Multiplexer input B
  SIGNAL sel_s     : STD_LOGIC;                    -- Multiplexer select signal
  SIGNAL mux_s     : STD_LOGIC;                    -- Multiplexer output
  SIGNAL a_b_sel_s : STD_LOGIC_VECTOR(2 DOWNTO 0); -- Stores a_s, b_s, and sel_s together
BEGIN
  ------------------------------------------------------------
  -- DO NOT WORRY ABOUT THIS PROCESS YET. NOT SYNTHESIZABLE.
  -- It is used only to generate input values for simulation.
  ------------------------------------------------------------
  p_stimulus: PROCESS BEGIN
    a_b_sel_s <= "000"; -- a_s = 0, b_s = 0, sel_s = 0
    WAIT FOR 10 ns;
    a_b_sel_s <= "100"; -- a_s = 1, b_s = 0, sel_s = 0
    WAIT FOR 10 ns;
    a_b_sel_s <= "101"; -- a_s = 1, b_s = 0, sel_s = 1
    WAIT FOR 20 ns;
    a_b_sel_s <= "010"; -- a_s = 0, b_s = 1, sel_s = 0
    WAIT FOR 20 ns;
    a_b_sel_s <= "011"; -- a_s = 0, b_s = 1, sel_s = 1
    WAIT;               -- Stop here and wait forever
  END PROCESS p_stimulus;
  --
  sel_s <= a_b_sel_s(0); -- Bit 0 controls the select signal
  b_s   <= a_b_sel_s(1); -- Bit 1 becomes multiplexer input B
  a_s   <= a_b_sel_s(2); -- Bit 2 becomes multiplexer input A
  
  ------------------------------------------------------------
  -- FOCUS ON THIS PROCESS.
  -- This process describes a 2-to-1 multiplexer.
  ------------------------------------------------------------
  p_mux : PROCESS (a_s, b_s, sel_s) IS
  BEGIN
    IF sel_s = '0' THEN -- If sel_s is 0, select input A
      mux_s <= a_s;     -- Assign a_s to the output
    ELSE                -- Otherwise, sel_s is not 0
      mux_s <= b_s;     -- Assign b_s to the output
    END IF;
  END PROCESS p_mux;
  ------------------------------------------------------------

END ARCHITECTURE behavioral;
