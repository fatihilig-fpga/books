LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- This signal is used to activate the process.
  SIGNAL trigger_process_s : STD_LOGIC := '0';
  -- These signals allow us to observe the final
  -- values of the variables in the Vivado waveform.
  SIGNAL reg_s  : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL temp_s : INTEGER := 10;
BEGIN
  ------------------------------------------------------------
  -- Simulation-only trigger
  ------------------------------------------------------------
  -- At 10 ns, trigger_process_s changes from '0' to '1'.
  -- This change activates p_variable.
  ------------------------------------------------------------
  trigger_process_s <= '1' AFTER 10 ns;
  ------------------------------------------------------------
  -- Variable assignment example
  ------------------------------------------------------------
  p_variable : PROCESS (trigger_process_s)
    -- Variables are declared in the process declarative region,
    -- between PROCESS and BEGIN.
    VARIABLE reg_v  : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
    VARIABLE temp_v : INTEGER := 10;
  BEGIN
    IF trigger_process_s = '1' THEN
      -- Assign an INTEGER value to temp_v.
      temp_v := 10;
      -- Assign '0' to bit 2 of reg_v.
      reg_v(2) := '0';
      -- Assign a complete binary value to reg_v.
      reg_v := "1111";
      -- Assign a hexadecimal value to reg_v.
      -- x"A" represents the 4-bit binary value "1010".
      reg_v := x"A";
      -- Assign another complete binary value to reg_v.
      reg_v := "1101";
      -- Assign a new INTEGER value to temp_v.
      temp_v := 15;
    END IF;
    -- Copy the final variable values to signals
    -- so they can be observed in the waveform.
    reg_s  <= reg_v;
    temp_s <= temp_v;
  END PROCESS p_variable;
END ARCHITECTURE behavioral;
