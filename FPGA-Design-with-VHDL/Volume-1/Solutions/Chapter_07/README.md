# Chapter 7. Non-Synthesizable Types - Simulation Only

[← Back to the Solutions index](../README.md)

## Exercise 1 - Simulation-only types

**REAL, TIME, SEVERITY\_LEVEL and FILE** are the non-synthesizable types introduced in this chapter.

**BOOLEAN** and **UNSIGNED** are synthesizable: a BOOLEAN becomes a single bit (a condition), and UNSIGNED is a group of bits that becomes real wires and registers.

## Exercise 2 - REAL signals

```vhdl
SIGNAL temperature_s : REAL := 2.4;
SIGNAL scale_s       : REAL := 1.5;
SIGNAL calculated_s  : REAL;

-- In the architecture body:
calculated_s <= temperature_s * scale_s;  -- 2.4 * 1.5 = 3.6
```

REAL literals must include a decimal point (`2.4`, `1.5`, `1.0`), and both operands of `*` must be REAL.

## Exercise 3 - REAL in a generic calculation

```vhdl
ENTITY MODULE_1 IS
  GENERIC (
    G_CLK_FREQ_MHZ : REAL := 80.0
  );
END ENTITY MODULE_1;

-- In the architecture declarative region:
CONSTANT C_CLK_PERIOD_NS : REAL := 1000.0 / G_CLK_FREQ_MHZ;  -- 1000.0 / 80.0 = 12.5 ns
```

For 80 MHz the result is **12.5** (ns).

## Exercise 4 - TIME values

```vhdl
CONSTANT C_RESPONSE_DELAY : TIME := 35 ns;
SIGNAL   delay_time_s     : TIME := 250 ns;
```

A TIME value always needs a unit, with a space between the number and the unit.

## Exercise 5 - What WAIT FOR 25 ns; does

`WAIT FOR 25 ns;` pauses the process at that line for 25 ns of simulation time. While it waits, the rest of the design keeps running. After 25 ns, the process continues with the next statement. It is used in testbenches to hold an input value for a known time. It has no meaning in real hardware.

## Exercise 6 - 80 MHz clock

```vhdl
SIGNAL clk_s : STD_LOGIC := '0';

-- In the architecture body:
clk_s <= NOT clk_s AFTER 6.25 ns;
```

The clock changes every 6.25 ns (half a period), so the **complete period is 12.5 ns**, which is 1 / 12.5 ns = 80 MHz. The initial value `'0'` is required: without it `clk_s` starts as `'U'`, `NOT 'U'` is still `'U'`, and the clock never toggles.

## Exercise 7 - TIME constants for clocks

```vhdl
-- Half-period constants
CONSTANT C_HALF_PERIOD_25MHZ  : TIME := 20 ns;    -- period 40 ns  -> 25 MHz
CONSTANT C_HALF_PERIOD_40MHZ  : TIME := 12.5 ns;  -- period 25 ns  -> 40 MHz
CONSTANT C_HALF_PERIOD_125MHZ : TIME := 4 ns;     -- period 8 ns   -> 125 MHz

SIGNAL clk_25MHz_s  : STD_LOGIC := '0';
SIGNAL clk_40MHz_s  : STD_LOGIC := '0';
SIGNAL clk_125MHz_s : STD_LOGIC := '0';

-- In the architecture body:
clk_25MHz_s  <= NOT clk_25MHz_s  AFTER C_HALF_PERIOD_25MHZ;
clk_40MHz_s  <= NOT clk_40MHz_s  AFTER C_HALF_PERIOD_40MHZ;
clk_125MHz_s <= NOT clk_125MHz_s AFTER C_HALF_PERIOD_125MHZ;
```

## Exercise 8 - Measure a clock period in Vivado

1. Run the simulation and zoom in until you can see several clock cycles clearly.
2. Left-click the first **falling** edge of the clock signal.
3. Hold **Shift** and left-click the next falling edge.
4. Vivado shows the time difference between the two points. This is one complete clock period, for example 12.5 ns for the 80 MHz clock in Exercise 6.

You can also add two markers, place one on each falling edge, and read the time difference between them. Any two consecutive edges of the same type (falling-falling or rising-rising) give one full period. A rising edge to the next falling edge gives only half a period.

## Exercise 9 - SEVERITY\_LEVEL

```vhdl
SIGNAL severity_s : SEVERITY_LEVEL;

-- In the architecture body:
severity_s <= ERROR;
```

The four possible values are `NOTE`, `WARNING`, `ERROR` and `FAILURE`.

---

[← Back to the Solutions index](../README.md)
