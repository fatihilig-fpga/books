# Chapter 2. Getting Started with Vivado

[← Back to the Solutions index](../README.md)

**Code files for this chapter** (add them to a Vivado project like the book examples):

| Exercise | Files                                                                                                            |
| -------- | ---------------------------------------------------------------------------------------------------------------- |
| 2.2      | [my_first_fpga.vhd](Exercise_02_02/my_first_fpga.vhd), [my_first_fpga_tb.vhd](Exercise_02_02/my_first_fpga_tb.vhd) |

`my_first_fpga.vhd` is the unchanged design file from Ex_02_01. Only the testbench `my_first_fpga_tb.vhd` changes: `C_MAX_COUNT` is now 15, and its comments have already been updated for the new maximum.

## Exercise 1 - Create the project again

Check that you completed these steps:

1. Create a new RTL project (Section 2.3), with the correct board or part selected.
2. Add `my_first_fpga.vhd` as a **design source** (Section 2.4.1).
3. Add `my_first_fpga_tb.vhd` as a **simulation source** (Section 2.4.2).
4. Confirm that `my_first_fpga_tb` is the top module under **sim\_1** in the Sources window.
5. Run **Behavioral Simulation** and check that the counter appears in the waveform.

If the simulation does not start, the most common causes are: the testbench was added as a design source instead of a simulation source, or the file was not saved (Ctrl + S) after pasting the code.

## Exercise 2 - Change the maximum count to 15

In `my_first_fpga_tb.vhd`, change the constant:

```vhdl
  -- The design will count from 0 to 15, then return to 0.
  CONSTANT C_MAX_COUNT : NATURAL := 15;
```

Save the file and relaunch the simulation. The testbench passes this value to the design through `GENERIC MAP (G_MAX_COUNT => C_MAX_COUNT)`, so the design file itself does not change.

**Expected result:** after reset is released, `data_s` counts 0, 1, 2 ... 15, then returns to 0 and continues 1, 2, 3 until the testbench applies reset again. The counter is 8 bits wide, so 15 fits easily (it could count up to 255).

## Exercise 3 - Why restart the simulation?

Vivado records waveform data only for signals that are in the waveform window while the simulation runs. A signal added after the simulation has already run has no recorded history, so it shows no values for the time that has already passed.

**Restart** returns the simulation to time zero (0 ns). After restarting, click **Run For** or **Run All** to run it again. Every signal in the waveform window, including the newly added ones, is then recorded from time zero, so you can see the reset period and the first clock edges. Clicking Run alone, without Restart, will not capture the new signals from the beginning.

Use **Relaunch Simulation** instead when you have changed and saved the VHDL code, because Restart does not recompile your VHDL code.

## Exercise 4 - Change the radix

| Radix                     | What you see for the value 10 | Comment                                            |
| ------------------------- | ----------------------------- | -------------------------------------------------- |
| Binary                    | `00001010`                  | Shows every bit, but long and hard to read quickly |
| Hexadecimal (the default) | `0x0A`                      | Short, useful when you think in groups of 4 bits   |
| Unsigned Decimal          | `10`                        | Matches the count directly                         |

**Unsigned Decimal** is the easiest format for this design, because `data_o` is a counter and the value you want to check is the count itself (0, 1, 2 ... maximum). This matches the tip in Section 2.7: use Unsigned Decimal for counters, and Binary when you need to see individual bit transitions.

---

[← Back to the Solutions index](../README.md)
