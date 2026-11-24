LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
    SIGNAL clk_i      : STD_LOGIC := '0';             -- Clock input.
    SIGNAL reset_i    : STD_LOGIC;                    -- Reset control input.
    SIGNAL sel_i      : STD_LOGIC_VECTOR(1 DOWNTO 0); -- Selects one of four values.
    SIGNAL data_seq_o : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Registered output.
    SIGNAL data_com_o : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Combinational output.
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION. 
  clk_i <= NOT clk_i AFTER 5 NS;
  --
  PROCESS BEGIN
    sel_i    <= "00";
    reset_i  <= '1';
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    reset_i <= '0';
    WAIT UNTIL rising_edge(clk_i);
    sel_i <= "10";
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    sel_i <= "01";
    WAIT UNTIL rising_edge(clk_i);
    sel_i <= "00";
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    WAIT UNTIL rising_edge(clk_i);
    sel_i <= "11";
    WAIT;
  END PROCESS;
  -- ---------------------------------------------
  -- FOCUS ON THIS PART:
  -- SEQUENTIAL SELECTION LOGIC
  -- data_seq_o is stored in a register.
  -- The selected value is stored only at a rising edge of clk_i.
  p_write : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      -- Synchronous reset:
      -- Clear the registered output when reset_i is '1'.
      IF reset_i = '1' THEN
        data_seq_o <= (OTHERS => '0');
      ELSE
        -- Select which value will be stored in data_seq_o.
        CASE sel_i IS
          WHEN "00" =>
            data_seq_o <= x"01";
          WHEN "01" =>
            data_seq_o <= "00000010";
          WHEN "10" =>
            data_seq_o <= "0000" & "0100";
          WHEN "11" =>
            data_seq_o <= "0000" & "10" & "00";
          -- Keep the previous registered value for any other condition.
          WHEN OTHERS =>
            NULL;
        END CASE;
      END IF;
    END IF;
  END PROCESS p_write;
  -- 
  -- COMBINATIONAL SELECTION LOGIC
  -- data_com_o is not stored in a register.
  -- The selected value appears at the output without waiting for a rising edge of clk_i.
  PROCESS (ALL)
  BEGIN
    -- Set the combinational output to zero when reset_i is '1'.
    IF reset_i = '1' THEN
      data_com_o <= (OTHERS => '0');
    ELSE
      -- Select the output value directly according to sel_i.
      CASE sel_i IS
        WHEN "00" =>
          data_com_o <= x"01";
        WHEN "01" =>
          data_com_o <= "00000010";
        WHEN "10" =>
          data_com_o <= "0000" & "0100";
        WHEN "11" =>
          data_com_o <= "0000" & "10" & "00";
        -- No defined selection for any other condition.
        WHEN OTHERS =>
          NULL;
      END CASE;
    END IF;
  END PROCESS;
END ARCHITECTURE behavioral;
