LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  --------------------------------------------------------------------
  -- Create a new enumeration type for a traffic light controller. This creates a new type 
  -- called t_Traffic_State. This type can only use the values listed below:
  -- ST_RED, ST_RED_AMBER, ST_GREEN, and ST_AMBER.

  -- Note: Enumeration values can be written on separate lines or on a single line.
  -- For example, this version is easier to read when there are several values:
  TYPE t_Traffic_State IS (
    ST_RED,
    ST_RED_AMBER,
    ST_GREEN,
    ST_AMBER
  );
  -- The same type can also be written on one line as shown below:
  -- TYPE t_Traffic_State IS (ST_RED, ST_RED_AMBER, ST_GREEN, ST_AMBER);
  -- Both versions are valid VHDL. The first version is often easier to read,
  -- especially when the enumeration type has many values.
  --------------------------------------------------------------------
  -- Declare a signal named current_state_s:
  -- The type of this signal is t_Traffic_State.
  -- Therefore, current_state_s can only be assigned one of these values:
  -- ST_RED, ST_RED_AMBER, ST_GREEN, or ST_AMBER.
  -- The signal is given an initial value of ST_RED.
  SIGNAL current_state_s : t_Traffic_State := ST_RED;

  -- Declare another signal using the same user-defined type.
  -- This signal also has the type t_Traffic_State.
  -- Therefore, it can also only use the values listed in the type.
  SIGNAL next_state_s : t_Traffic_State;

BEGIN
  -- Assign ST_GREEN to next_state_s.
  --
  next_state_s <= ST_GREEN;
  -- current_state_s starts with ST_RED because it was initialized when the signal was declared.

END ARCHITECTURE sim;
