# Login App

```

    Challenge
    12 Solves

Login App
200

"Admin share me this as an alternative to a web login. Is it really secure. "

Author :- Saumya Agrawal
```

[link to file](https://github.com/kaki-epithesi/0x726576/raw/master/rev_files/bsidesmh2020/Login_App)

```bash
root@kali:~/ctf/bsidesmh/rev# file Login_App
Login_App: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=3507aa01d32c34dc8e8c6462b764adb90a82768d, stripped
root@kali:~/ctf/bsidesmh/rev# ./Login_App

        .__  __.   .        .  .   .              .   ,       
        [__)(__ * _| _  __  |\/| _.|_  _.._. _. __|_ -+-._. _.
        [__).__)|(_](/,_)   |  |(_][ )(_][  (_]_) [ ) | [  (_]



        1> Login
        2> Get Flag
        0> exit

> 2
Enter 4 digit auth code : 1234
Wrong Code !!
root@kali:~/ctf/bsidesmh/rev#
```

I did some `basic static analysis`, and saw the strings which are coming are not there in the file .
it was a `packed binary` , but i was unable to detect packing . so i just used `gdb` to `generate a core file` while running

```bash
root@kali:~/ctf/bsidesmh/rev# gdb -q ./Login_App
Reading symbols from ./Login_App...
(No debugging symbols found in ./Login_App)
gdb-peda$ catch syscall exit_group
Catchpoint 1 (syscall 'exit_group' [231])
gdb-peda$ r
Starting program: /root/ctf/bsidesmh/rev/Login_App
[Attaching after process 52294 fork to child process 52298]
[New inferior 2 (process 52298)]
[Detaching after fork from parent process 52294]
[Inferior 1 (process 52294) detached]
process 52298 is executing new program: /root/ctf/bsidesmh/rev/Login_App
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".

        .__  __.   .        .  .   .              .   ,       
        [__)(__ * _| _  __  |\/| _.|_  _.._. _. __|_ -+-._. _.
        [__).__)|(_](/,_)   |  |(_][ )(_][  (_]_) [ ) | [  (_]



        1> Login
        2> Get Flag
        0> exit

> 2
Enter 4 digit auth code : 1234
Wrong Code !!
gdb-peda$ generate-core-file ffff
Saved corefile ffff
gdb-peda$ quit
```

```bash
root@kali:~/ctf/bsidesmh/rev# strings ffff | grep BMH
BMH{c4n_y0u_g3t_1n51d333}Tc
BMH{c4n_y0u_g3t_1n51d333}
BMH{c4n_y0u_g3t_1n51d333}
root@kali:~/ctf/bsidesmh/rev#
```
`easy-peasy.`

> flag : BMH{c4n_y0u_g3t_1n51d333}
