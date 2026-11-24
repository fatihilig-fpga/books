LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- ============================================================
-- Entity declaration: This describes the outside of the building.
-- It tells us which wires enter and leave the module.
-- ============================================================
ENTITY fpga_city_block IS
  PORT (
    a_i      : IN STD_LOGIC; -- Input wire entering the building
    b_i      : IN STD_LOGIC; -- Another input wire entering the building
    result_o : OUT STD_LOGIC -- Output wire leaving the building
  );
END ENTITY fpga_city_block;
-- ============================================================
-- Architecture body
-- This describes what is built inside the building.
-- ============================================================
ARCHITECTURE behavioral OF fpga_city_block IS
  -- Declarative region: Internal signals can be declared here.
  -- These are wires used only inside this building.
  SIGNAL internal_result_s : STD_LOGIC;
BEGIN
  --------------------------------------------------------------
  -- NOTE: The <= symbol is the signal assignment operator in VHDL.
  -- In simple beginner terms, it means assign or drive the signal on
  -- the left using the expression on the right. In synthesizable code,
  -- this describes hardware logic or a connection.
  --
  -- If you already know Verilog or SystemVerilog, read the 
  -- NOTE: For Readers Familiar with Verilog or SystemVerilog” on the next page.
  --------------------------------------------------------------
  -- Internal logic inside the building:
  -- This creates combinational logic that performs an AND operation.
  -- In the FPGA city, this is like a small machine that looks at
  -- input wire a_i and input wire b_i, then produces a result.
  internal_result_s <= a_i AND b_i;
  --------------------------------------------------------------  
  -- Connect the internal result to the output port:
  -- This is like connecting an internal wire to the outside terminal
  -- of the building so other modules can use the result.
  result_o <= internal_result_s;
  --------------------------------------------------------------  
END ARCHITECTURE behavioral;
