LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i   : IN STD_LOGIC;
    reset_i : IN STD_LOGIC;
    led_o   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  -- 125 MHz clock: 62,500,000 clock cycles = 0.5 seconds.
  CONSTANT C_MAX_COUNT : INTEGER := 62_499_999;
  -- Counter used to create a slower timing interval.
  SIGNAL count_s : INTEGER RANGE 0 TO C_MAX_COUNT := 0;
  -- Stores the 4-bit LED count value.
  SIGNAL led_s : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
BEGIN
  -- Count clock cycles up to C_MAX_COUNT.
  p_counter : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        count_s <= 0;
      ELSE
        IF count_s = C_MAX_COUNT THEN
          count_s <= 0;
        ELSE
          count_s <= count_s + 1;
        END IF;
      END IF;
    END IF;
  END PROCESS p_counter;

  -- Increase the LED value whenever the counter reaches
  -- its maximum value.
  p_led_counter : PROCESS (clk_i) IS
  BEGIN
    IF rising_edge(clk_i) THEN
      IF reset_i = '1' THEN
        led_s <= (OTHERS => '0');
      ELSE
        IF count_s = C_MAX_COUNT THEN
          led_s <= led_s + 1;
        END IF;
      END IF;
    END IF;
  END PROCESS p_led_counter;

  -- Convert UNSIGNED to STD_LOGIC_VECTOR for the output port.
  led_o <= STD_LOGIC_VECTOR(led_s);

END ARCHITECTURE behavioral;
