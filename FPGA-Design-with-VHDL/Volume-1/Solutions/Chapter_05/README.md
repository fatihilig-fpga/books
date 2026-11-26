# Chapter 5. Essential VHDL Data Types

[← Back to the Solutions index](../README.md)

## Exercise 1 - Single-bit signals

```vhdl
SIGNAL enable_s : STD_LOGIC := '1';
SIGNAL ready_s  : STD_LOGIC := '0';
SIGNAL error_s  : STD_LOGIC;
```

## Exercise 2 - 8-bit vector

```vhdl
SIGNAL data_s : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
```

`(OTHERS => '0')` gives the same initial value and does not depend on the vector width.

## Exercise 3 - MSB and LSB

For `STD_LOGIC_VECTOR(7 DOWNTO 0)`, the **MSB is index 7** (the leftmost bit) and the **LSB is index 0** (the rightmost bit).

## Exercise 4 - Indexing

```vhdl
bit_3_s <= data_s(3);
```

## Exercise 5 - Slicing

```vhdl
upper_nibble_s <= data_s(7 DOWNTO 4);
```

The slice direction must match the declaration: for a `DOWNTO` vector, write the slice with `DOWNTO` too.

## Exercise 6 - Concatenation

```vhdl
combined_s <= upper_s & lower_s;
```

`upper_s` becomes bits 7 to 4 and `lower_s` becomes bits 3 to 0. For example, `"1010" & "0101"` gives `"10100101"`.

## Exercise 7 - Why UNSIGNED or SIGNED for arithmetic

`STD_LOGIC_VECTOR` is only a collection of bits; it has no numeric meaning. The pattern `"1111"` could be 15 or -1, and the standard `numeric_std` package does not define `+`, `-` or `<` for `STD_LOGIC_VECTOR`. `UNSIGNED` and `SIGNED` tell the tools exactly how to interpret the bits, as a positive number or a two's complement number, so arithmetic and comparisons are well defined and give the result you expect.

## Exercise 8 - Integer range

```vhdl
SIGNAL index_s : INTEGER RANGE 0 TO 15;
```

Because of the range, synthesis needs only 4 bits for this signal instead of 32.

## Exercise 9 - INTEGER, NATURAL or POSITIVE?

| Case | Best type | Reason |
| --- | --- | --- |
| A counter value that starts from 0 | `NATURAL` | Range 0 to maximum, never negative |
| A bus width that must be at least 1 | `POSITIVE` | Range 1 to maximum; a width of 0 would be an error |
| A value that may be negative | `INTEGER` | The only one of the three that allows negative values |

## Exercise 10 - BOOLEAN signal

```vhdl
SIGNAL is_valid_s : BOOLEAN := FALSE;
```

## Exercise 11 - The four types in your own words

`STD_LOGIC` is a single wire that can be '0', '1' or one of the other simulation values such as 'U', 'X' or 'Z'. `STD_LOGIC_VECTOR` is a group of `STD_LOGIC` bits treated as a bus with no numeric meaning. `UNSIGNED` and `SIGNED` are also groups of bits, but they represent numbers: `UNSIGNED` represents non-negative values (zero and positive integers), and `SIGNED` uses two's complement so it can also hold negative values.

## Exercise 12 - NATURAL vs UNSIGNED

Both can represent zero and positive values, but they are different types and are used in different ways.

| `UNSIGNED` | `NATURAL` |
| --- | --- |
| An array of bits | A subtype of `INTEGER` |
| Width is written explicitly, for example `UNSIGNED(7 DOWNTO 0)` | Range is written numerically, for example `NATURAL RANGE 0 TO 255` |
| Common for ports, registers, buses and bit-level logic | Common for counters, loop indices, generics and readable calculations |
| Can be indexed bit by bit, for example `count_u_s(0)` | Cannot normally be indexed bit by bit |
| Displays naturally in binary or hexadecimal | Written naturally as a decimal integer |

Use `UNSIGNED` when the bit width or individual bits are important. Use `NATURAL` when the value is more naturally expressed as a non-negative whole number, such as a loop index, generic parameter or counter limit.

---

[← Back to the Solutions index](../README.md)
