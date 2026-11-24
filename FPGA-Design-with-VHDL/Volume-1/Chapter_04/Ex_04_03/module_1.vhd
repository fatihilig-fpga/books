LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-- Entity declaration
-- The entity defines the public interface of MODULE_1.
ENTITY MODULE_1 IS
  PORT (
    -- This input port has no default value. It is also not driven by a testbench, another 
    -- module, or an external FPGA pin in this simulation.
    -- Therefore, its simulation value appears as 'U'.
    module_1_input_i : IN STD_LOGIC;

    -- This output port is declared here, but no assignment drives it inside the architecture.
    -- Therefore, its simulation value also appears as 'U'.
    module_1_output_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;
-- Architecture body
-- The architecture contains no internal declarations and no statements that drive the output 
-- port.
ARCHITECTURE behavioral OF MODULE_1 IS
  -- Declarative region
  -- No constants, signals, or other objects are declared here.
BEGIN
  -- Architecture statement region
  -- No concurrent assignment drives module_1_output_o.
END ARCHITECTURE behavioral;
