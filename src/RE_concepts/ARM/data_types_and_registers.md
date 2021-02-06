# DATA TYPES AND REGISTERS
---

- There are `sixteen` 32 bit `GPRs`(General purpose registers).

- Ranging from `R0`,`R1`,...,`R15`.

- The first 12 registers are for normal use.

- `R13` : it is called as the stack pointer(SP).(analogy RSP/ESP in x86/x64). R13 points to the top of the stack

- `R14` : it is called as the link register(LR).It normally holds the return address when the function is being called.In a code which doesnot use as LR to store the return address , it can be used as a GPR.

- `R15` : It is called as the program counter(PC).