# REVSENG

[link to file]()

```bash
root@kali:~/ctf/phantomctf/rev# r2 -A revseng
[x] Analyze all flags starting with sym. and entry0 (aa)
[x] Analyze function calls (aac)
[x] Analyze len bytes of instructions for references (aar)
[x] Check for objc references
[x] Check for vtables
[x] Type matching analysis for all functions (aaft)
[x] Propagate noreturn information
[x] Use -AA or aaaa to perform additional experimental analysis.
 -- bash: r3: command not found
[0x00001060]> afl
0x00001060    1 42           entry0
0x00001090    4 41   -> 34   sym.deregister_tm_clones
0x000010c0    4 57   -> 51   sym.register_tm_clones
0x00001100    5 57   -> 50   entry.fini0
0x00001140    1 5            entry.init0
0x00001000    3 23           sym._init
0x00001360    1 1            sym.__libc_csu_fini
0x00001364    1 9            sym._fini
0x000011a9    1 334          sym.print
0x00001040    1 6            sym.imp.malloc
0x00001030    1 6            sym.imp.printf
0x00001300    4 93           sym.__libc_csu_init
0x0000117e    4 43           sym.foo
0x00001145    4 57           main
[0x00001060]>
```
`print` function has the flag, so lets attack it.

```bash
[0x00001060]> s sym.print
[0x000011a9]> pdf
            ; CALL XREF from main @ 0x1166
┌ 334: sym.print ();
│           ; var void *var_10h @ rbp-0x10
│           ; var char var_6h @ rbp-0x6
│           ; var char var_5h @ rbp-0x5
│           ; var char *format @ rbp-0x4
│           ; var char var_3h @ rbp-0x3
│           ; var char var_2h @ rbp-0x2
│           ; var char var_1h @ rbp-0x1
│           0x000011a9      55             push rbp                    ; /src:29
│           0x000011aa      4889e5         mov rbp, rsp
│           0x000011ad      4883ec10       sub rsp, 0x10
│           0x000011b1      c645ff70       mov byte [var_1h], 0x70     ; /src:31 ; 'p'
│           0x000011b5      c645fe43       mov byte [var_2h], 0x43     ; /src:32 ; 'C'
│           0x000011b9      c645fd54       mov byte [var_3h], 0x54     ; /src:33 ; 'T'
│           0x000011bd      c645fc46       mov byte [format], 0x46     ; /src:34 ; 'F'
│           0x000011c1      c645fb7b       mov byte [var_5h], 0x7b     ; /src:35 ; '{'
│           0x000011c5      c645fa7d       mov byte [var_6h], 0x7d     ; /src:36 ; '}'
│           0x000011c9      bf15000000     mov edi, 0x15               ; /src:37 ; size_t size
│           0x000011ce      e86dfeffff     call sym.imp.malloc         ;  void *malloc(size_t size)
│           0x000011d3      488945f0       mov qword [var_10h], rax
│           0x000011d7      488b45f0       mov rax, qword [var_10h]    ; /src:38
│           0x000011db      c60077         mov byte [rax], 0x77        ; 'w'
│                                                                      ; [0x77:1]=0                                                                                        
│           0x000011de      488b45f0       mov rax, qword [var_10h]    ; /src:39
│           0x000011e2      4883c001       add rax, 1
│           0x000011e6      c60033         mov byte [rax], 0x33        ; '3'
│                                                                      ; [0x33:1]=0                                                                                        
│           0x000011e9      488b45f0       mov rax, qword [var_10h]    ; /src:40
│           0x000011ed      4883c002       add rax, 2
│           0x000011f1      c60063         mov byte [rax], 0x63        ; 'c'
│                                                                      ; [0x63:1]=0                                                                                        
│           0x000011f4      488b45f0       mov rax, qword [var_10h]    ; /src:41
│           0x000011f8      4883c003       add rax, 3
│           0x000011fc      c6006f         mov byte [rax], 0x6f        ; 'o'
│                                                                      ; [0x6f:1]=0                                                                                        
│           0x000011ff      488b45f0       mov rax, qword [var_10h]    ; /src:42
│           0x00001203      4883c004       add rax, 4
│           0x00001207      c6006e         mov byte [rax], 0x6e        ; 'n'
│                                                                      ; [0x6e:1]=0                                                                                        
│           0x0000120a      488b45f0       mov rax, qword [var_10h]    ; /src:43
│           0x0000120e      4883c005       add rax, 5
│           0x00001212      c60037         mov byte [rax], 0x37        ; '7'
│                                                                      ; [0x37:1]=0                                                                                        
│           0x00001215      488b45f0       mov rax, qword [var_10h]    ; /src:44
│           0x00001219      4883c006       add rax, 6
│           0x0000121d      c60072         mov byte [rax], 0x72        ; 'r'
│                                                                      ; [0x72:1]=0                                                                                        
│           0x00001220      488b45f0       mov rax, qword [var_10h]    ; /src:45
│           0x00001224      4883c007       add rax, 7
│           0x00001228      c60030         mov byte [rax], 0x30        ; '0'
│                                                                      ; [0x30:1]=0                                                                                        
│           0x0000122b      488b45f0       mov rax, qword [var_10h]    ; /src:46
│           0x0000122f      4883c008       add rax, 8
│           0x00001233      c6006c         mov byte [rax], 0x6c        ; 'l'
│                                                                      ; [0x6c:1]=0                                                                                        
│           0x00001236      488b45f0       mov rax, qword [var_10h]    ; /src:47
│           0x0000123a      4883c009       add rax, 9
│           0x0000123e      c60074         mov byte [rax], 0x74        ; 't'
│                                                                      ; [0x74:1]=0                                                                                        
│           0x00001241      488b45f0       mov rax, qword [var_10h]    ; /src:48
│           0x00001245      4883c00a       add rax, 0xa
│           0x00001249      c60068         mov byte [rax], 0x68        ; 'h'
│                                                                      ; [0x68:1]=104                                                                                      
│           0x0000124c      488b45f0       mov rax, qword [var_10h]    ; /src:49
│           0x00001250      4883c00b       add rax, 0xb
│           0x00001254      c60033         mov byte [rax], 0x33        ; '3'
│                                                                      ; [0x33:1]=0                                                                                        
│           0x00001257      488b45f0       mov rax, qword [var_10h]    ; /src:50
│           0x0000125b      4883c00c       add rax, 0xc
│           0x0000125f      c60062         mov byte [rax], 0x62        ; 'b'
│                                                                      ; [0x62:1]=0                                                                                        
│           0x00001262      488b45f0       mov rax, qword [var_10h]    ; /src:51
│           0x00001266      4883c00d       add rax, 0xd
│           0x0000126a      c60031         mov byte [rax], 0x31        ; '1'
│                                                                      ; [0x31:1]=0                                                                                        
│           0x0000126d      488b45f0       mov rax, qword [var_10h]    ; /src:52
│           0x00001271      4883c00e       add rax, 0xe
│           0x00001275      c6006e         mov byte [rax], 0x6e        ; 'n'
│                                                                      ; [0x6e:1]=0                                                                                        
│           0x00001278      488b45f0       mov rax, qword [var_10h]    ; /src:53
│           0x0000127c      4883c00f       add rax, 0xf
│           0x00001280      c60061         mov byte [rax], 0x61        ; 'a'
│                                                                      ; [0x61:1]=2                                                                                        
│           0x00001283      488b45f0       mov rax, qword [var_10h]    ; /src:54
│           0x00001287      4883c010       add rax, 0x10
│           0x0000128b      c60072         mov byte [rax], 0x72        ; 'r'
│                                                                      ; [0x72:1]=0                                                                                        
│           0x0000128e      488b45f0       mov rax, qword [var_10h]    ; /src:55
│           0x00001292      4883c011       add rax, 0x11
│           0x00001296      c60069         mov byte [rax], 0x69        ; 'i'
│                                                                      ; [0x69:1]=2                                                                                        
│           0x00001299      488b45f0       mov rax, qword [var_10h]    ; /src:56
│           0x0000129d      4883c012       add rax, 0x12
│           0x000012a1      c60033         mov byte [rax], 0x33        ; '3'
│                                                                      ; [0x33:1]=0                                                                                        
│           0x000012a4      488b45f0       mov rax, qword [var_10h]    ; /src:57
│           0x000012a8      4883c013       add rax, 0x13
│           0x000012ac      c60073         mov byte [rax], 0x73        ; 's'
│                                                                      ; [0x73:1]=0                                                                                        
│           0x000012af      488b45f0       mov rax, qword [var_10h]    ; /src:58
│           0x000012b3      4883c014       add rax, 0x14
│           0x000012b7      c60000         mov byte [rax], 0
│           0x000012ba      0fbe75fa       movsx esi, byte [var_6h]    ; /src:59
│           0x000012be      440fbe45fb     movsx r8d, byte [var_5h]
│           0x000012c3      0fbe7dfc       movsx edi, byte [format]
│           0x000012c7      0fbe4dfd       movsx ecx, byte [var_3h]
│           0x000012cb      0fbe55fe       movsx edx, byte [var_2h]
│           0x000012cf      0fbe45ff       movsx eax, byte [var_1h]
│           0x000012d3      56             push rsi
│           0x000012d4      ff75f0         push qword [var_10h]
│           0x000012d7      4589c1         mov r9d, r8d
│           0x000012da      4189f8         mov r8d, edi
│           0x000012dd      89c6           mov esi, eax
│           0x000012df      488d3d1e0d00.  lea rdi, str.c_c_c_c_c_s_c  ; 0x2004 ; "%c%c%c%c%c%s%c\n" ; const char *format
│           0x000012e6      b800000000     mov eax, 0
│           0x000012eb      e840fdffff     call sym.imp.printf         ; int printf(const char *format)
│           0x000012f0      4883c410       add rsp, 0x10
│           0x000012f4      90             nop                         ; /src:60
│           0x000012f5      c9             leave
└           0x000012f6      c3             ret
[0x000011a9]>
```
 I just wrote a simple angr script.

