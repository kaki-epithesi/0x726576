# WINDOWS FUNDAMENTALS

## Memory Layout
---
-> Divides virtual address space in two space , kernel space and user space .\
-> On x86 and ARM upper 2gb is reserved for kernel processes and lower 2 gb for user processes.\
-> Virtual address in user space is from 0x00 to 0x7fffffff, and 0x80000000 to 0xffffffff.\
-> x64 , user space from 0 to 0x000007ff'ffffffff  and kernel space 0xffff0800'00000000 to above.\
-> Running processes only have access to user space but kernel mode has access to both user space and kernel space.

## Processor Initialization
---

When kernel boots up it performs some basic initialization for each processor.

**The Processor control region (PCR)**\
-> per processor structure that stores critical information and state .\
e.g: ox x86 it contains the base address of [IDT](https://en.wikipedia.org/wiki/Interrupt_descriptor_table) and current [IRQL](https://en.wikipedia.org/wiki/IRQL_(Windows)).

> `IDT` : The Interrupt Descriptor Table (IDT) is a data structure used by the x86 architecture to implement an interrupt vector table. The IDT is used by the processor to determine the correct response to interrupts and exceptions.

> `IRQL` : An Interrupt Request Level (IRQL) is a hardware-independent means with which Windows prioritizes interrupts that come from the system's processors.

-> Inside PCR there is another data structure called `processor region control block(PRCB)`. It is a per-processor structure that contains informationabout the processor , e.g CPU type, model, current thread that is running . next thread to run , queue of DPC.

> `DPC` : A Deferred Procedure Call (DPC) is a Microsoft Windows operating system mechanism which allows high-priority tasks (e.g. an interrupt handler) to defer required but lower-priority tasks for later execution. This permits device drivers and other low-level event consumers to perform the high-priority part of their processing quickly, and schedule non-critical additional processing for execution at a lower priority.
