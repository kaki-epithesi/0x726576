# HW

[link to file]()

```bash
root@kali:~/ctf/darkctf2020/rev# ./hw
Enter the right arguments
root@kali:~/ctf/darkctf2020/rev# ./hw qwe
Enter the right arguments
root@kali:~/ctf/darkctf2020/rev# ./hw hi hello
invalid argument: hi
root@kali:~/ctf/darkctf2020/rev#
```

it checks on 3 arguments.

```bash
root@kali:~/ctf/darkctf2020/rev# gdb -q ./hw
Reading symbols from ./hw...
(No debugging symbols found in ./hw)
gdb-peda$ info func
All defined functions:

Non-debugging symbols:
0x0000000000001000  _init
0x00000000000010a0  __cxa_finalize@plt
0x00000000000010b0  putchar@plt
0x00000000000010c0  puts@plt
0x00000000000010d0  pow@plt
0x00000000000010e0  __stack_chk_fail@plt
0x00000000000010f0  printf@plt
0x0000000000001100  strcmp@plt
0x0000000000001110  sprintf@plt
0x0000000000001120  _start
0x0000000000001150  deregister_tm_clones
0x0000000000001180  register_tm_clones
0x00000000000011c0  __do_global_dtors_aux
0x0000000000001200  frame_dummy
0x0000000000001209  main
0x00000000000012b6  print
0x00000000000014c5  check
0x0000000000001630  __libc_csu_init
0x00000000000016a0  __libc_csu_fini
0x00000000000016a8  _fini
gdb-peda$ b *main
Breakpoint 1 at 0x1209
gdb-peda$ r hi hello
Starting program: /root/ctf/darkctf2020/rev/hw hi hello
[----------------------------------registers-----------------------------------]
RAX: 0x555555555209 (<main>:    endbr64)
RBX: 0x0
RCX: 0x7ffff7e62718 --> 0x7ffff7e64b00 --> 0x0
RDX: 0x7fffffffe1c8 --> 0x7fffffffe4c9 ("SHELL=/bin/bash")
RSI: 0x7fffffffe1a8 --> 0x7fffffffe4a3 ("/root/ctf/darkctf2020/rev/hw")
RDI: 0x3
RBP: 0x555555555630 (<__libc_csu_init>: endbr64)
RSP: 0x7fffffffe0b8 --> 0x7ffff7ccacca (<__libc_start_main+234>:        mov    edi,eax)
RIP: 0x555555555209 (<main>:    endbr64)
R8 : 0x0
R9 : 0x7ffff7fe2180 (<_dl_fini>:        push   rbp)
R10: 0x3
R11: 0x2
R12: 0x555555555120 (<_start>:  endbr64)
R13: 0x0
R14: 0x0
R15: 0x0
EFLAGS: 0x246 (carry PARITY adjust ZERO sign trap INTERRUPT direction overflow)
[-------------------------------------code-------------------------------------]
   0x5555555551f9 <__do_global_dtors_aux+57>:   nop    DWORD PTR [rax+0x0]
   0x555555555200 <frame_dummy>:        endbr64
   0x555555555204 <frame_dummy+4>:      jmp    0x555555555180 <register_tm_clones>
=> 0x555555555209 <main>:       endbr64
   0x55555555520d <main+4>:     push   rbp
   0x55555555520e <main+5>:     mov    rbp,rsp
   0x555555555211 <main+8>:     sub    rsp,0x10
   0x555555555215 <main+12>:    mov    DWORD PTR [rbp-0x4],edi
[------------------------------------stack-------------------------------------]
0000| 0x7fffffffe0b8 --> 0x7ffff7ccacca (<__libc_start_main+234>:       mov    edi,eax)
0008| 0x7fffffffe0c0 --> 0x7fffffffe1a8 --> 0x7fffffffe4a3 ("/root/ctf/darkctf2020/rev/hw")
0016| 0x7fffffffe0c8 --> 0x300000000
0024| 0x7fffffffe0d0 --> 0x555555555209 (<main>:        endbr64)
0032| 0x7fffffffe0d8 --> 0x7ffff7cca7d9 (<init_cacheinfo+297>:  mov    rbp,rax)
0040| 0x7fffffffe0e0 --> 0x0
0048| 0x7fffffffe0e8 --> 0x5542342e7c1aef74
0056| 0x7fffffffe0f0 --> 0x555555555120 (<_start>:      endbr64)
[------------------------------------------------------------------------------]
Legend: code, data, rodata, value

Breakpoint 1, 0x0000555555555209 in main ()
gdb-peda$ disas
Dump of assembler code for function main:
=> 0x0000555555555209 <+0>:     endbr64
   0x000055555555520d <+4>:     push   rbp
   0x000055555555520e <+5>:     mov    rbp,rsp
   0x0000555555555211 <+8>:     sub    rsp,0x10
   0x0000555555555215 <+12>:    mov    DWORD PTR [rbp-0x4],edi
   0x0000555555555218 <+15>:    mov    QWORD PTR [rbp-0x10],rsi
   0x000055555555521c <+19>:    cmp    DWORD PTR [rbp-0x4],0x3
   0x0000555555555220 <+23>:    je     0x555555555230 <main+39>
   0x0000555555555222 <+25>:    lea    rdi,[rip+0xddf]        # 0x555555556008
   0x0000555555555229 <+32>:    call   0x5555555550c0 <puts@plt>
   0x000055555555522e <+37>:    jmp    0x5555555552af <main+166>
   0x0000555555555230 <+39>:    mov    rax,QWORD PTR [rbp-0x10]
   0x0000555555555234 <+43>:    add    rax,0x8
   0x0000555555555238 <+47>:    mov    rax,QWORD PTR [rax]
   0x000055555555523b <+50>:    mov    esi,0x1
   0x0000555555555240 <+55>:    mov    rdi,rax
   0x0000555555555243 <+58>:    call   0x5555555554c5 <check>
   0x0000555555555248 <+63>:    test   eax,eax
   0x000055555555524a <+65>:    jne    0x555555555290 <main+135>
   0x000055555555524c <+67>:    mov    rax,QWORD PTR [rbp-0x10]
   0x0000555555555250 <+71>:    add    rax,0x10
   0x0000555555555254 <+75>:    mov    rax,QWORD PTR [rax]
   0x0000555555555257 <+78>:    mov    esi,0x2
   0x000055555555525c <+83>:    mov    rdi,rax
   0x000055555555525f <+86>:    call   0x5555555554c5 <check>
   0x0000555555555264 <+91>:    test   eax,eax
   0x0000555555555266 <+93>:    jne    0x55555555526f <main+102>
   0x0000555555555268 <+95>:    call   0x5555555552b6 <print>
   0x000055555555526d <+100>:   jmp    0x5555555552af <main+166>
   0x000055555555526f <+102>:   mov    rax,QWORD PTR [rbp-0x10]
   0x0000555555555273 <+106>:   add    rax,0x10
   0x0000555555555277 <+110>:   mov    rax,QWORD PTR [rax]
   0x000055555555527a <+113>:   mov    rsi,rax
   0x000055555555527d <+116>:   lea    rdi,[rip+0xd9e]        # 0x555555556022
   0x0000555555555284 <+123>:   mov    eax,0x0
   0x0000555555555289 <+128>:   call   0x5555555550f0 <printf@plt>
   0x000055555555528e <+133>:   jmp    0x5555555552af <main+166>
   0x0000555555555290 <+135>:   mov    rax,QWORD PTR [rbp-0x10]
   0x0000555555555294 <+139>:   add    rax,0x8
   0x0000555555555298 <+143>:   mov    rax,QWORD PTR [rax]
   0x000055555555529b <+146>:   mov    rsi,rax
   0x000055555555529e <+149>:   lea    rdi,[rip+0xd7d]        # 0x555555556022
   0x00005555555552a5 <+156>:   mov    eax,0x0
   0x00005555555552aa <+161>:   call   0x5555555550f0 <printf@plt>
   0x00005555555552af <+166>:   mov    eax,0x0
   0x00005555555552b4 <+171>:   leave  
   0x00005555555552b5 <+172>:   ret    
End of assembler dump.
gdb-peda$
```
there are two 'test'
```bash
.
.
0x0000555555555248 <+63>:    test   eax,eax
.
.
0x0000555555555264 <+91>:    test   eax,eax
.
.
```
lets bypass them and see if we can get the flag or not.

