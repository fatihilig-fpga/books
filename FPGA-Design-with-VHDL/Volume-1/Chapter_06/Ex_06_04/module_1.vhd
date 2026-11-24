LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- Create a new enumeration type.
  TYPE t_Control IS (IDLE, START, DONE);

  -- Create a subtype based on t_Control. This subtype allows only IDLE and START.
  SUBTYPE t_Control_Sub IS t_Control RANGE IDLE TO START;

  SIGNAL fsm_control_s     : t_Control;
  SIGNAL limited_control_s : t_Control_Sub;
BEGIN
  fsm_control_s     <= START;
  limited_control_s <= IDLE;
END ARCHITECTURE sim;
