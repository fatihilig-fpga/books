LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-- Note: Anything after “--" on the same line is ignored by VHDL tools which is a comment
-- Entity Declaration
ENTITY my_first_fpga IS
  GENERIC (
    G_MAX_COUNT : NATURAL := 255 -- := is used to assign an initial(starting) value
  );
  PORT (
    clk_i   : IN STD_LOGIC;                    -- Clock input
    reset_i : IN STD_LOGIC;                    -- Synchronous reset
    data_o  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- Counter data output
  );
END ENTITY my_first_fpga;

ARCHITECTURE behavioral OF my_first_fpga IS

  -- Declarative region: signals, constants, components
  SIGNAL count_reg_s : unsigned(7 DOWNTO 0) := (OTHERS => '0');

BEGIN
  -- Process: describes sequential (clocked) behaviour
  p_counter : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        -- `<=` is used when assigning a value
        -- (OTHERS => '0') : VHDL shorthand that sets all bits of a vector to zero
        count_reg_s <= (OTHERS => '0');
      ELSE
        IF count_reg_s = G_MAX_COUNT THEN
          count_reg_s <= (OTHERS => '0');
        ELSE
          count_reg_s <= count_reg_s + 1;
        END IF;
      END IF;
    END IF;
  END PROCESS p_counter;
  -- Concurrent signal assignment
  data_o <= STD_LOGIC_VECTOR(count_reg_s);

END ARCHITECTURE behavioral;
