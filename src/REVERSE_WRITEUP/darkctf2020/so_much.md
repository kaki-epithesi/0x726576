# so_much

[link to file]()

its like an argv1 password check .

```bash
root@kali:~/ctf/darkctf2020/rev# ./so_much
Lets have an argument. Shall we?
root@kali:~/ctf/darkctf2020/rev# ./so_much qwerty
Nada. Not the right password!
*Psst the password is part of the flag*
root@kali:~/ctf/darkctf2020/rev#
```

analyzed with gdb

```bash
root@kali:~/ctf/darkctf2020/rev# gdb -q ./so_much
Reading symbols from ./so_much...
(No debugging symbols found in ./so_much)
gdb-peda$ info func
All defined functions:

Non-debugging symbols:
0x0000000000001000  _init
0x0000000000001080  __cxa_finalize@plt
0x0000000000001090  puts@plt
0x00000000000010a0  __stack_chk_fail@plt
0x00000000000010b0  printf@plt
0x00000000000010c0  strcmp@plt
0x00000000000010d0  strcat@plt
0x00000000000010e0  _start
0x0000000000001110  deregister_tm_clones
0x0000000000001140  register_tm_clones
0x0000000000001180  __do_global_dtors_aux
0x00000000000011c0  frame_dummy
0x00000000000011c9  main
0x0000000000001281  get_flag
0x0000000000001342  flag_48
0x0000000000001379  flag_49
0x00000000000013a4  flag_50
0x00000000000013cf  flag_51
0x00000000000013fa  flag_52
0x0000000000001425  flag_53
0x0000000000001450  flag_54
0x000000000000147b  flag_55
0x00000000000014a6  flag_56
0x00000000000014d1  flag_57
0x00000000000014fc  flag_97
0x0000000000001527  flag_98
0x0000000000001552  flag_99
0x000000000000157d  flag_100
0x00000000000015a8  flag_101
0x00000000000015d3  flag_102
0x00000000000015fe  flag_103
0x0000000000001629  flag_104
0x0000000000001654  flag_105
0x000000000000167f  flag_106
0x00000000000016aa  flag_107
0x00000000000016d5  flag_108
0x0000000000001700  flag_109
0x000000000000172b  flag_110
0x0000000000001762  flag_111
0x000000000000178d  flag_112
0x00000000000017b8  flag_113
0x00000000000017e3  flag_114
0x000000000000180e  flag_115
0x000000000000183f  flag_116
0x000000000000186a  flag_117
0x0000000000001895  flag_118
0x00000000000018c0  flag_119
0x00000000000018f1  flag_120
0x000000000000191c  flag_121
0x0000000000001947  flag_122
0x0000000000001972  flag_95
0x00000000000019a9  flag_123
0x00000000000019d4  flag_125
0x0000000000001a00  __libc_csu_init
0x0000000000001a70  __libc_csu_fini
0x0000000000001a78  _fini
gdb-peda$
```

there are so many functions for flag checking i guess.

lets look at disassembly of main function

