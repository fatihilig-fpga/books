LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL clk_s   : STD_LOGIC := '0';
  SIGNAL data_s  : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL count_s : INTEGER RANGE 0 TO 4;

BEGIN
  -- -------------------------------
  -- SIMULATION-ONLY SECTION. 
  -- Clock generation for simulation
  clk_s <= NOT clk_s AFTER 5 ns;
  --
  p_stimulus : PROCESS
  BEGIN
    data_s <= "0001";
    WAIT FOR 10 ns;
    data_s <= "1011";
    WAIT FOR 10 ns;
    data_s <= "1111";
    WAIT FOR 10 ns;
    WAIT;
  END PROCESS p_stimulus;
  -- -------------------------------
  -- FOCUS ON THIS PART
  -- -------------------------------
  p_count_ones_seq : PROCESS (clk_s)
    VARIABLE v_count : INTEGER RANGE 0 TO 4;
  BEGIN
    IF rising_edge(clk_s) THEN

      v_count := 0;

      FOR i IN 0 TO 3 LOOP
        IF data_s(i) = '1' THEN
          v_count := v_count + 1;
        END IF;
      END LOOP;
      count_s <= v_count;
    END IF;
  END PROCESS p_count_ones_seq;
END ARCHITECTURE behavioral;
