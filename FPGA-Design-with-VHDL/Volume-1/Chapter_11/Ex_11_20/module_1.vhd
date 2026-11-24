LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    a_i      : IN STD_LOGIC := '0';
    b_i      : IN STD_LOGIC := '0';
    c_i      : IN STD_LOGIC := '0';
    sel_1_i  : IN STD_LOGIC := '0';
    sel_2_i  : IN STD_LOGIC := '0';
    result_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL stage_1_s : STD_LOGIC;
BEGIN

  p_case_1 : PROCESS (a_i, b_i, sel_1_i) IS
  BEGIN
    CASE sel_1_i IS
      WHEN '0' =>
        stage_1_s <= a_i AND b_i;
      WHEN '1' =>
        stage_1_s <= a_i OR b_i;
      WHEN OTHERS =>
        stage_1_s <= 'X';
    END CASE;
  END PROCESS p_case_1;
  --
  p_case_2 : PROCESS (stage_1_s, c_i, sel_2_i) IS
  BEGIN
    CASE sel_2_i IS
      WHEN '0' =>
        result_o <= stage_1_s AND c_i;
      WHEN '1' =>
        result_o <= stage_1_s OR c_i;
      WHEN OTHERS =>
        result_o <= 'X';
    END CASE;
  END PROCESS p_case_2;

END ARCHITECTURE behavioral;
