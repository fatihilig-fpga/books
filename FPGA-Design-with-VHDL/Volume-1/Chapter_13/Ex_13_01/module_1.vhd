LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
  -- This signal is used to activate both processes.
  SIGNAL trigger_process_s : STD_LOGIC := '0';
  -- Signals used in the signal assignment example.
  SIGNAL signal_value_s  : STD_LOGIC := '0';
  SIGNAL signal_result_s : STD_LOGIC := '0';
  -- This signal is used to observe the value produced by the variable example.
  SIGNAL variable_result_s : STD_LOGIC := '0';
BEGIN
  ------------------------------------------------------------
  -- Simulation-only trigger
  ------------------------------------------------------------
  -- At 10 ns, trigger_process_s changes from '0' to '1'. Because both processes are sensitive 
  -- to this signal, the change activates both processes.
  ------------------------------------------------------------
  trigger_process_s <= '1' AFTER 10 ns;
  ------------------------------------------------------------
  -- PROCESS 1: Using a signal
  p_signal : PROCESS (trigger_process_s)
  BEGIN
    IF trigger_process_s = '1' THEN
      -- Schedule signal_value_s to become '1'.
      signal_value_s <= '1';
      -- signal_value_s has not changed yet. Therefore, this statement still reads its
      -- previous value, which is '0'.
      signal_result_s <= signal_value_s;
    END IF;
  END PROCESS p_signal;
  ------------------------------------------------------------
  -- PROCESS 2: Using a variable
  p_variable : PROCESS (trigger_process_s)
    -- Variables are declared in the process declarative region.
    VARIABLE v_value : STD_LOGIC := '0';
  BEGIN
    IF trigger_process_s = '1' THEN
      -- v_value becomes '1' immediately.
      v_value := '1';
      -- The new value of v_value is already available.
      -- Therefore, '1' is assigned to variable_result_s.
      variable_result_s <= v_value;
    END IF;
  END PROCESS p_variable;
END ARCHITECTURE behavioral;
