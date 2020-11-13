# INSTRUCTION SET

There are five types of movements.

■ Immediate to register\
■ Register to register\
■ Immediate to memory\
■ Register to memory and vice versa\
■ Memory to memory

**NOTE**

```plain
The first four methods are supported by all modern architectures, but the last
one is specific to x86.
```

### SYNTAX

---

Depending on the assembler/disassembler, there are two syntax notations for
x86 assembly code, Intel and AT&T:
**Intel**
```bash
mov ecx, AABBCCDDh
mov ecx, [eax]
mov ecx, eax
```
**AT&T**
```bash
movl $0xAABBCCDD, %ecx
movl (%eax), %ecx
movl %eax, %ecx

```
It is important to note that these are the same instructions but written differently.

There are several differences between Intel and AT&T notation, but the most notable ones are as follows:

■ AT&T prefixes the register with % , and immediates with $ . Intel does not do this.

■ AT&T adds a prefix to the instruction to indicate operation width. For example, MOVL (long), MOVB (byte), etc. Intel does not do this.

■ AT&T puts the source operand before the destination. Intel reverses the order.

### DATA MOVEMENT

---

Instuctions operate on values that come from register or main memory.

e.g.
```bash
mov esi, 0F003Fh   ; sets ESI = 0xF003
mov esi, ecx ; sets ESI = ECX

```

Similar to other assembly language conventions, x86 uses square brackets ( [ ] ) to indicate memory access. (The only exception to this is the LEA instruction, which uses [] but does not actually reference memory.)

```bash
mov   dword ptr [eax], 1
; set the memory at address EAX to 1
mov   ecx, [eax]
;set ECX to the value at address EAX
mov   [eax], ebx
; set the memory at address EAX to EBX
mov   [esi+34h], eax
;set the memory address at (ESI+34) to EAX
mov   eax, [esi+34h]
set EAX to the value at address (EAX+34)
mov   edx, [ecx+eax]
; set EDX to the value at address (ECX+EAX)

```

**Pseudo C**

```c
*eax = 1;
ecx = *eax;
*eax = ebx;
*(esi+34) = eax;
eax = *(esi+34);
edx = *(ecx+eax);
```
Array type objects.

[Base + Index*scale]

```bash
mov    [edi+esi*8], eax
```

here EDI is the array base address .

ESI is the array index.

element size is 8.

```bash
01:           loop_start:
02: 8B 47 04       mov eax, [edi+4]
03: 8B 04 98       mov eax, [eax+ebx*4]
04: 85 C0          test eax, eax
...
05: 74 14          jz short loc_7F627F
06:             loc_7F627F:
07: 43             inc ebx
08: 3B 1F          cmp ebx, [edi]
09: 7C DD          jl short loop_start
```

line 2 reads a double-word from offset +4 from EDI and then uses it as a base address into the array in the next line.

line 7 increments the address.

line 8 compares the index against a value at offset +0 in the same structure.

```c
typedef struct _Foo
{
		DWORD size;         // +0x00
		DOWRD array[...]    // +0x04
}FOO, *PFOO;

PFOO bar = ...;
for (i = ... ; i < bar->size; i++)
		if(bar->array[i] != 0){
		...
		}
}
```

The MOVSB/MOVSW/MOVSD instructions mov data 1, 2, or 4 byte between two memory addresses. They implicitly use EDI/ESI as destination/source addresses, respectively.

In addition they also update source/destination depending upon the directional flag DF in EFLAGS . If DF  is set to 0, the addresses are decremented otherwise incremented.

These instructions are typically used to implement string or memory
copy functions when the length is known at compile time. In some cases, they
are accompanied by the REP prefix, which repeats an instruction up to ECX times.

**ASSEMBLY**

```bash
01: BE 28 B5 41 00    mov    esi, offset _RamdiskBoot
02: 8D BD 40 FF FF+   lea edi, [ebp-0C0h]
03: A5                movsd
04: A5                movsd
05: A5                movsd
06: A5                movsd
```

01: ESI = pointer to RamdiskBoot

02:  EDI is an address somewhere on the stack

03: copies 4 bytes from EDI to ESI; increment each by 4

04 : same as above

05 : same as above

06 : same as above

**PSEUDO C**

```c
/* a GUID is 16-byte structure */
GUID RamDiskBootDiskGuid = ...; // global
...
GUID foo;
memcpy(&foo, &RamdiskBootDiskGuid, sizeof(GUID));
```

