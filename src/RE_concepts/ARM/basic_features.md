# BASIC FEATURES

ARM : [ADVANCED RISC MACHINE](https://en.wikipedia.org/wiki/ARM_architecture)

- Instruction set is very small as compared to x86 but it has more GPRs.

- Instruction length is fixed(16 or 32) depending upon the state.

- It uses Load Store model for memory access.i.e data in memory cannot be directly manipulated, it must be moved to register to manipulate.-

- It uses `LDR` and `STR` instructions, for performing an operation on a data stored in a memory we need to load it into a resgister operate and then store it back.-

- It too provides privilege level(analogy ring 0 to ring 3 in x86).-

- In ARM privilege levels is defined by eight different modes.
  - User (USR)
  - Fast interrupt request (FIQ)
  - Interrupt request (IRQ)
  - Supervisor (SVC)
  - Monitor (MON)
  - Abort (ABT)
  - Undefi ned (UND)
  - System (SYS)

- ARM processor also operates in two states.
  - ARM state
  - Thumb state

- In ARM state instructions are always 32 bit but in Thumb state it can be both 32bit and 16 bit.

- 32 bit Thumb instructions have `w.` suffix.

- ARM also supports `conditional execution`.
  - suppose there are two instructios `1`,`2`, it is possible to manipulate that `2` will only be executed iff result of `1` is something desired.

- Another ARM feature , `barrel shifter`.
  - `MOV R1, R0, LSL #1` here `R1 = R0 << 1` or `R1 = R0 * 2`