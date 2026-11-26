LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i   : IN STD_LOGIC;
    reset_i : IN STD_LOGIC;
    led_o   : OUT STD_LOGIC
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- 125 MHz clock (PYNQ-Z1):
  -- 12,500,000 clock cycles = 0.1 seconds.
  CONSTANT C_MAX_COUNT : INTEGER := 12_499_999;
  -- For a 100 MHz clock (Basys 3, Arty A7) use instead:
  -- CONSTANT C_MAX_COUNT : INTEGER := 9_999_999;

  SIGNAL count_s : INTEGER RANGE 0 TO C_MAX_COUNT := 0;
  SIGNAL led_s   : STD_LOGIC := '0';
BEGIN

  p_led_blink : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        count_s <= 0;
        led_s   <= '0';
      ELSE
        IF count_s = C_MAX_COUNT THEN
          count_s <= 0;
          led_s   <= NOT led_s;
        ELSE
          count_s <= count_s + 1;
        END IF;
      END IF;
    END IF;
  END PROCESS p_led_blink;

  led_o <= led_s;

END ARCHITECTURE behavioral;
