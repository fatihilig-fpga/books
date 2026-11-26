# Chapter 4. VHDL Data Objects

[← Back to the Solutions index](../README.md)

## Exercise 1 - Constant declaration

```vhdl
CONSTANT C_MAX_VALUE : INTEGER := 99;
```

## Exercise 2 - Integer signal

```vhdl
SIGNAL count_s : INTEGER := 0;
```

## Exercise 3 - Constant vs generic

A **constant** is a fixed value written inside the design. To change it, you must edit the design file. A **generic** is a configurable value declared in the entity: it has a default value, but the module that instantiates it (for example, the top-level module) can give it a different value without editing the module.

Use a generic when the same module should be reusable with different settings, for example a counter whose maximum value, or a bus whose width, changes from one project to another. Use a constant for a value that belongs only to that module and should never change from outside.

## Exercise 4 - Generic declaration

```vhdl
GENERIC (
  G_MAX_COUNT : INTEGER := 10
);
```

The `GENERIC` clause is written inside the entity declaration, before the `PORT` clause.

## Exercise 5 - Three STD\_LOGIC signals

```vhdl
SIGNAL and_result_s : STD_LOGIC;
SIGNAL or_result_s  : STD_LOGIC;
SIGNAL not_a_s      : STD_LOGIC;
```

You can also declare them on one line: `SIGNAL and_result_s, or_result_s, not_a_s : STD_LOGIC;`

## Exercises 6, 7 and 8 - Concurrent signal assignments

```vhdl
and_result_s <= a_s AND b_s;  -- Exercise 6
or_result_s  <= a_s OR b_s;   -- Exercise 7
not_a_s      <= NOT a_s;      -- Exercise 8
```

## Exercise 9 - Expected values when a\_s = '1' and b\_s = '1'

| Signal | Value | Reason |
| --- | --- | --- |
| `and_result_s` | `'1'` | AND is '1' only when both inputs are '1' |
| `or_result_s` | `'1'` | OR is '1' when at least one input is '1' |
| `not_a_s` | `'0'` | NOT inverts '1' to '0' |

## Exercise 10 - What does U mean?

`U` means **Uninitialized**: the signal has never been given a value. It is the default starting value of every `STD_LOGIC` signal in simulation. Common reasons for seeing `U`:

- The signal was declared without an initial value and nothing has assigned to it yet. For example, a register before the first clock edge or reset.
- An input port is not connected to a testbench, another module or an FPGA pin, and has no default value.
- An output port is declared but never assigned inside the architecture.
- The signal is computed from another signal that is still `U`; for example, `NOT 'U'` is also `U`.

`U` exists only in simulation. Real hardware always holds '0' or '1', so `U` warns you that your simulation is not showing a defined value.

---

[← Back to the Solutions index](../README.md)
