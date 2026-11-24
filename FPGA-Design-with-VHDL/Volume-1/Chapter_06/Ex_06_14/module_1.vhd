LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
END ENTITY MODULE_1;

ARCHITECTURE sim OF MODULE_1 IS
  --------------------------------------------------------------------
  -- Source signals
  --------------------------------------------------------------------
  -- slv_s is an 8-bit STD_LOGIC_VECTOR. STD_LOGIC_VECTOR is only a group of bits.
  -- It does not have numeric meaning by itself.
  SIGNAL slv_s : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00001010"; -- 10

  -- u_s is an 8-bit UNSIGNED signal. VHDL treats this as a positive binary number.
  SIGNAL u_s : UNSIGNED(7 DOWNTO 0) := "00000101"; -- 5

  -- s_s is an 8-bit SIGNED signal. VHDL treats this as a signed two's complement number.
  SIGNAL s_s : SIGNED(7 DOWNTO 0) := "11111011"; -- -5

  -- i_s is an INTEGER signal.
  SIGNAL i_s : INTEGER := 12;
  --------------------------------------------------------------------
  -- Conversion result signals
  --------------------------------------------------------------------
  -- STD_LOGIC_VECTOR to UNSIGNED
  SIGNAL slv_to_unsigned_s : UNSIGNED(7 DOWNTO 0);

  -- UNSIGNED to STD_LOGIC_VECTOR
  SIGNAL unsigned_to_slv_s : STD_LOGIC_VECTOR(7 DOWNTO 0);

  -- STD_LOGIC_VECTOR to SIGNED
  SIGNAL slv_to_signed_s : SIGNED(7 DOWNTO 0);

  -- SIGNED to STD_LOGIC_VECTOR
  SIGNAL signed_to_slv_s : STD_LOGIC_VECTOR(7 DOWNTO 0);

  -- UNSIGNED to INTEGER
  SIGNAL unsigned_to_integer_s : INTEGER;

  -- SIGNED to INTEGER
  SIGNAL signed_to_integer_s : INTEGER;

  -- INTEGER to UNSIGNED
  SIGNAL integer_to_unsigned_s : UNSIGNED(7 DOWNTO 0);

  -- INTEGER to SIGNED
  SIGNAL integer_to_signed_s : SIGNED(7 DOWNTO 0);

  -- UNSIGNED to SIGNED
  SIGNAL unsigned_to_signed_s : SIGNED(7 DOWNTO 0);

  -- SIGNED to UNSIGNED
  SIGNAL signed_to_unsigned_s : UNSIGNED(7 DOWNTO 0);
  --------------------------------------------------------------------
  -- Resize result signals
  --------------------------------------------------------------------
  -- 16-bit unsigned result
  SIGNAL unsigned_16_s : UNSIGNED(15 DOWNTO 0);

  -- 16-bit signed result
  SIGNAL signed_16_s : SIGNED(15 DOWNTO 0);

BEGIN
  --------------------------------------------------------------------
  -- STD_LOGIC_VECTOR <-> UNSIGNED
  --------------------------------------------------------------------
  -- Convert STD_LOGIC_VECTOR to UNSIGNED.
  slv_to_unsigned_s <= UNSIGNED(slv_s);

  -- Convert UNSIGNED to STD_LOGIC_VECTOR.
  unsigned_to_slv_s <= STD_LOGIC_VECTOR(u_s);
  --------------------------------------------------------------------
  -- STD_LOGIC_VECTOR <-> SIGNED
  --------------------------------------------------------------------
  -- Convert STD_LOGIC_VECTOR to SIGNED.
  slv_to_signed_s <= SIGNED(slv_s);

  -- Convert SIGNED to STD_LOGIC_VECTOR.
  signed_to_slv_s <= STD_LOGIC_VECTOR(s_s);
  --------------------------------------------------------------------
  -- UNSIGNED and SIGNED to INTEGER
  --------------------------------------------------------------------
  -- Convert UNSIGNED to INTEGER.
  unsigned_to_integer_s <= TO_INTEGER(u_s);

  -- Convert SIGNED to INTEGER.
  signed_to_integer_s <= TO_INTEGER(s_s);
  --------------------------------------------------------------------
  -- INTEGER to UNSIGNED and SIGNED
  --------------------------------------------------------------------
  -- Convert INTEGER to UNSIGNED. The second argument defines how many bits the result will 
  -- contain. For example, TO_UNSIGNED(i_s, 8) creates an 8-bit UNSIGNED value.
  integer_to_unsigned_s <= TO_UNSIGNED(i_s, 8);

  -- Convert INTEGER to SIGNED. The second argument again defines the width of the result.
  -- For example, TO_SIGNED(i_s, 8) creates an 8-bit SIGNED value.
  integer_to_signed_s <= TO_SIGNED(i_s, 8);
  --------------------------------------------------------------------
  -- UNSIGNED <-> SIGNED
  --------------------------------------------------------------------
  -- Convert UNSIGNED to SIGNED.
  unsigned_to_signed_s <= SIGNED(u_s);

  -- Convert SIGNED to UNSIGNED.
  signed_to_unsigned_s <= UNSIGNED(s_s);
  --------------------------------------------------------------------
  -- Resize examples
  -- RESIZE is useful when you need to connect a signal to a port or signal of a different 
  -- width. For UNSIGNED, it adds zeros at the front (zero-extension). For SIGNED, it    
  -- preserves the sign bit (sign-extension).
  -- Resize an 8-bit UNSIGNED signal to 16 bits.
  -- For UNSIGNED, this extends the value with zeros on the left.
  unsigned_16_s <= RESIZE(u_s, 16);

  -- Resize an 8-bit SIGNED signal to 16 bits. For SIGNED, this keeps the sign of the number.
  signed_16_s <= RESIZE(s_s, 16);

END ARCHITECTURE sim;
