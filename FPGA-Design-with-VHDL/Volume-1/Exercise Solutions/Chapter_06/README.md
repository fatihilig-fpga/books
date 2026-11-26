# Chapter 6. Arrays, User-Defined Types, and Type Conversions

[← Back to the Solutions index](../README.md)

## Exercise 1 - Enumeration type

```vhdl
TYPE t_Door_State IS (CLOSED, OPENING, OPENED, CLOSING);
SIGNAL door_state_s : t_Door_State := CLOSED;
```

Both lines go in the architecture declarative region, before `BEGIN`. The type must be declared before the signal that uses it.

## Exercise 2 - Use the enumeration signal

```vhdl
door_state_s <= OPENING;
```

`WAITING` cannot be assigned because a signal of type `t_Door_State` can hold only the values listed in the type declaration: `CLOSED`, `OPENING`, `OPENED` and `CLOSING`. The tool reports an error because `WAITING` is not one of them. To use it, you must first add `WAITING` to the list in `t_Door_State`.

## Exercise 3 - Integer subtype

```vhdl
SUBTYPE t_Percentage IS INTEGER RANGE 0 TO 100;
SIGNAL progress_s : t_Percentage := 0;
```

## Exercise 4 - Subtype error

No. `t_Percentage` allows only 0 to 100, and 120 is outside that range. As with the `t_Byte_Range` example and the value 300 in Section 6.2, Vivado reports an error because 120 does not fit within the subtype range. The subtype makes the intended range clear and helps the tools detect values that should never happen.

## Exercise 5 - One-dimensional array

```vhdl
TYPE t_Samples IS ARRAY (0 TO 3) OF INTEGER;
SIGNAL samples_s : t_Samples;
```

## Exercise 6 - Initialize and access elements

```vhdl
-- Declaration: every element starts at 0.
SIGNAL samples_s : t_Samples := (OTHERS => 0);

-- In the architecture body:
samples_s(0) <= 25;
samples_s(3) <= 75;
```

Result: `samples_s = (25, 0, 0, 75)`. The same result can be written as a single aggregate: `samples_s <= (0 => 25, 3 => 75, OTHERS => 0);`

## Exercise 7 - Unconstrained array type

```vhdl
TYPE t_Byte_Array IS ARRAY (NATURAL RANGE <>) OF STD_LOGIC_VECTOR(7 DOWNTO 0);

SIGNAL bytes_4_s  : t_Byte_Array(0 TO 3);   -- 4 elements
SIGNAL bytes_16_s : t_Byte_Array(0 TO 15);  -- 16 elements
```

The type leaves the index range open (`<>`). Each signal sets its own range when it is declared.

## Exercise 8 - Initialize an array of vectors

```vhdl
SIGNAL bytes_16_s : t_Byte_Array(0 TO 15) := (OTHERS => (OTHERS => '0'));
```

- The **outer** `OTHERS` selects every element of the array (all 16 bytes).
- The **inner** `OTHERS` selects every bit inside each 8-bit element and sets it to '0'.

## Exercise 9 - Two-dimensional array

```vhdl
TYPE t_Matrix IS ARRAY (0 TO 2, 0 TO 3) OF INTEGER;  -- 3 rows, 4 columns
SIGNAL matrix_s : t_Matrix := (OTHERS => (OTHERS => 0));

-- In the architecture body: row 1, column 2
matrix_s(1, 2) <= 9;
```

The first index is the row and the second index is the column, following the convention used in this chapter.

## Exercise 10 - Type conversions

```vhdl
unsigned_from_slv_s <= UNSIGNED(slv_s);            -- STD_LOGIC_VECTOR to UNSIGNED
slv_from_unsigned_s <= STD_LOGIC_VECTOR(unsigned_s); -- UNSIGNED to STD_LOGIC_VECTOR
integer_from_uns_s  <= TO_INTEGER(unsigned_s);     -- UNSIGNED to INTEGER
unsigned_from_int_s <= TO_UNSIGNED(integer_s, 8);  -- INTEGER to 8-bit UNSIGNED
```

The first two are **explicit type conversions**: the bits stay the same and only their meaning changes. `TO_INTEGER` and `TO_UNSIGNED` are **functions** provided by `IEEE.NUMERIC_STD`. `TO_UNSIGNED` needs the result width (8) because VHDL must know how many bits the result should contain. All four need `USE IEEE.NUMERIC_STD.ALL;`.

## Exercise 11 - TYPE vs SUBTYPE, and why conversions are explicit

`TYPE` creates a completely new type that cannot be mixed with other types, while `SUBTYPE` gives a new name or a restricted range to an existing type and stays compatible with it. VHDL is strongly typed, so the same bits can mean different things: a bus, a positive number, a negative number or an integer. Explicit conversions force you to state which meaning you want, so the tool never guesses and the hardware behaves exactly as you intended.

---

[← Back to the Solutions index](../README.md)
