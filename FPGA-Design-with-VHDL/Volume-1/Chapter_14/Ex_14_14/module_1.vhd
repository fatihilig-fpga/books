LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY MODULE_1 IS
  GENERIC (
    G_DATA_WIDTH : INTEGER := 8;
    G_DEPTH      : INTEGER := 4
  );
END ENTITY MODULE_1;
ARCHITECTURE rtl OF MODULE_1 IS
  TYPE t_shift_array IS
  ARRAY (0 TO G_DEPTH - 1) OF STD_LOGIC_VECTOR(G_DATA_WIDTH - 1 DOWNTO 0);
  SIGNAL shift_reg_s : t_shift_array := (OTHERS => (OTHERS => '0'));
  SIGNAL clk_s    : STD_LOGIC := '1';
  SIGNAL reset_s  : STD_LOGIC;
  SIGNAL data_i_s : STD_LOGIC_VECTOR(G_DATA_WIDTH - 1 DOWNTO 0);
  SIGNAL data_o_s : STD_LOGIC_VECTOR(G_DATA_WIDTH - 1 DOWNTO 0);
BEGIN
  -- -------------------------------
  -- SIMULATION-ONLY SECTION. 
  clk_s <= NOT clk_s AFTER 5 ns;
  --
  p_stimulus : PROCESS
  BEGIN
    reset_s  <= '1';
    data_i_s <= ((OTHERS => '0'));
    WAIT UNTIL rising_edge(clk_s);
    reset_s <= '0';
    WAIT UNTIL falling_edge(clk_s);
    WAIT UNTIL falling_edge(clk_s);
    data_i_s <= "00001111";
    WAIT UNTIL falling_edge(clk_s);
    data_i_s <= ((OTHERS => '0'));
    WAIT;
  END PROCESS p_stimulus;
  -- -------------------------------
  -- FOCUS ON THIS PART
  p_shift : PROCESS (clk_s)
  BEGIN
    IF rising_edge(clk_s) THEN
      IF reset_s = '1' THEN
        shift_reg_s <= (OTHERS => (OTHERS => '0'));
      ELSE
        -- New data enters the first stage
        shift_reg_s(0) <= data_i_s;
        -- Shift previous values to the next stages
        FOR i IN 1 TO G_DEPTH - 1 LOOP
          shift_reg_s(i) <= shift_reg_s(i - 1);
        END LOOP;
      END IF;
    END IF;
  END PROCESS p_shift;
  -- Output comes from the last stage
  data_o_s <= shift_reg_s(G_DEPTH - 1);
END ARCHITECTURE rtl;
