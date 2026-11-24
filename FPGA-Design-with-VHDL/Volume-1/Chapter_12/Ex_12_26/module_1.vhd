LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Define an array containing three 3-bit registers.
  TYPE register_array_t IS ARRAY (0 TO 2) OF STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL register_s : register_array_t; -- Register bank.
  --
  SIGNAL clk_i      : STD_LOGIC := '0';             -- Clock input.
  SIGNAL reset_i    : STD_LOGIC;                    -- Synchronous reset.
  SIGNAL write_en_i : STD_LOGIC;                    -- Register write enable.
  SIGNAL read_en_i  : STD_LOGIC;                    -- Register read enable.
  SIGNAL reg_sel_i  : STD_LOGIC_VECTOR(1 DOWNTO 0); -- Selects a register.
  SIGNAL data_i     : STD_LOGIC_VECTOR(2 DOWNTO 0); -- Data to write.
  SIGNAL data_o     : STD_LOGIC_VECTOR(2 DOWNTO 0); -- Data read from the selected register.
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION. 
  clk_i <= NOT clk_i AFTER 5 NS;
  --
  PROCESS BEGIN
    -- Start with all control signals inactive.
    reset_i    <= '1';
    write_en_i <= '0';
    read_en_i  <= '0';
    reg_sel_i  <= "00";
    data_i     <= "000";
    -- Keep the synchronous reset active for two rising edges.
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    -- Release the reset.
    reset_i <= '0';
    -- ---------------------------------------------
    -- WRITE TO REGISTER 0
    -- Set the inputs before the next rising edge.
    WAIT UNTIL falling_edge(clk_i);
    write_en_i <= '1';
    reg_sel_i  <= "00";
    data_i     <= "001";
    -- ---------------------------------------------
    -- WRITE TO REGISTER 1
    WAIT UNTIL falling_edge(clk_i);
    reg_sel_i <= "01";
    data_i    <= "010";
    -- ---------------------------------------------
    -- WRITE TO REGISTER 2
    WAIT UNTIL falling_edge(clk_i);
    reg_sel_i <= "10";
    data_i    <= "100";
    -- Finish the write operation.
    WAIT UNTIL falling_edge(clk_i);
    write_en_i <= '0';
    data_i     <= "000";
    -- ---------------------------------------------
    -- READ FROM REGISTER 0
    read_en_i <= '1';
    reg_sel_i <= "00";
    WAIT FOR 10 ns;
    -- READ FROM REGISTER 1
    reg_sel_i <= "01";
    WAIT FOR 10 ns;
    -- READ FROM REGISTER 2
    reg_sel_i <= "10";
    WAIT FOR 10 ns;
    -- Disable reading.
    read_en_i <= '0';
    WAIT;
  END PROCESS;
  -- ------------------------------------------------
  -- WRITE PROCESS: Data is written into the selected register at the rising edge of clk_i.
  p_write : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN -- Clear all registers when reset_i is active.
        register_s <= (OTHERS => (OTHERS => '0'));
        -- Write only when write_en_i is active.
      ELSIF write_en_i = '1' THEN
        CASE reg_sel_i IS
            -- Write to the UART control register.
          WHEN "00" =>
            register_s(0) <= data_i;
            -- Write to the FIFO control register.
          WHEN "01" =>
            register_s(1) <= data_i;
            -- Write to the PWM control register.
          WHEN "10" =>
            register_s(2) <= data_i;
            -- No register is selected.
          WHEN OTHERS =>
            NULL;
        END CASE;
      END IF;
    END IF;
  END PROCESS p_write;
  -- ------------------------------------------------
  -- READ PROCESS: Read the selected register when read_en_i is active.
  p_read : PROCESS (register_s, read_en_i, reg_sel_i) IS
  BEGIN
    IF read_en_i = '1' THEN
      CASE reg_sel_i IS
        WHEN "00" =>
          data_o <= register_s(0);
        WHEN "01" =>
          data_o <= register_s(1);
        WHEN "10" =>
          data_o <= register_s(2);
        WHEN OTHERS       =>
          data_o <= (OTHERS => '0');
      END CASE;
    ELSE
      -- Return zero when reading is disabled.
      data_o <= (OTHERS => '0');
    END IF;
  END PROCESS p_read;
END ARCHITECTURE behavioral;
