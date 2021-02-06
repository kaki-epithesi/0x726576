# DATA TYPES AND REGISTERS
---

- There are `sixteen` 32 bit `GPRs`(General purpose registers).

- Ranging from `R0`,`R1`,...,`R15`.

- The first 12 registers are for normal use.

- `R13` : it is called as the stack pointer(SP).(analogy RSP/ESP in x86/x64). R13 points to the top of the stack

- `R14` : it is called as the link register(LR).It normally holds the return address when the function is being called.In a code which doesnot use as LR to store the return address , it can be used as a GPR.

- `R15` : It is called as the program counter(PC).
    - `PC` points to the `current running address + 8` in `ARM state`, and `current running address + 4` in `Thumb state` .
    - Code can directly read from and write to PC. It will immediately cause its execution at the start of the address.

    - ![](/RE_concepts/ARM/pic/arm1.png)

    - After line 2 is executed R0 will hold the value of `0x8346+4`=`0x834a`

    - ![](/RE_concepts/ARM/pic/arm2.png)

    - When directly reading from `PC` it follows as a normal program counter.

- ARM stores information about the current execution state in the current program status register(`CPSR`).(Analogy `EFLAGS`)

![](/RE_concepts/ARM/pic/arm3.png)