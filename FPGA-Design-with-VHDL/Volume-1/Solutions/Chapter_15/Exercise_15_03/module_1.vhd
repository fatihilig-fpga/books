LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL A_s : STD_LOGIC := '0';
  SIGNAL B_s : STD_LOGIC := '0';
  SIGNAL C_s : STD_LOGIC := '0';
  -- Combine the three inputs for the CASE statement and WHEN...ELSE versions.
  SIGNAL ABC_s : STD_LOGIC_VECTOR(2 DOWNTO 0);
  -- One output for each implementation.
  SIGNAL F_sop_s  : STD_LOGIC;  -- 1. Boolean sum-of-minterms expression
  SIGNAL F_case_s : STD_LOGIC;  -- 2. CASE statement
  SIGNAL F_when_s : STD_LOGIC;  -- 3. WHEN...ELSE conditional signal assignment
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
  -- 1. Sum-of-minterms implementation: F = A'BC' + A'BC + ABC' + ABC
  F_sop_s <= ((NOT A_s) AND B_s AND (NOT C_s)) OR
             ((NOT A_s) AND B_s AND C_s)       OR
             (A_s AND B_s AND (NOT C_s))       OR
             (A_s AND B_s AND C_s);
  -- ---------------------------------------------
  -- Create a 3-bit input vector for implementations 2 and 3.
  ABC_s <= A_s & B_s & C_s;
  -- ---------------------------------------------
  -- 2. CASE statement implementation.
  p_minterm_case : PROCESS (ABC_s) IS
  BEGIN
    CASE ABC_s IS
      -- F = 1 for m2, m3, m6, and m7.
      WHEN "010" =>
        F_case_s <= '1';
      WHEN "011" =>
        F_case_s <= '1';
      WHEN "110" =>
        F_case_s <= '1';
      WHEN "111" =>
        F_case_s <= '1';
      -- F = 0 for all other input combinations.
      WHEN OTHERS =>
        F_case_s <= '0';
    END CASE;
  END PROCESS p_minterm_case;
  -- ---------------------------------------------
  -- 3. WHEN...ELSE implementation.
  F_when_s <= '1' WHEN ABC_s = "010" OR
                       ABC_s = "011" OR
                       ABC_s = "110" OR
                       ABC_s = "111"
                       ELSE '0';
  -- ---------------------------------------------
END ARCHITECTURE behavioral;
