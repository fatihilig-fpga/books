LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i      : IN STD_LOGIC;                    -- Clock input.
    reset_i    : IN STD_LOGIC;                    -- Synchronous reset.
    write_en_i : IN STD_LOGIC;                    -- Register write enable.
    read_en_i  : IN STD_LOGIC;                    -- Register read enable.
    reg_sel_i  : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- Selects a register.
    data_i     : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- Data to write.
    data_o     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0) -- Data read from the selected register.
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- Define an array containing three 3-bit registers.
  TYPE register_array_t IS ARRAY (0 TO 2) OF STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL register_s : register_array_t; -- Register bank.
BEGIN
  -- WRITE PROCESS: Data is written into the selected register at the rising edge of clk_i.
  p_write : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN -- Clear all registers when reset_i is active.
        register_s <= (OTHERS => (OTHERS => '0'));
      ELSIF write_en_i = '1' THEN -- Write only when write_en_i is active.
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
      data_o <= (OTHERS => '0'); -- Return zero when reading is disabled.
    END IF;
  END PROCESS p_read;
END ARCHITECTURE behavioral;
