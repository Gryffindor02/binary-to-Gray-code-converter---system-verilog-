# Binary to Gray Code Converter (SystemVerilog)

A simple, parameterized **Binary to Gray code converter** written in **SystemVerilog**, along with a **self-checking testbench**.

# What is Gray Code?

Gray code is a **binary numeral system** where **two successive values differ in only one bit**.

Use cases:
- Rotary encoders
- Reducing errors during transitions
- Digital communication

Compact form:

```text
gray = bin ^ (bin >> 1)
