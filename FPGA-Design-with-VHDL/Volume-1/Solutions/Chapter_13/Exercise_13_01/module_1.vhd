LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- This signal is used to observe the final value of the variable in the waveform.
  SIGNAL count_result_s : INTEGER := 0;
BEGIN
  p_variable : PROCESS
    -- Variables are declared in the process declarative region.
    VARIABLE v_count : INTEGER := 0;
  BEGIN
    WAIT FOR 10 ns;
    -- v_count becomes 10 immediately.
    v_count := 10;
    -- The new value of v_count is already available, so 10 + 5 = 15.
    v_count := v_count + 5;
    -- Copy the variable to a signal so that the result can be seen in the waveform.
    count_result_s <= v_count;
    WAIT;
  END PROCESS p_variable;
END ARCHITECTURE behavioral;