NOTE:

```c
02: 8D BD 40 FF FF+   lea edi, [ebp-0C0h]
```

Although LEA uses ' [ ] ' , it actually does not red from memory address. it simply evaluates the expression in the square brackets and puts it in the destination register.

for e.g here, if EBP was having an value of 0x1000, EDI will be 0xF40 i.e.(0x1000 - 0xC0)

REP prefix example.

**ASSEMBLY**

```bash
01: 6A 08             push    8
; push 8 on the stack
02: ...
03: 59                pop     ecx
; pop the stack. Basically sets ECX to 8.
04: ...
05: BE 00 44 61 00    mov     esi, offset _KeServiceDescriptorTable
06: BF C0 43 61 00    mov     edi, offset _KeServiceDescriptorTableShadow
07: F3 A5             rep     movsd
; copy 32 bytes (movsd repeated 8 times)
; from this we can deduce that whatever these two objects are, they are
; likely to be 32 bytes in size.
```

**PSEUDO C**

```c
memcpy(&KeServiceDescriptorTableShadow, &KeServiceDescriptorTable, 32);
```

Another class of data movement instructions with implicit source and destination includes the SCAS and STOS instructions. Similar to MOVS , these instructions
can operate at 1-, 2-, or 4-byte granularity. SCAS implicitly compares AL/AX/EAX
with data starting at the memory address EDI ; EDI is automatically incremented/
decremented depending on the DF bit in EFLAGS . Given its semantic, SCAS is commonly used along with the REP prefix to find a byte, word, or double-word in
a buffer. For example, the C strlen() function can be implemented as follows:

```bash
01: 30 C0           xor      al, al
;set AL to 0 (NUL byte).
02: 89 FB           mov      ebx, edi
; save the original pointer to the string
03: F2 AE           repne    scasb
;repeatedly scan forward one byte at a time as long as AL does not match the
;byte at EDI when this instruction ends, it means we reached the NUL byte in
;the string buffer
04: 29 DF           sub      edi, ebx
;edi is now the NUL byte location. Subtract that from the original pointer
;to the length.
```

STOS is the same as SCAS except that it writes the value AL/AX/EAX to EDI . It
is commonly used to initialize a buffer to a constant value (such as memset() ).

```bash
01: 33 C0           xor       eax, eax
; set EAX to 0
02: 6A 09           push      9
; push 9 on the stack
03: 59              pop       ecx
; pop it back in ECX. Now ECX = 9.
04: 8B FE           mov       edi, esi
; set the destination address
05: F3 AB           rep     stosd
; write 36 bytes of zero to the destination buffer (STOSD repeated 9 times)
; this is equivalent lent to memset(edi, 0, 36)
```

LODS is another instruction from the same family. It reads a 1-, 2-, or 4-byte
value from ESI and stores it in AL , AX , or EAX .

### ARITHMETIC OPERATIONS

---

only multiplication and division have only some exceptions , reaming all mathematical operation bitwise operations.

**add, subtract, increment , decrement**

```bash
add    esp, 14h       ; esp = esp + 0x14
sub    ecx, eax       ; ecx = ecx - eax
inc    ecx            ; ecx = ecx + 1
dec    ecx            ; ecx = ecx - 1
```

**and, or, xor, not**

```bash
or    eax, 0FFFFFFFFh   ; eax = eax | 0xFFFFFFFF
and   ebx, 0Ch          ; ebx = ebx & 0xC
xor   eax, eax          ; eax = eax ^ eax
not   edi               ; edi = -edi
```

**SHIFT**

```plain
shl    eax, 4  ; eax = eax << 4
shr    eax, 4  ; eax = eax >> 4
```

**ROTATE**

```bash
rol    al, 3        ; rotate AL left 3 positions
ror    al, 1        ; rotate AL right 1 position
```
**MULTIPLICATION**

Unsigned and signed multiplication is done through the MUL and IMUL instructions, respectively. The MUL instruction has the following general form: MUL reg/memory.
That is, it can only operate on register or memory values. The register
is multiplied with AL, AX, or EAX and the result is stored in AX , DX:AX, or EDX:EAX, depending on the operand width.

![](/RE_concepts/x86/pic/ins1.png)

![](/RE_concepts/x86/pic/ins2.png)

