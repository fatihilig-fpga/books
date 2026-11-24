LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-- Entity declaration
-- Generics and ports that form the public interface of MODULE_1 are declared here.
ENTITY MODULE_1 IS
  GENERIC (
    -- G_VALUE is a configurable generic value. Its default value is 10.
    -- A different value can be provided when MODULE_1 is instantiated.
    G_VALUE : INTEGER := 10
  );
  PORT (
    -- module_1_input_i is normally driven by another module, a testbench, or an external FPGA 
    -- pin. At this stage, those connection methods have not yet been introduced. Therefore, the     
    -- input is temporarily given a default value of logic '1' so that its behavior can be 
    -- observed during simulation. In a practical design, this input would normally be connected 
    -- to an external signal instead of relying on the default value.
    module_1_input_i  : IN  STD_LOGIC := '1';
    --
    -- module_1_output_o carries a result from inside MODULE_1 to another module or to an 
    -- external FPGA pin. You may wonder why we do not give this output port an initial value.
    -- In this example, module_1_output_o will be driven by logic inside the architecture, so an   
    -- initial value is not needed.
    --
    -- Remember the door analogy: an input port receives data from outside the module, while an 
    -- output port sends data produced inside the module.
    module_1_output_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;
--
-- Architecture body
-- The architecture describes the internal implementation of MODULE_1.
ARCHITECTURE behavioral OF MODULE_1 IS
  -- The area between ARCHITECTURE ... IS and BEGIN is called the declarative region of the 
  -- architecture. Internal constants and signals are declared here.
  -- C_MODULE1_VALUE is a constant local to this architecture.
  -- Its value is fixed at 255 and cannot be reassigned after declaration.
  CONSTANT C_MODULE1_VALUE : INTEGER := 255;

  -- Internal signals used to store the logical-operation results.
  SIGNAL and_result_s : STD_LOGIC;
  SIGNAL or_result_s  : STD_LOGIC;
  SIGNAL not_a_s      : STD_LOGIC;

  -- These signals demonstrate assignments from a constant and a generic.
  -- Their initial values are replaced by the concurrent assignments below.
  SIGNAL constant_counter_value_s : INTEGER := 15;
  SIGNAL generic_counter_value_s  : INTEGER := 5;

  -- Example internal logic signals.
  -- These initial values are used only to simplify the example.
  SIGNAL a_s : STD_LOGIC := '1';
  SIGNAL b_s : STD_LOGIC := '0';

BEGIN
  -- Signal assignments use the <= operator.

  -- Read the constant value and assign it to the signal. Although constant_counter_value_s is 
  -- initialized to 15, this concurrent assignment continuously drives it with 255.
  constant_counter_value_s <= C_MODULE1_VALUE;

  -- Read the generic value and assign it to the signal. G_VALUE can be configured when MODULE_1 
  -- is instantiated, but it cannot be reassigned inside this architecture.
  generic_counter_value_s <= G_VALUE;

  -- Apply the AND operator.
  -- '1' AND '0' produces '0'.
  and_result_s <= a_s AND b_s;

  -- Apply the OR operator.
  -- '1' OR '0' produces '1'.
  or_result_s <= a_s OR b_s;

  -- Apply the NOT operator to the entity input. Because module_1_input_i has a temporary 
  -- default value of '1', NOT '1' produces '0' during simulation.
  not_a_s <= NOT module_1_input_i;

  -- Connect the internal signal and_result_s to the output port. This allows the result to be 
  -- observed outside MODULE_1 or connected to another module. You can replace and_result_s with 
  -- or_result_s or not_a_s to observe the other logical-operation results.
  module_1_output_o <= and_result_s;

END ARCHITECTURE behavioral;