```bash
gdb-peda$ b *0x0000555555555248
Breakpoint 2 at 0x555555555248
gdb-peda$ b *0x0000555555555264
Breakpoint 3 at 0x555555555264
gdb-peda$ c
Continuing.
[----------------------------------registers-----------------------------------]
RAX: 0xffffffe0
RBX: 0x0
RCX: 0xffffffff
RDX: 0x68 ('h')
RSI: 0x0
RDI: 0x7fffffffe082 --> 0x690000306c6c3348 ('H3ll0')
RBP: 0x7fffffffe0b0 --> 0x555555555630 (<__libc_csu_init>:      endbr64)
RSP: 0x7fffffffe0a0 --> 0x7fffffffe1a8 --> 0x7fffffffe4a3 ("/root/ctf/darkctf2020/rev/hw")
RIP: 0x555555555248 (<main+63>: test   eax,eax)
R8 : 0xffffffff
R9 : 0x1
R10: 0x0
R11: 0x0
R12: 0x555555555120 (<_start>:  endbr64)
R13: 0x0
R14: 0x0
R15: 0x0
EFLAGS: 0x246 (carry PARITY adjust ZERO sign trap INTERRUPT direction overflow)
[-------------------------------------code-------------------------------------]
   0x55555555523b <main+50>:    mov    esi,0x1
   0x555555555240 <main+55>:    mov    rdi,rax
   0x555555555243 <main+58>:    call   0x5555555554c5 <check>
=> 0x555555555248 <main+63>:    test   eax,eax
   0x55555555524a <main+65>:    jne    0x555555555290 <main+135>
   0x55555555524c <main+67>:    mov    rax,QWORD PTR [rbp-0x10]
   0x555555555250 <main+71>:    add    rax,0x10
   0x555555555254 <main+75>:    mov    rax,QWORD PTR [rax]
[------------------------------------stack-------------------------------------]
0000| 0x7fffffffe0a0 --> 0x7fffffffe1a8 --> 0x7fffffffe4a3 ("/root/ctf/darkctf2020/rev/hw")
0008| 0x7fffffffe0a8 --> 0x300000000
0016| 0x7fffffffe0b0 --> 0x555555555630 (<__libc_csu_init>:     endbr64)
0024| 0x7fffffffe0b8 --> 0x7ffff7ccacca (<__libc_start_main+234>:       mov    edi,eax)
0032| 0x7fffffffe0c0 --> 0x7fffffffe1a8 --> 0x7fffffffe4a3 ("/root/ctf/darkctf2020/rev/hw")
0040| 0x7fffffffe0c8 --> 0x300000000
0048| 0x7fffffffe0d0 --> 0x555555555209 (<main>:        endbr64)
0056| 0x7fffffffe0d8 --> 0x7ffff7cca7d9 (<init_cacheinfo+297>:  mov    rbp,rax)
[------------------------------------------------------------------------------]
Legend: code, data, rodata, value

Breakpoint 2, 0x0000555555555248 in main ()
gdb-peda$ set $eax=0
gdb-peda$ c
Continuing.
[----------------------------------registers-----------------------------------]
RAX: 0xffffffef
RBX: 0x0
RCX: 0xfffffff7
RDX: 0x68 ('h')
RSI: 0x0
RDI: 0x7fffffffe082 --> 0x690000646c723057 ('W0rld')
RBP: 0x7fffffffe0b0 --> 0x555555555630 (<__libc_csu_init>:      endbr64)
RSP: 0x7fffffffe0a0 --> 0x7fffffffe1a8 --> 0x7fffffffe4a3 ("/root/ctf/darkctf2020/rev/hw")
RIP: 0x555555555264 (<main+91>: test   eax,eax)
R8 : 0xffffffff
R9 : 0x1
R10: 0x0
R11: 0x0
R12: 0x555555555120 (<_start>:  endbr64)
R13: 0x0
R14: 0x0
R15: 0x0
EFLAGS: 0x246 (carry PARITY adjust ZERO sign trap INTERRUPT direction overflow)
[-------------------------------------code-------------------------------------]
   0x555555555257 <main+78>:    mov    esi,0x2
   0x55555555525c <main+83>:    mov    rdi,rax
   0x55555555525f <main+86>:    call   0x5555555554c5 <check>
=> 0x555555555264 <main+91>:    test   eax,eax
   0x555555555266 <main+93>:    jne    0x55555555526f <main+102>
   0x555555555268 <main+95>:    call   0x5555555552b6 <print>
   0x55555555526d <main+100>:   jmp    0x5555555552af <main+166>
   0x55555555526f <main+102>:   mov    rax,QWORD PTR [rbp-0x10]
[------------------------------------stack-------------------------------------]
0000| 0x7fffffffe0a0 --> 0x7fffffffe1a8 --> 0x7fffffffe4a3 ("/root/ctf/darkctf2020/rev/hw")
0008| 0x7fffffffe0a8 --> 0x300000000
0016| 0x7fffffffe0b0 --> 0x555555555630 (<__libc_csu_init>:     endbr64)
0024| 0x7fffffffe0b8 --> 0x7ffff7ccacca (<__libc_start_main+234>:       mov    edi,eax)
0032| 0x7fffffffe0c0 --> 0x7fffffffe1a8 --> 0x7fffffffe4a3 ("/root/ctf/darkctf2020/rev/hw")
0040| 0x7fffffffe0c8 --> 0x300000000
0048| 0x7fffffffe0d0 --> 0x555555555209 (<main>:        endbr64)
0056| 0x7fffffffe0d8 --> 0x7ffff7cca7d9 (<init_cacheinfo+297>:  mov    rbp,rax)
[------------------------------------------------------------------------------]
Legend: code, data, rodata, value

Breakpoint 3, 0x0000555555555264 in main ()
gdb-peda$ set $eax=0
gdb-peda$ c
Continuing.
darkCTF{4rgum3nts_are_v3ry_1mp0rt4nt!!!}
[Inferior 1 (process 7645) exited normally]
Warning: not running
gdb-peda$
```
we got the flag

>FLAG : darkCTF{4rgum3nts_are_v3ry_1mp0rt4nt!!!}
