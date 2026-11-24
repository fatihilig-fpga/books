LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- This signal is used to activate p_variable.
  SIGNAL trigger_process_s : STD_LOGIC := '0';
  -- This signal carries the variable value from p_variable to other parts of the architecture.
  SIGNAL shared_value_s : INTEGER := 0;
  -- This signal stores the result produced by p_reader.
  SIGNAL doubled_value_s : INTEGER := 0;
  -- This signal used for final value
  SIGNAL result_s :  INTEGER := 0;
BEGIN
  ------------------------------------------------------------
  -- Simulation-only trigger
  ------------------------------------------------------------
  -- At 10 ns, trigger_process_s changes from '0' to '1' and activates p_variable.
  ------------------------------------------------------------
  trigger_process_s <= '1' AFTER 10 ns;
  
  ------------------------------------------------------------
  -- PROCESS 1: Variable is local to this process
  ------------------------------------------------------------
  p_variable : PROCESS (trigger_process_s)
    -- v_count can only be accessed inside p_variable.
    VARIABLE v_count : INTEGER := 0;
  BEGIN
    IF trigger_process_s = '1' THEN
      -- v_count becomes 10 immediately.
      v_count := 10;
      -- The updated value is used immediately. v_count therefore becomes 15.
      v_count := v_count + 5;
      -- Pass the final variable value to an architecture-level signal.
      shared_value_s <= v_count;
    END IF;
  END PROCESS p_variable;

  ------------------------------------------------------------
  -- PROCESS 2: Reads the shared signal
  ------------------------------------------------------------
  p_reader : PROCESS (shared_value_s)
  BEGIN
    -- p_reader cannot access v_count directly. It can, however, read shared_value_s.
    doubled_value_s <= shared_value_s * 2;
  END PROCESS p_reader;

  ------------------------------------------------------------
  -- Concurrent output assignment
  ------------------------------------------------------------
  result_s <= doubled_value_s;

END ARCHITECTURE behavioral;
