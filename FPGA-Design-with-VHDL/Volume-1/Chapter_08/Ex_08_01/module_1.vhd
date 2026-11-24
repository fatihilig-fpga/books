LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
ENTITY MODULE_1 IS
  PORT (
    -- Input: a_i is a STD_LOGIC signal. It is initialized to '1' for this example.
    a_i : IN STD_LOGIC := '1';
    -- Input: b_i is another STD_LOGIC signal. It is initialized to '0' for this example.
    b_i : IN STD_LOGIC := '0';
    -- Output: and_result_o will store the result of the AND operation.
    and_result_o : OUT STD_LOGIC;
    -- Output: or_result_o will store the result of the OR operation.
    or_result_o : OUT STD_LOGIC;
    -- Output: xor_result_o will store the result of the XOR operation.
    xor_result_o : OUT STD_LOGIC;
    -- Output: not_a_o will store the inverted value of a_i.
    not_a_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;
--
ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN
  -- Apply the AND operator to a_i and b_i.
  -- a_i = '1'
  -- b_i = '0'
  -- and_result_o = '1' AND '0' = '0'
  and_result_o <= a_i AND b_i;
  -- Apply the OR operator to a_i and b_i.
  -- a_i = '1'
  -- b_i = '0'
  -- or_result_o = '1' OR '0' = '1'
  or_result_o <= a_i OR b_i;
  -- Apply the XOR operator to a_i and b_i.
  -- a_i = '1'
  -- b_i = '0'
  -- xor_result_o = '1' XOR '0' = '1'
  xor_result_o <= a_i XOR b_i;
  -- Apply the NOT operator to a_i.
  -- a_i = '1'
  -- not_a_o = NOT '1' = '0'
  not_a_o <= NOT a_i;
END ARCHITECTURE behavioral;
