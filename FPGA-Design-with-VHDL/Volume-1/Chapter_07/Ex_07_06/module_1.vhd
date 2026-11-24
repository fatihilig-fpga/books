LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- severity_level is a built-in VHDL enumeration type. It can only use these values:
  -- NOTE, WARNING, ERROR, and FAILURE.
  -- You do not need to define this type yourself.
  SIGNAL note_level_s    : SEVERITY_LEVEL;
  SIGNAL warning_level_s : SEVERITY_LEVEL;
  SIGNAL error_level_s   : SEVERITY_LEVEL;
  SIGNAL failure_level_s : SEVERITY_LEVEL;
BEGIN
  -- Assign NOTE to note_level_s. NOTE is usually used for informational messages.
  note_level_s <= NOTE;
  -- Assign WARNING to warning_level_s.
  -- WARNING is usually used when something may cause a problem.
  warning_level_s <= WARNING;
  -- Assign ERROR to error_level_s. ERROR is usually used when something has gone wrong.
  error_level_s <= ERROR;
  -- Assign FAILURE to failure_level_s. FAILURE is usually used for a very serious problem.
  failure_level_s <= FAILURE;

END ARCHITECTURE sim;