```py
import angr

value = 0

p = angr.Project("./revseng")
func_addr = p.loader.find_symbol("print").rebased_addr
cl = p.factory.callable(func_addr)
cl(value)                         
print(cl.result_state.posix.stdout.concretize())
```

```bash
root@kali:~/ctf/phantomctf/rev# python3 aa.py
WARNING | 2020-11-24 09:01:23,072 | cle.loader | The main binary is a position-independent executable. It is being loaded with a base address of 0x400000.
WARNING | 2020-11-24 09:01:23,917 | angr.state_plugins.symbolic_memory | The program is accessing memory or registers with an unspecified value. This could indicate unwanted behavior.
WARNING | 2020-11-24 09:01:23,917 | angr.state_plugins.symbolic_memory | angr will cope with this by generating an unconstrained symbolic variable and continuing. You can resolve this by:
WARNING | 2020-11-24 09:01:23,917 | angr.state_plugins.symbolic_memory | 1) setting a value to the initial state
WARNING | 2020-11-24 09:01:23,917 | angr.state_plugins.symbolic_memory | 2) adding the state option ZERO_FILL_UNCONSTRAINED_{MEMORY,REGISTERS}, to make unknown regions hold null
WARNING | 2020-11-24 09:01:23,917 | angr.state_plugins.symbolic_memory | 3) adding the state option SYMBOL_FILL_UNCONSTRAINED_{MEMORY_REGISTERS}, to suppress these messages.
WARNING | 2020-11-24 09:01:23,917 | angr.state_plugins.symbolic_memory | Filling register rbp with 8 unconstrained bytes referenced from 0x4011a9 (print+0x0 in revseng (0x11a9))
WARNING | 2020-11-24 09:01:26,375 | angr.state_plugins.symbolic_memory | Filling memory at 0xc0000015 with 235 unconstrained bytes referenced from 0x556db0 (printf+0x0 in libc.so.6 (0x56db0))
[b'pCTF{w3con7r0lth3b1nari3s}\n']
```
