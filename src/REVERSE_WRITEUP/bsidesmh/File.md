# File
```

    Challenge
    11 Solves

File
100

Author :- Vibhu Bansal

```

[link to file](https://github.com/kaki-epithesi/0x726576/raw/master/rev_files/bsidesmh2020/file_-_Vibhu_Bansal)

```bash
root@kali:~/ctf/bsidesmh/rev# file file_-_Vibhu_Bansal
file_-_Vibhu_Bansal: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, Go BuildID=v1Iv2nQi31NDwFtWqyYe/wXLgARnjy_BmqFgOKixW/AywtSac820tpDw2BaA9j/h_s0a_dHBmMZT0Ia_LNJ, not stripped
root@kali:~/ctf/bsidesmh/rev# ./file_-_Vibhu_Bansal
Welcome , to Key Exchange Portal
Please Enter your Key: 1234
root@kali:~/ctf/bsidesmh/rev#
```

It was a Go-lang build file .

i used ghidra to see decompiled of main.main()

```bash

void main.main(void)

{
  undefined **ppuVar1;
  long *plVar2;
  long **pplVar3;
  long in_FS_OFFSET;
  undefined *puStack16;

  while (ppuVar1 = (undefined **)(*(long *)(in_FS_OFFSET + 0xfffffff8) + 0x10),
        &puStack16 < *ppuVar1 || &puStack16 == (undefined **)*ppuVar1) {
    runtime.morestack_noctxt();
  }
  puStack16 = &UNK_004e94b0;
  fmt.Fprintln();
  pplVar3 = os.Stdout;
  fmt.Fprint();
  runtime.newobject();
  fmt.Fscanln();
  plVar2 = *pplVar3;
  if ((((pplVar3[1] == (long *)0xe) && (*plVar2 == 0x6173736575676e75)) &&
      (*(int *)(plVar2 + 1) == 0x31656c62)) && (*(short *)((long)plVar2 + 0xc) == 0x3332)) {
    fmt.Fprintln();
  }
  return;
}
```
we can see it comparing with the hex values.

`unguessable123`

```bash
root@kali:~/ctf/bsidesmh/rev# ./file_-_Vibhu_Bansal
Welcome , to Key Exchange Portal
Please Enter your Key: unguessable123
czNtcGwzX3IzdjNyczMK
```

It gave us some sort of key .
it was just b64 encoded.

```bash
root@kali:~/ctf/bsidesmh/rev# echo "czNtcGwzX3IzdjNyczMK" | base64 -d
s3mpl3_r3v3rs3
```

> flag : BMH{s3mpl3_r3v3rs3}
