LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  GENERIC (
    -- G_DEBUG_EN is a boolean generic. It can be set to true or false before the design is 
    -- used. false means the debug option is disabled by default.
    G_DEBUG_EN : BOOLEAN := false
  );
  -- No ports are defined in this simple example.
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  -- flag_s is a boolean signal. It can only be true or false. It starts with an initial value 
  -- of false. Later in the architecture, true is assigned to it.
  SIGNAL flag_s : BOOLEAN := false;
  -- debug_active_s is another boolean signal.
  SIGNAL debug_active_s : BOOLEAN;
BEGIN
  -- Assign the generic value to the signal.
  -- If G_DEBUG_EN is true, debug_active_s becomes true.
  -- If G_DEBUG_EN is false, debug_active_s becomes false.
  debug_active_s <= G_DEBUG_EN;
  -- Assign true to flag_s.
  -- This shows that a boolean signal can be assigned true or false directly.
  flag_s <= true;
  -- Note:
  -- Boolean generics are often used to enable or disable optional parts of a design. 
END ARCHITECTURE sim;
