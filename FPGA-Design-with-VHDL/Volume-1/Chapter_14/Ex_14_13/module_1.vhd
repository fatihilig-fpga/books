LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MODULE_1 IS
  GENERIC (
    G_DATA_WIDTH : INTEGER := 8;
    G_DEPTH      : INTEGER := 4
  );
  PORT (
    clk_i   : IN STD_LOGIC;
    reset_i : IN STD_LOGIC;
    data_i  : IN STD_LOGIC_VECTOR(G_DATA_WIDTH - 1 DOWNTO 0);
    data_o  : OUT STD_LOGIC_VECTOR(G_DATA_WIDTH - 1 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE rtl OF MODULE_1 IS
  TYPE t_shift_array IS
  ARRAY (0 TO G_DEPTH - 1) OF STD_LOGIC_VECTOR(G_DATA_WIDTH - 1 DOWNTO 0);

  SIGNAL shift_reg_s : t_shift_array := (OTHERS => (OTHERS => '0'));
BEGIN

  p_shift : PROCESS (clk_i)
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        shift_reg_s <= (OTHERS => (OTHERS => '0'));
      ELSE
        -- New data enters the first stage
        shift_reg_s(0) <= data_i;
        -- Shift previous values to the next stages
        FOR i IN 1 TO G_DEPTH - 1 LOOP
          shift_reg_s(i) <= shift_reg_s(i - 1);
        END LOOP;
      END IF;
    END IF;
  END PROCESS p_shift;

  -- Output comes from the last stage
  data_o <= shift_reg_s(G_DEPTH - 1);

END ARCHITECTURE rtl;
