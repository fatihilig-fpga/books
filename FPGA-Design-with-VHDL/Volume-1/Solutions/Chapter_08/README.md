# Chapter 8. Operators and Attributes

[← Back to the Solutions index](../README.md)

## Exercise 1 - Single-bit logical results

With `a_i = '1'` and `b_i = '0'`:

| Assignment | Result |
| --- | --- |
| `and_result_s <= a_i AND b_i;` | `'0'` |
| `or_result_s  <= a_i OR b_i;` | `'1'` |
| `xor_result_s <= a_i XOR b_i;` | `'1'` (the inputs are different) |
| `not_a_s      <= NOT a_i;` | `'0'` |

## Exercise 2 - AND on vectors

| Bit | 3 | 2 | 1 | 0 |
| --- | --- | --- | --- | --- |
| `data_a_s` | 1 | 0 | 1 | 0 |
| `data_b_s` | 1 | 1 | 0 | 0 |
| AND | **1** | **0** | **0** | **0** |

`result_s = "1000"`. Only bit 3 is '1' in both vectors.

## Exercise 3 - Relational comparisons

As in Example 8.3, declare the values as `UNSIGNED` so that `<` compares them as numbers:

```vhdl
SIGNAL data_a_s : UNSIGNED(3 DOWNTO 0) := "1010";  -- decimal 10
SIGNAL data_b_s : UNSIGNED(3 DOWNTO 0) := "1100";  -- decimal 12
SIGNAL equal_s  : STD_LOGIC;
SIGNAL a_lt_b_s : STD_LOGIC;

-- In the architecture body:
equal_s  <= '1' WHEN data_a_s = data_b_s ELSE '0';
a_lt_b_s <= '1' WHEN data_a_s < data_b_s ELSE '0';
```

If `data_a_s` and `data_b_s` are `STD_LOGIC_VECTOR` signals, convert them first: `UNSIGNED(data_a_s) < UNSIGNED(data_b_s)`. For the values 10 and 12, `equal_s = '0'` and `a_lt_b_s = '1'`.

## Exercise 4 - The two meanings of <=

- `count_s <= next_count_s;` - here `<=` is the **signal assignment** operator: `count_s` receives the value of `next_count_s`.
- `equal_s <= '1' WHEN a_s <= b_s ELSE '0';` - the first `<=` is a **signal assignment** to `equal_s`. The second `<=`, inside the `WHEN` condition, is the relational operator **less than or equal to**.

The tool decides the meaning from where the symbol is used: at the start of a statement it is an assignment; inside a condition or expression it is a comparison.

## Exercise 5 - Why a numeric type

A `STD_LOGIC_VECTOR` is only a group of bits, so the tools do not know whether `"1000"` means 8 or -8. `UNSIGNED` and `SIGNED` give the bits a numeric meaning, so `+`, `-` and `<` produce the result you expect and the correct hardware (adders and comparators) is built. With the standard `numeric_std` package, arithmetic on `STD_LOGIC_VECTOR` is not even allowed.

## Exercise 6 - Addition width

- Largest value of each 8-bit `UNSIGNED` signal: 2^8 - 1 = **255**.
- Largest possible sum: 255 + 255 = **510**.
- Bits needed for 510: **9 bits** (a 9-bit `UNSIGNED` holds up to 511).

```vhdl
SIGNAL sum_s : UNSIGNED(8 DOWNTO 0);

sum_s <= ('0' & a_s) + ('0' & b_s);
```

A leading '0' extends each operand to 9 bits first, so the adder is 9 bits wide and the carry is kept in bit 8. `resize(a_s, 9) + resize(b_s, 9)` gives the same result.

## Exercise 7 - Signed subtraction

Assuming `a_s` and `b_s` are 8-bit `SIGNED` signals:

```vhdl
SIGNAL diff_s : SIGNED(8 DOWNTO 0);

diff_s <= resize(a_s, 9) - resize(b_s, 9);
```

10 - 12 = **-2**. In 9-bit two's complement, `diff_s = "111111110"`. `resize` sign-extends both operands, so their numeric value is not changed.

## Exercise 8 - Multiplication width

The largest product is 255 × 255 = 65,025, which needs **16 bits** (8 + 8).

```vhdl
SIGNAL product_s : UNSIGNED(15 DOWNTO 0);

product_s <= a_s * b_s;
```

In `numeric_std`, multiplying two 8-bit `UNSIGNED` values returns a 16-bit result, which matches `product_s` exactly.

## Exercise 9 - LUT-based vs DSP-based multiplication

A small multiplication, such as the 4-bit × 4-bit example in this chapter, needs only a little logic. Vivado can build it from LUTs and dedicated carry logic, without using a DSP slice. A wider multiplication, such as the 10-bit × 10-bit example, would need much more LUT logic, so Vivado uses a DSP slice: a dedicated arithmetic block optimized for multiplication. The exact choice depends on the operand widths, the FPGA device, the synthesis settings and the Vivado version.