```bash
   0x00005555555551c9 <+0>:     endbr64
   0x00005555555551cd <+4>:     push   rbp
   0x00005555555551ce <+5>:     mov    rbp,rsp
   0x00005555555551d1 <+8>:     sub    rsp,0x20
   0x00005555555551d5 <+12>:    mov    DWORD PTR [rbp-0x14],edi
   0x00005555555551d8 <+15>:    mov    QWORD PTR [rbp-0x20],rsi
   0x00005555555551dc <+19>:    mov    rax,QWORD PTR fs:0x28
   0x00005555555551e5 <+28>:    mov    QWORD PTR [rbp-0x8],rax
   0x00005555555551e9 <+32>:    xor    eax,eax
   0x00005555555551eb <+34>:    lea    rax,[rip+0xe16]        # 0x555555556008
   0x00005555555551f2 <+41>:    mov    QWORD PTR [rbp-0x10],rax
   0x00005555555551f6 <+45>:    lea    rax,[rbp-0x10]
   0x00005555555551fa <+49>:    mov    rdi,rax
   0x00005555555551fd <+52>:    call   0x555555555281 <get_flag>
   0x0000555555555202 <+57>:    cmp    DWORD PTR [rbp-0x14],0x2
   0x0000555555555206 <+61>:    jne    0x55555555525a <main+145>
   0x0000555555555208 <+63>:    mov    rdx,QWORD PTR [rbp-0x10]
   0x000055555555520c <+67>:    mov    rax,QWORD PTR [rbp-0x20]
   0x0000555555555210 <+71>:    add    rax,0x8
   0x0000555555555214 <+75>:    mov    rax,QWORD PTR [rax]
   0x0000555555555217 <+78>:    mov    rsi,rdx
   0x000055555555521a <+81>:    mov    rdi,rax
   0x000055555555521d <+84>:    call   0x5555555550c0 <strcmp@plt>
   0x0000555555555222 <+89>:    test   eax,eax
   0x0000555555555224 <+91>:    jne    0x55555555524c <main+131>
   0x0000555555555226 <+93>:    mov    rax,QWORD PTR [rbp-0x10]
   0x000055555555522a <+97>:    mov    rsi,rax
   0x000055555555522d <+100>:   lea    rdi,[rip+0xdd5]        # 0x555555556009
   0x0000555555555234 <+107>:   mov    eax,0x0
   0x0000555555555239 <+112>:   call   0x5555555550b0 <printf@plt>
   0x000055555555523e <+117>:   lea    rdi,[rip+0xdcf]        # 0x555555556014
   0x0000555555555245 <+124>:   call   0x555555555090 <puts@plt>
   0x000055555555524a <+129>:   jmp    0x555555555266 <main+157>
   0x000055555555524c <+131>:   lea    rdi,[rip+0xddd]        # 0x555555556030
   0x0000555555555253 <+138>:   call   0x555555555090 <puts@plt>
   0x0000555555555258 <+143>:   jmp    0x555555555266 <main+157>
   0x000055555555525a <+145>:   lea    rdi,[rip+0xe17]        # 0x555555556078
   0x0000555555555261 <+152>:   call   0x555555555090 <puts@plt>
   0x0000555555555266 <+157>:   mov    eax,0x0
   0x000055555555526b <+162>:   mov    rcx,QWORD PTR [rbp-0x8]
   0x000055555555526f <+166>:   xor    rcx,QWORD PTR fs:0x28
   0x0000555555555278 <+175>:   je     0x55555555527f <main+182>
   0x000055555555527a <+177>:   call   0x5555555550a0 <__stack_chk_fail@plt>
   0x000055555555527f <+182>:   leave  
   0x0000555555555280 <+183>:   ret    
End of assembler dump.
```

If we look closely there is only 1 cmp and test. i think if we bypass that we can get the flag.

lets talk about the compare

```
0x0000555555555202 <+57>:    cmp    DWORD PTR [rbp-0x14],0x2
```
its just checking that the number of arguments passes is 2 or not.
so we need not to bypass it, just we will give a argument it will be checked.

lets come to test

```
0x0000555555555222 <+89>:    test   eax,eax
```
lets bypass it
```bash
gdb-peda$ b *0x0000555555555222
Breakpoint 2 at 0x555555555222
gdb-peda$ c
Continuing.
Breakpoint 2, 0x0000555555555222 in main ()
gdb-peda$ info reg
rax            0xfffffff6          0xfffffff6
rbx            0x0                 0x0
rcx            0xffff7ffd          0xffff7ffd
rdx            0x7b                0x7b
rsi            0x7fffffffe020      0x7fffffffe020
rdi            0x7fffffffe4ad      0x7fffffffe4ad
rbp            0x7fffffffe0a0      0x7fffffffe0a0
rsp            0x7fffffffe080      0x7fffffffe080
r8             0x0                 0x0
r9             0x7fffffffe020      0x7fffffffe020
r10            0x3                 0x3
r11            0x2                 0x2
r12            0x5555555550e0      0x5555555550e0
r13            0x0                 0x0
r14            0x0                 0x0
r15            0x0                 0x0
rip            0x555555555222      0x555555555222 <main+89>
eflags         0x297               [ CF PF AF SF IF ]
cs             0x33                0x33
ss             0x2b                0x2b
ds             0x0                 0x0
es             0x0                 0x0
fs             0x0                 0x0
gs             0x0                 0x0
gdb-peda$ set $eax=0
gdb-peda$ c
Continuing.
darkCTF{w0w_s0_m4ny_funct10ns}
WoW! so much revving...
[Inferior 1 (process 11828) exited normally]
Warning: not running
gdb-peda$

```
>FLAG : darkCTF{w0w_s0_m4ny_funct10ns}
