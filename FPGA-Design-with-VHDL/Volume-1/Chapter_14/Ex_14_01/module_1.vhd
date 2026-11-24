LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MODULE_1 IS
  PORT (
    data_i  :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    count_o :OUT UNSIGNED(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN

  p_count_ones : PROCESS (data_i)
    VARIABLE v_count : UNSIGNED(3 DOWNTO 0);
  BEGIN
    -- Initialize the counter
    v_count := (OTHERS => '0');

    -- Count the number of '1' bits
    FOR i IN data_i'REVERSE_RANGE LOOP
      IF data_i(i) = '1' THEN
        v_count := v_count + 1;
      END IF;
    END LOOP;

    -- Assign the final count to the output
    count_o <= v_count;

  END PROCESS p_count_ones;

END ARCHITECTURE behavioral;
