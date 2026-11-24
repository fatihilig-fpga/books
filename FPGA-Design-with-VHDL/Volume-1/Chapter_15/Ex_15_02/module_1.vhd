LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY MODULE_1 IS
  PORT (
    clk_i          : IN STD_LOGIC;  -- FPGA clock input
    led_clk_o      : OUT STD_LOGIC; -- LED driven by the clock
    led_constant_o : OUT STD_LOGIC  -- LED held continuously ON
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
BEGIN

  -- Connect the FPGA clock directly to the first LED.
  led_clk_o <= clk_i;
  -- Keep the second LED continuously ON.
  led_constant_o <= '1';

END ARCHITECTURE behavioral;
