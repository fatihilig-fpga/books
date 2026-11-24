LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  CONSTANT matrix_size_c     : INTEGER := 2;
  SIGNAL enable_set_matrix_s : STD_LOGIC;
  SIGNAL reset_s             : STD_LOGIC;
  TYPE t_matrix IS ARRAY (0 TO (matrix_size_c - 1), 0 TO (matrix_size_c - 1)) OF INTEGER;
  SIGNAL matrix_s : t_matrix;
BEGIN
  -- -------------------------------
  -- SIMULATION-ONLY SECTION: Do not focus on this part yet.
  p_stimulus : PROCESS BEGIN
    reset_s             <= '1';
    enable_set_matrix_s <= '0';
    WAIT FOR 20 ns;
    reset_s <= '0';
    WAIT FOR 10 ns;
    enable_set_matrix_s <= '1';
    WAIT FOR 20 ns;
    enable_set_matrix_s <= '0';
    WAIT FOR 10 ns;
    enable_set_matrix_s <= '1';
    WAIT;
  END PROCESS p_stimulus;
  -- -------------------------------
  -- FOCUS ON THIS PART
  p_set_matrix : PROCESS (enable_set_matrix_s, reset_s)
    VARIABLE matrix_v : t_matrix;
    VARIABLE cnt_v    : INTEGER;
  BEGIN
    IF (reset_s = '1') THEN
      matrix_v := (OTHERS => (OTHERS => 0));
      cnt_v    := 0;
    ELSE
      IF (enable_set_matrix_s = '1') THEN
        -- Initialize cnt_v before loop
        cnt_v := 0;
        --
        FOR Y IN 0 TO (matrix_size_c - 1) LOOP
          FOR X IN 0 TO (matrix_size_c - 1) LOOP
            cnt_v           := cnt_v + 1;
            matrix_v (Y, X) := cnt_v;
          END LOOP;
        END LOOP;
      ELSE
        matrix_v := (OTHERS => (OTHERS => 0));
        cnt_v    := 0;
      END IF;
    END IF;
    --
    matrix_s <= matrix_v;
  END PROCESS p_set_matrix;
  -- -------------------------------
END ARCHITECTURE behavioral;