## Exercise 10 - Divide by 2

`"00001101"` = 13. 13 / 2 = 6.5, but integer division drops the fractional part, so the result is **6** = `"00000110"`. In hardware, this is the same as shifting right by one position: the LSB ('1', which represents the 0.5) is discarded.

## Exercise 11 - Shift results

`value_s = "00001100"` = 12.

| Operation | Binary | Decimal |
| --- | --- | --- |
| `value_s SLL 1` | `00011000` | 24 (× 2) |
| `value_s SLL 2` | `00110000` | 48 (× 4) |
| `value_s SRL 1` | `00000110` | 6 (/ 2) |
| `value_s SRL 2` | `00000011` | 3 (/ 4) |

## Exercise 12 - Shifts with slicing and concatenation

For an 8-bit `UNSIGNED` signal `value_s`:

```vhdl
mul2_s <= value_s(6 DOWNTO 0) & '0';    -- multiply by 2 (shift left 1)
mul4_s <= value_s(5 DOWNTO 0) & "00";   -- multiply by 4 (shift left 2)
div2_s <= '0'  & value_s(7 DOWNTO 1);   -- divide by 2 (shift right 1)
div4_s <= "00" & value_s(7 DOWNTO 2);   -- divide by 4 (shift right 2)
```

All four results are 8 bits wide. With `value_s = 12`, they give 24, 48, 6 and 3, the same results as Exercise 11.

## Exercise 13 - Discarded bits

`value_s = "11010010"`.

| Operation | Result | Bits discarded |
| --- | --- | --- |
| Shift left by 1 | `10100100` | bit 7 = `1` |
| Shift left by 2 | `01001000` | bits 7 and 6 = `11` |
| Shift right by 1 | `01101001` | bit 0 = `0` |
| Shift right by 2 | `00110100` | bits 1 and 0 = `10` |

Shifting left loses '1' bits here, so the result no longer equals value × 2 or × 4 (an overflow). Shifting right loses only the low bits, which is the remainder of the division.

## Exercise 14 - Shift vs rotate

In a **logical shift** (such as `SLL` or `SRL`), bits that leave one end of the vector are discarded, and zeros enter the empty positions at the other end. Other shift operations can fill the empty positions differently; for example, an arithmetic right shift copies the sign bit. In a **rotate**, bits that leave one end come back in at the other end, so no bits are lost. For example, `"10010011" ROL 1 = "00100111"`, while `"10010011" SLL 1 = "00100110"`.

## Exercise 15 - Attributes with a descending range

For `STD_LOGIC_VECTOR(7 DOWNTO 0)`: `'LEFT = 7`, `'RIGHT = 0`, `'HIGH = 7`, `'LOW = 0`, `'LENGTH = 8`.

## Exercise 16 - Attributes with an ascending range

For `STD_LOGIC_VECTOR(0 TO 7)`: `'LEFT = 0`, `'RIGHT = 7`, `'HIGH = 7`, `'LOW = 0`, `'LENGTH = 8`.

`'LEFT` and `'RIGHT` give the indexes in the order they are written in the declaration. `'HIGH` and `'LOW` always give the largest and smallest index. With `DOWNTO`, the left index is the highest; with `TO`, the left index is the lowest. So `'LEFT` equals `'HIGH` only for descending ranges.

## Exercise 17 - Declare a signal using 'RANGE

Assuming `input_data_s` is a `STD_LOGIC_VECTOR`:

```vhdl
SIGNAL output_data_s : STD_LOGIC_VECTOR(input_data_s'RANGE);
```

If the width or direction of `input_data_s` changes, `output_data_s` follows automatically.

## Exercise 18 - 'LENGTH in a conversion

```vhdl
count_s <= TO_UNSIGNED(data_s, count_s'LENGTH);
```

The width now comes from `count_s` itself, so the code stays correct if `count_s` is made wider or narrower.

## Exercise 19 - Parentheses

```vhdl
result_s <= (a_s + b_s) * c_s;   -- addition first
result_s <= a_s + (b_s * c_s);   -- multiplication first
```

Without parentheses, VHDL performs `*` before `+`, so the original statement is the same as the second version. The two versions give different results: with a = 2, b = 3, c = 4, the first gives 20 and the second gives 14. Remember that `result_s` must also be wide enough for the result (see Exercises 6 and 8).

## Exercise 20 - Hardware meaning

Any well-explained expression is correct. Two examples:

- **`sum_s <= resize(a_s, 9) + resize(b_s, 9);`** - Vivado builds a 9-bit adder using LUTs and the dedicated carry chain (CARRY4 blocks). The carry chain passes the carry quickly from one bit to the next, so the addition is fast.
- **`a_lt_b_s <= '1' WHEN a_s < b_s ELSE '0';`** - Vivado builds a magnitude comparator from LUTs (usually also with the carry chain). Its single-bit output drives the `a_lt_b_s` wire.

---

[← Back to the Solutions index](../README.md)
