LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i : IN STD_LOGIC; -- clk_i is the clock input.
    -- d_i is the data input of the D flip-flop.
    -- The value on this input will be sampled at the rising edge of clk_i.
    d_i : IN STD_LOGIC;
    -- q_o is the output of the D flip-flop.
    q_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS

BEGIN
  -- This process describes a rising-edge triggered D flip-flop.
  -- The process wakes up whenever clk_i changes.
  -- However, the assignment inside the IF statement happens only when clk_i changes from 
  -- '0' to '1'.
  p_register : PROCESS (clk_i) IS
  BEGIN
    -- Check for the rising edge of clk_i.
    -- At each rising edge: q_o receives the current value of d_i.
    IF rising_edge(clk_i) THEN
      q_o <= d_i;
    END IF;
  END PROCESS p_register;

END ARCHITECTURE behavioral;
