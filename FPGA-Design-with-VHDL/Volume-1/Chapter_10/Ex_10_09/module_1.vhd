LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MODULE_1 IS
  PORT (
    radar_signal_a_i  : IN STD_LOGIC;
    radar_signal_b_i  : IN STD_LOGIC;
    radar_detection_o : OUT STD_LOGIC
  );
END ENTITY MODULE_1;

ARCHITECTURE behavioral OF MODULE_1 IS
  SIGNAL radar_signal_not_a_s : STD_LOGIC;
BEGIN
  -- REQ-001: The FPGA shall assert radar_detection_o when both radar_signal_a_i 
  -- and radar_signal_b_i are asserted.
  p_REQ_001 : PROCESS (radar_signal_a_i, radar_signal_b_i) BEGIN
    radar_detection_o <= radar_signal_a_i AND radar_signal_b_i;
  END PROCESS p_REQ_001;

  -- REQ-002: The FPGA shall generate radar_signal_not_a_s as the logical 
  -- inversion of radar_signal_a_i.
  p_REQ_002 : PROCESS (radar_signal_a_i) BEGIN
    radar_signal_not_a_s <= NOT radar_signal_a_i;
  END PROCESS p_REQ_002;
  --
END ARCHITECTURE behavioral;
