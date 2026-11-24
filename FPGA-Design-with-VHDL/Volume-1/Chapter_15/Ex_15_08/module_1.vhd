LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    A_i : IN  STD_LOGIC;
    B_i : IN  STD_LOGIC;
    C_i : IN  STD_LOGIC;
    F_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;
ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- Sum-of-minterms implementation:
  -- F = A'BC' + A'BC + ABC' + ABC
  F_o <= ((NOT A_i) AND B_i AND (NOT C_i)) OR
         ((NOT A_i) AND B_i AND C_i)       OR
         (A_i AND B_i AND (NOT C_i))       OR
         (A_i AND B_i AND C_i);
END ARCHITECTURE behavioral;
