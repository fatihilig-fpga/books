# Chapter 1. What Is an FPGA?

[← Back to the Solutions index](../README.md)

## Exercise 1 - Artix-7 XC7A35T resources

The values below come from the AMD/Xilinx *7 Series FPGAs Data Sheet: Overview* (DS180), Table 4. This is the device used on the Basys 3 and the Arty A7-35T.

The data sheet counts LUTs and flip-flops in **slices**. In AMD/Xilinx 7 Series devices, each CLB contains two slices, and each slice contains four LUTs and eight flip-flops (you will meet slices again in Chapter 8).

| Resource | XC7A35T |
| --- | --- |
| Logic cells | 33,280 |
| Slices | 5,200 |
| LUTs (6-input, 4 per slice) | 20,800 |
| Flip-flops (8 per slice) | 41,600 |
| Block RAM | 50 × 36 Kb (= 100 × 18 Kb), 1,800 Kb in total |
| DSP slices | 90 |

The LUT and flip-flop counts are worked out from the slice count: 5,200 × 4 = 20,800 LUTs and 5,200 × 8 = 41,600 flip-flops.

Source: [DS180, 7 Series FPGAs Data Sheet: Overview](https://docs.amd.com/v/u/en-US/ds180_7Series_Overview).

## Exercise 2 - Everyday products that use FPGAs

Any three well-reasoned examples are correct. The three answers below are illustrative **product categories**, not verified product models. If you name a specific product, check the manufacturer's documentation or a published teardown to confirm that it uses an FPGA.

1. **Car driver-assistance cameras** (lane keeping, emergency braking). The camera produces a continuous stream of pixels that must be processed in real time with a fixed, predictable delay. An FPGA processes many pixels in parallel; a microcontroller handles them one instruction at a time and would be too slow.
2. **Mobile-network base stations, routers and network switches.** They must process gigabits of data per second, and the communication standards change over time. An FPGA gives the required speed and can be updated in the field with a new bitstream, without replacing the hardware.
3. **Medical imaging equipment (ultrasound, MRI) and digital oscilloscopes.** They sample signals at very high rates and must filter and process the samples immediately. An FPGA can build dedicated hardware pipelines, for example many filters running at the same time using DSP slices, which a microcontroller cannot do at these speeds.

The common reasons for choosing an FPGA over a microcontroller are true parallel processing, high data throughput, predictable timing, and the ability to change the hardware after the product is built.

## Exercise 3 - The FPGA design flow in your own words

1. **Write VHDL:** describe the hardware you want in VHDL source files.
2. **Simulate:** test the design on the computer with a testbench and check the waveforms before using real hardware.
3. **Synthesize:** the tool converts the VHDL into a netlist of logic elements such as LUTs and flip-flops.
4. **Implement (place and route):** the tool places that logic on real FPGA resources and connects them.
5. **Timing analysis:** the tool checks that signals reach their destinations within one clock period, using your timing constraints.
6. **Generate bitstream:** the implemented design is converted into a `.bit` configuration file.
7. **Program the FPGA:** the bitstream is loaded into the device, usually over JTAG through the USB cable, and the FPGA becomes the circuit you described.

---

[← Back to the Solutions index](../README.md)
