LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- Create a new enumeration type called t_Control. This type can only use the values listed 
  -- below: IDLE, START, and DONE. These names are user-defined values.
  TYPE t_Control IS (IDLE, START, DONE);

  -- Declare a signal named fsm_control_s. The type of this signal is t_Control.
  -- Therefore, fsm_control_s can only be assigned one of these values: IDLE, START, or DONE.
  SIGNAL fsm_control_s         : t_Control;

  -- Declare a signal named another_fsm_control_s.
  SIGNAL another_fsm_control_s : t_Control;
BEGIN
  -- Assign the START value to fsm_control_s. This is valid because START is one of the values
  -- listed in the t_Control type declaration. You can also assign IDLE or DONE as well.
  fsm_control_s <= START;
  --
  -- Assign the DONE value to another_fsm_control_s.
  another_fsm_control_s <= DONE;
END ARCHITECTURE sim;
