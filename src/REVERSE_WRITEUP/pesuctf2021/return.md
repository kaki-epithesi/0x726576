# RETURN 

[link to file](https://github.com/kaki-epithesi/0x726576/raw/master/rev_files/pesuctf2021/Return)

```
the question said what does the function RETURN
```

if we check the disassembly of main

```bash
0x0000555555555298 <+0>:	push   rbp
   0x0000555555555299 <+1>:	mov    rbp,rsp
   0x000055555555529c <+4>:	sub    rsp,0x20
   0x00005555555552a0 <+8>:	mov    rax,QWORD PTR [rip+0x2e01]        # 0x5555555580a8 <stdout@@GLIBC_2.2.5>
   0x00005555555552a7 <+15>:	mov    esi,0x0
   0x00005555555552ac <+20>:	mov    rdi,rax
   0x00005555555552af <+23>:	call   0x5555555550b0 <setbuf@plt>
   0x00005555555552b4 <+28>:	mov    rax,QWORD PTR [rip+0x2dc5]        # 0x555555558080 <stdin@@GLIBC_2.2.5>
   0x00005555555552bb <+35>:	mov    esi,0x0
   0x00005555555552c0 <+40>:	mov    rdi,rax
   0x00005555555552c3 <+43>:	call   0x5555555550b0 <setbuf@plt>
   0x00005555555552c8 <+48>:	mov    rax,QWORD PTR [rip+0x2dd1]        # 0x5555555580a0 <stderr@@GLIBC_2.2.5>
   0x00005555555552cf <+55>:	mov    esi,0x0
   0x00005555555552d4 <+60>:	mov    rdi,rax
   0x00005555555552d7 <+63>:	call   0x5555555550b0 <setbuf@plt>
   0x00005555555552dc <+68>:	lea    rax,[rbp-0x1c]
   0x00005555555552e0 <+72>:	mov    rsi,rax
   0x00005555555552e3 <+75>:	lea    rdi,[rip+0xd1f]        # 0x555555556009
   0x00005555555552ea <+82>:	mov    eax,0x0
   0x00005555555552ef <+87>:	call   0x5555555550d0 <__isoc99_scanf@plt>
   0x00005555555552f4 <+92>:	movzx  eax,BYTE PTR [rbp-0x1c]
   0x00005555555552f8 <+96>:	cmp    al,0x63
   0x00005555555552fa <+98>:	jne    0x55555555535c <main+196>
   0x00005555555552fc <+100>:	movzx  eax,BYTE PTR [rbp-0x1b]
   0x0000555555555300 <+104>:	cmp    al,0x61
   0x0000555555555302 <+106>:	jne    0x55555555535c <main+196>
   0x0000555555555304 <+108>:	movzx  eax,BYTE PTR [rbp-0x1a]
   0x0000555555555308 <+112>:	cmp    al,0x6e
   0x000055555555530a <+114>:	jne    0x55555555535c <main+196>
   0x000055555555530c <+116>:	movzx  eax,BYTE PTR [rbp-0x19]
   0x0000555555555310 <+120>:	cmp    al,0x64
   0x0000555555555312 <+122>:	jne    0x55555555535c <main+196>
   0x0000555555555314 <+124>:	movzx  eax,BYTE PTR [rbp-0x18]
   0x0000555555555318 <+128>:	cmp    al,0x79
   0x000055555555531a <+130>:	jne    0x55555555535c <main+196>
   0x000055555555531c <+132>:	movzx  eax,BYTE PTR [rbp-0x17]
   0x0000555555555320 <+136>:	cmp    al,0x5f
   0x0000555555555322 <+138>:	jne    0x55555555535c <main+196>
   0x0000555555555324 <+140>:	movzx  eax,BYTE PTR [rbp-0x16]
   0x0000555555555328 <+144>:	cmp    al,0x69
   0x000055555555532a <+146>:	jne    0x55555555535c <main+196>
   0x000055555555532c <+148>:	movzx  eax,BYTE PTR [rbp-0x15]
   0x0000555555555330 <+152>:	cmp    al,0x73
   0x0000555555555332 <+154>:	jne    0x55555555535c <main+196>
   0x0000555555555334 <+156>:	movzx  eax,BYTE PTR [rbp-0x14]
   0x0000555555555338 <+160>:	cmp    al,0x5f
   0x000055555555533a <+162>:	jne    0x55555555535c <main+196>
   0x000055555555533c <+164>:	movzx  eax,BYTE PTR [rbp-0x13]
   0x0000555555555340 <+168>:	cmp    al,0x6e
   0x0000555555555342 <+170>:	jne    0x55555555535c <main+196>
   0x0000555555555344 <+172>:	movzx  eax,BYTE PTR [rbp-0x12]
   0x0000555555555348 <+176>:	cmp    al,0x69
   0x000055555555534a <+178>:	jne    0x55555555535c <main+196>
   0x000055555555534c <+180>:	movzx  eax,BYTE PTR [rbp-0x11]
   0x0000555555555350 <+184>:	cmp    al,0x63
   0x0000555555555352 <+186>:	jne    0x55555555535c <main+196>
   0x0000555555555354 <+188>:	movzx  eax,BYTE PTR [rbp-0x10]
   0x0000555555555358 <+192>:	cmp    al,0x65
   0x000055555555535a <+194>:	je     0x555555555377 <main+223>
   0x000055555555535c <+196>:	lea    rdi,[rip+0xcaf]        # 0x555555556012
   0x0000555555555363 <+203>:	mov    eax,0x0
   0x0000555555555368 <+208>:	call   0x555555555030 <printf@plt>
   0x000055555555536d <+213>:	mov    edi,0x1
   0x0000555555555372 <+218>:	call   0x555555555050 <exit@plt>
   0x0000555555555377 <+223>:	mov    DWORD PTR [rbp-0x4],0x0
   0x000055555555537e <+230>:	jmp    0x5555555553d5 <main+317>
   0x0000555555555380 <+232>:	mov    eax,DWORD PTR [rbp-0x4]
   0x0000555555555383 <+235>:	cdqe   
   0x0000555555555385 <+237>:	movzx  eax,BYTE PTR [rbp+rax*1-0x1c]
   0x000055555555538a <+242>:	and    eax,0x1
   0x000055555555538d <+245>:	test   al,al
   0x000055555555538f <+247>:	jne    0x5555555553d1 <main+313>
   0x0000555555555391 <+249>:	mov    eax,DWORD PTR [rbp-0x4]
   0x0000555555555394 <+252>:	cdqe   
   0x0000555555555396 <+254>:	movzx  eax,BYTE PTR [rbp+rax*1-0x1c]
   0x000055555555539b <+259>:	cmp    al,0x60
   0x000055555555539d <+261>:	jle    0x5555555553c7 <main+303>
   0x000055555555539f <+263>:	mov    eax,DWORD PTR [rbp-0x4]
   0x00005555555553a2 <+266>:	cdqe   
   0x00005555555553a4 <+268>:	movzx  eax,BYTE PTR [rbp+rax*1-0x1c]
   0x00005555555553a9 <+273>:	cmp    al,0x7a
   0x00005555555553ab <+275>:	jg     0x5555555553c7 <main+303>
   0x00005555555553ad <+277>:	mov    eax,DWORD PTR [rbp-0x4]
   0x00005555555553b0 <+280>:	cdqe   
   0x00005555555553b2 <+282>:	movzx  eax,BYTE PTR [rbp+rax*1-0x1c]
   0x00005555555553b7 <+287>:	sub    eax,0x20
   0x00005555555553ba <+290>:	mov    edx,eax
   0x00005555555553bc <+292>:	mov    eax,DWORD PTR [rbp-0x4]
   0x00005555555553bf <+295>:	cdqe   
   0x00005555555553c1 <+297>:	mov    BYTE PTR [rbp+rax*1-0x1c],dl
   0x00005555555553c5 <+301>:	jmp    0x5555555553d1 <main+313>
   0x00005555555553c7 <+303>:	mov    eax,DWORD PTR [rbp-0x4]
   0x00005555555553ca <+306>:	cdqe   
   0x00005555555553cc <+308>:	mov    BYTE PTR [rbp+rax*1-0x1c],0x5f
   0x00005555555553d1 <+313>:	add    DWORD PTR [rbp-0x4],0x1
   0x00005555555553d5 <+317>:	mov    eax,DWORD PTR [rbp-0x4]
   0x00005555555553d8 <+320>:	cdqe   
   0x00005555555553da <+322>:	movzx  eax,BYTE PTR [rbp+rax*1-0x1c]
   0x00005555555553df <+327>:	test   al,al
   0x00005555555553e1 <+329>:	jne    0x555555555380 <main+232>
   0x00005555555553e3 <+331>:	lea    rdi,[rip+0xc2d]        # 0x555555556017
   0x00005555555553ea <+338>:	call   0x555555555040 <puts@plt>
   0x00005555555553ef <+343>:	lea    rax,[rbp-0x1c]
   0x00005555555553f3 <+347>:	mov    rdi,rax
   0x00005555555553f6 <+350>:	call   0x5555555551d5 <function2>
   0x00005555555553fb <+355>:	mov    QWORD PTR [rbp-0x10],rax
   0x00005555555553ff <+359>:	mov    eax,0x0
   0x0000555555555404 <+364>:	leave  
   0x0000555555555405 <+365>:	ret    
End of assembler dump.
```

It is checking the input as `candy_is_nice` then doing some calulation and calling the `function2`.
So we just have to grab the return value of the function.
in x86/x64 the return value of a function is stored in EAX/RAX register.

so we just set a breakpoint at `main+355` next to the function call.

```bash
(gdb) b *0x00005555555553fb
Breakpoint 2 at 0x5555555553fb: file rev1.c, line 89.
(gdb) c
Continuing.
candy_is_nice
Cool

Breakpoint 2, 0x00005555555553fb in main () at rev1.c:89
89	in rev1.c
(gdb) x/s $rax
0x5555555592a0:	"`5a55d10766af2b4ee965bcd9923aa8a4398bbe13`"
(gdb) 
```

> FLAG : pesuctf{5a55d10766af2b4ee965bcd9923aa8a4398bbe13}

