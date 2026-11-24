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
    IF data_i(0) = '1' THEN
      v_count := v_count + 1;
    END IF;

    IF data_i(1) = '1' THEN
      v_count := v_count + 1;
    END IF;

    IF data_i(2) = '1' THEN
      v_count := v_count + 1;
    END IF;

    IF data_i(3) = '1' THEN
      v_count := v_count + 1;
    END IF;
    -- Assign the final count to the output
    count_o <= v_count;
  END PROCESS p_count_ones;
END ARCHITECTURE behavioral;
