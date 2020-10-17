# x86 BASIC THEORY

Posses eight 32-bit general purpose registers (GPRS)

**EAX , EBX , ECX , EDX , EDI , ESI , EBP , and ESP**

**REGISTER PURPOSE**

---

ECX  : Counter in loops\
ESI    : Source in string/memory operations\
EDI   : Destination in string/memory operations\
EBP   : Base frame pointer\
ESP   : Stack pointer

The 32-bit EFLAGS register is used to store the status of arithmetic operations
and other execution states (e.g., trap flag). For example, if the previous “add”
operation resulted in a zero, the ZF flag will be set to 1. The flags in EFLAGS are
primarily used to implement conditional branching.

In addition to the GPRs, EIP , and EFLAGS , there are also registers that control
important low-level system mechanisms such as virtual memory, interrupts, and
debugging. For example, CR0 controls whether paging is on or off, CR2 contains
the linear address that caused a page fault, CR3 is the base address of a paging
data structure, and CR4 controls the hardware virtualization settings. DR0 – DR7
are used to set memory breakpoints.

**NOTE** :

```
Although there are seven debug registers, the system allows only four mem-
ory breakpoints (DR0–DR3). The remaining registers are used for status.
```
