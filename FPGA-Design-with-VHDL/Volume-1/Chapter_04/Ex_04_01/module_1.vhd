LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-- Entity Declaration
-- The entity describes the public interface of MODULE_1.
-- This is where we declare generics and ports that can be seen from outside the module.
ENTITY MODULE_1 IS
  GENERIC (
    -- G_VALUE is a generic. A generic is a configurable value.
    -- The top-level module can change this value when it creates MODULE_1.
    -- If the top-level module does not change it, the default value 10 is used.
    G_VALUE : INTEGER := 10
  );
  PORT (
    -- Example input and output ports for MODULE_1.
    module_1_input_i  : IN STD_LOGIC;
    module_1_output_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;
-- Architecture Body
-- The architecture describes the internal behavior of MODULE_1.
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Signals and constants used only inside MODULE_1 are written here.
  -- Constant declaration:
  -- C_MODULE1_VALUE is a constant declared inside the architecture. This means it belongs only   
  -- to MODULE_1. The top-level module cannot directly change this value. To change it, you must 
  -- edit this constant inside MODULE_1, here…
  CONSTANT C_MODULE1_VALUE : INTEGER := 255;
BEGIN
  -- Note: This code is intentionally simplified the BEGIN section has no statements because   
  -- this example only demonstrates where generics and constants are declared. A complete, 
  -- runnable example follows in Section 4.2.2.
  -- Example idea: Generic Usage
  -- If a counter inside MODULE_1 uses G_VALUE as its maximum count, then the top-level module 
  -- can control that maximum count. This is useful when you want the same module to be reusable 
  -- with different settings.
  -- Example idea: Constant Usage
  -- If a counter inside MODULE_1 uses C_MODULE1_VALUE as its maximum count, then the maximum 
  -- count is fixed inside MODULE_1. The top-level module cannot directly change 
  -- C_MODULE1_VALUE. You must edit the constant declaration above to change it.
END ARCHITECTURE behavioral;