**The result is stored in EDX:EAX for 32-bit multiplication is because the result potentially may not fit in one 32-bit register.**

IMUL has three forms:\
■ IMUL reg/mem — Same as MUL\
■ IMUL reg1, reg2/mem — reg1 = reg1 * reg2/mem\
■ IMUL reg1, reg2/mem, imm — reg1 = reg2 * imm\

```bash
imul		ecx 		; EDX:EAX = EAX * ECX
imul 		esi, 1A0h	; ESI = ESI * 0x1A0
imul 		ecx, esi 	; ECX = ECX * ESI
```

**DIVISION**

Unsigned and signed division is done through the DIV and IDIV instructions,respectively.
They take only one parameter (divisor) and have the following form: DIV/IDIV reg/mem.\
Depending on the divisor’s size, DIV will use either AX , DX:AX , or EDX:EAX as the dividend, and the resulting quotient/remainder pair are stored in AL/AH , AX/DX , or EAX/EDX .

![](/RE_concepts/x86/pic/ins3.png)

### STACK OPERATION

Fundamental data structure in programming languages and OS.\
Stack is last in first out, with only two basic operations `push` and `pop`.\
In `x86` STACK is a contiguous memory region pointed by `ESP` and grows downwards.

```bash
; initial esp = 0xb20000
01:		mov		eax,0AAAAAAAAh
02:		mov		ebx,0BBBBBBBBh
03:		mov		ecx,0CCCCCCCCh
04:		mov		edx,0DDDDDDDDh
05:		push		eax
06:		push		ebx
07:		pop		esi
08:		pop		edi
```
after line 5:\
address 0xb1fffc will contain the value 0xAAAAAAAA and ESP will be `0xb1fffc` (=0xb20000-4)

after line 6:\
address 0xb1fff8 will contain the value 0xBBBBBBBB and ESP will be `0xb1fff8` (=0xb1fffc-4)

after line 7:\
esi will have the value of 0xBBBBBBBB and ESP will be at (0xb1fff8 + 4) = 	`0xb1fffc`

after line 8:\
edi will have the value of 0xAAAAAAAA and ESP will be at (0xb1fffc + 4) = 	`0xb20000`

### FUNCTION INVOCATION

Consider the following C code
```c
int
__cdecl addme(short a, short b)
{
	return a+b;
}
```
**ASSEMBLY**

```bash
01:		push		ebp
02:		mov		ebp, esp
03:		....
04:		movsx		eax, word ptr [ebp+8]
05:		movsx		ecx, word ptr [ebp+0Ch]
06:		add		eax, ecx
07:		.....
08:		mov		esp, ebp
09:		pop		ebp
10:		retn
```

```c
sum = addme(x, y);
```

ASSEMBLY
```bash
01:		push		eax
02:		...
03:		push		ecx
04:		call		addme
05:		add		esp, 8
```

The CALL instruction performs two operations:

1. It pushes the return address (address immediately after the CALL instruc-
tion) on the stack.\
2. It changes `EIP` to the call destination. This effectively transfers control to
the call target and begins execution there.

RET simply pops the address stored on the top of the stack into EIP and trans-
fers control to it.

### Calling Convention

A calling convention is a set of rules dictating how function calls work at the machine level. It is defi ned by the Application Binary Interface (ABI) for a particular system.
There are many calling conventions, but the popular ones are `CDECL` , `STDCALL` ,
`THISCALL` , and `FASTCALL` .

![](/RE_concepts/x86/pic/ins4.png)

How is the function get called 1st `eax` and `ecx` register are being pushed into the stack and the call instruction is invoked, which immediately pushes the next address into the stack, i.e the address of the `add esp, 8` line , and transfers the control to the `addme` function, to be more clear `eip` is pointed to the address of `addme` function.

Lets explain the function assembly line by line .
on the 1st line base pointer, `ebp` is pushed into the stack.then the stack pointer is pointed to the base pointer. This two steps is known as `function prologue`.then the value at the offset `[ebp + 0x8]` is moved in `eax` register, same with ecx register with the value at offset `[ebp + 0xc]`. Then the add instruction is invoked `eax = eax + ecx`. Then the base pointer is pointed to the stack pointer and ebp is popped. These two steps is known as `function epilogue`. As `ebp` is popped, top of the stack contains the address which is being pushed when the `addme` function is called. clearly address of the `add esp, 8` line.
