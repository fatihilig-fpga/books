LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL A_s : STD_LOGIC := '0';
  SIGNAL B_s : STD_LOGIC := '0';
  SIGNAL C_s : STD_LOGIC := '0';
  SIGNAL F_s : STD_LOGIC;
BEGIN
  -- ---------------------------------------------
  -- SIMULATION-ONLY SECTION: Apply all possible input combinations.
  p_stimulus : PROCESS
  BEGIN
    -- m0 = 000
    A_s <= '0';
    B_s <= '0';
    C_s <= '0';
    WAIT FOR 10 ns;
    -- m1 = 001
    A_s <= '0';
    B_s <= '0';
    C_s <= '1';
    WAIT FOR 10 ns;
    -- m2 = 010
    A_s <= '0';
    B_s <= '1';
    C_s <= '0';
    WAIT FOR 10 ns;
    -- m3 = 011
    A_s <= '0';
    B_s <= '1';
    C_s <= '1';
    WAIT FOR 10 ns;
    -- m4 = 100
    A_s <= '1';
    B_s <= '0';
    C_s <= '0';
    WAIT FOR 10 ns;
    -- m5 = 101
    A_s <= '1';
    B_s <= '0';
    C_s <= '1';
    WAIT FOR 10 ns;
    -- m6 = 110
    A_s <= '1';
    B_s <= '1';
    C_s <= '0';
    WAIT FOR 10 ns;
    -- m7 = 111
    A_s <= '1';
    B_s <= '1';
    C_s <= '1';
    WAIT FOR 10 ns;
    WAIT;
  END PROCESS p_stimulus;
  -- ---------------------------------------------
  -- Sum-of-minterms implementation: F = A'BC' + A'BC + ABC' + ABC
  F_s <=  ((NOT A_s) AND B_s AND (NOT C_s)) OR
          ((NOT A_s) AND B_s AND C_s)       OR
          (A_s AND B_s AND (NOT C_s))       OR
          (A_s AND B_s AND C_s);
  -- ---------------------------------------------
END ARCHITECTURE behavioral;
