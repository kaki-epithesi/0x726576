# Z3AL

[link to file](https://github.com/kaki-epithesi/0x726576/raw/master/rev_files/pesuctf2021/Chall)


From the name we can easily understand there will be so many functions, whic we have to solve to get the flag.


```c
undefined8 FUN_00101b90(int param_1,undefined8 *param_2)

{
  char *__s;
  int iVar1;
  size_t sVar2;
  
  if (param_1 < 2) {
    printf("Usage: %s <key>\n",*param_2);
  }
  else {
    __s = (char *)param_2[1];
    sVar2 = strlen(__s);
    if ((int)sVar2 == 0x26) {
      iVar1 = FUN_00101159(__s);
      if (iVar1 == 0) {
        puts(":(");
      }
      else {
        puts(":)");
      }
    }
    else {
      puts(":(");
    }
  }
  return 0;
}
```
from main we got that the flag length is `0x26`.

```c

undefined8 FUN_00101159(byte *param_1)

{
  undefined8 uVar1;
  
  if (((((((byte)(param_1[4] ^ *param_1 ^ param_1[2]) == 0x60) &&
         ((byte)(param_1[8] ^ param_1[4] ^ param_1[6]) == 0x36)) &&
        ((byte)(param_1[0xc] ^ param_1[8] ^ param_1[10]) == 0x71)) &&
       (((((byte)(param_1[0x10] ^ param_1[0xc] ^ param_1[0xe]) == 0x32 &&
          ((byte)(param_1[0x14] ^ param_1[0x10] ^ param_1[0x12]) == 0x3f)) &&
         (((byte)(param_1[0x18] ^ param_1[0x14] ^ param_1[0x16]) == 1 &&
          (((byte)(param_1[0x1c] ^ param_1[0x18] ^ param_1[0x1a]) == 0x2a &&
           ((byte)(param_1[0x20] ^ param_1[0x1c] ^ param_1[0x1e]) == 0x3f)))))) &&
        (((byte)(param_1[0x24] ^ param_1[0x20] ^ param_1[0x22]) == 0x7a &&
         (((((byte)(param_1[5] ^ param_1[1] ^ param_1[3]) == 100 &&
            ((byte)(param_1[9] ^ param_1[5] ^ param_1[7]) == 0x7e)) &&
           ((byte)(param_1[0xd] ^ param_1[9] ^ param_1[0xb]) == 0x74)) &&
          (((param_1[0xd] ^ param_1[0xf]) == param_1[0x11] &&
           ((byte)(param_1[0x15] ^ param_1[0x11] ^ param_1[0x13]) == 0x58)))))))))) &&
      (((((byte)(param_1[0x19] ^ param_1[0x15] ^ param_1[0x17]) == 0x62 &&
         (((byte)(param_1[0x1d] ^ param_1[0x19] ^ param_1[0x1b]) == 0x5b &&
          ((byte)(param_1[0x21] ^ param_1[0x1d] ^ param_1[0x1f]) == 0x5c)))) &&
        ((byte)(param_1[0x25] ^ param_1[0x21] ^ param_1[0x23]) == 0x62)) &&
       ((((((((byte)(param_1[3] ^ *param_1 ^ param_1[1]) == 0x60 &&
             ((byte)(param_1[6] ^ param_1[3] ^ param_1[4]) == 0x70)) &&
            ((byte)(param_1[9] ^ param_1[6] ^ param_1[7]) == 0x6c)) &&
           (((byte)(param_1[0xc] ^ param_1[9] ^ param_1[10]) == 0x33 &&
            ((byte)(param_1[0xf] ^ param_1[0xc] ^ param_1[0xd]) == 0x68)))) &&
          (((byte)(param_1[0x12] ^ param_1[0xf] ^ param_1[0x10]) == 0x3f &&
           (((byte)(param_1[0x15] ^ param_1[0x12] ^ param_1[0x13]) == 99 &&
            ((byte)(param_1[0x18] ^ param_1[0x15] ^ param_1[0x16]) == 0x58)))))) &&
         ((byte)(param_1[0x1b] ^ param_1[0x18] ^ param_1[0x19]) == 0x34)) &&
        ((((byte)(param_1[0x1e] ^ param_1[0x1b] ^ param_1[0x1c]) == 0x75 &&
          ((byte)(param_1[0x21] ^ param_1[0x1e] ^ param_1[0x1f]) == 0x37)) &&
         ((byte)(param_1[0x24] ^ param_1[0x21] ^ param_1[0x22]) == 0x6e)))))))) &&
     (((((((byte)(param_1[4] ^ param_1[1] ^ param_1[2]) == 0x75 &&
          ((byte)(param_1[7] ^ param_1[4] ^ param_1[5]) == 0x6c)) &&
         (((byte)(param_1[10] ^ param_1[7] ^ param_1[8]) == 0x3d &&
          (((byte)(param_1[0xd] ^ param_1[10] ^ param_1[0xb]) == 0x70 &&
           ((byte)(param_1[0x10] ^ param_1[0xd] ^ param_1[0xe]) == 0x34)))))) &&
        ((byte)(param_1[0x13] ^ param_1[0x10] ^ param_1[0x11]) == 0x5a)) &&
       (((((((byte)(param_1[0x16] ^ param_1[0x13] ^ param_1[0x14]) == 1 &&
            ((byte)(param_1[0x19] ^ param_1[0x16] ^ param_1[0x17]) == 10)) &&
           ((byte)(param_1[0x1c] ^ param_1[0x19] ^ param_1[0x1a]) == 0x2d)) &&
          ((((byte)(param_1[0x1f] ^ param_1[0x1c] ^ param_1[0x1d]) == 0x43 &&
            ((byte)(param_1[0x22] ^ param_1[0x1f] ^ param_1[0x20]) == 0x27)) &&
           (((byte)(param_1[0x25] ^ param_1[0x22] ^ param_1[0x23]) == 0x3f &&
            (((byte)(param_1[6] ^ *param_1 ^ param_1[4]) == 0x75 &&
             ((byte)(param_1[10] ^ param_1[4] ^ param_1[8]) == 0x25)))))))) &&
         ((byte)(param_1[0xe] ^ param_1[8] ^ param_1[0xc]) == 0x34)) &&
        ((((((byte)(param_1[0x12] ^ param_1[0xc] ^ param_1[0x10]) == 0x66 &&
            ((byte)(param_1[0x16] ^ param_1[0x10] ^ param_1[0x14]) == 4)) &&
           ((byte)(param_1[0x1a] ^ param_1[0x14] ^ param_1[0x18]) == 0x36)) &&
          (((byte)(param_1[0x1e] ^ param_1[0x18] ^ param_1[0x1c]) == 0x76 &&
           ((byte)(param_1[0x22] ^ param_1[0x1c] ^ param_1[0x20]) == 0x3b)))) &&
         ((byte)(param_1[7] ^ param_1[1] ^ param_1[5]) == 0x6a)))))) &&
      (((((byte)(param_1[0xb] ^ param_1[5] ^ param_1[9]) == 0x31 &&
         ((byte)(param_1[0xf] ^ param_1[9] ^ param_1[0xd]) == 0x2e)) &&
        (((byte)(param_1[0x13] ^ param_1[0xd] ^ param_1[0x11]) == 0x5e &&
         ((((byte)(param_1[0x17] ^ param_1[0x11] ^ param_1[0x15]) == 10 &&
           ((byte)(param_1[0x1b] ^ param_1[0x15] ^ param_1[0x19]) == 0x33)) &&
          ((byte)(param_1[0x1f] ^ param_1[0x19] ^ param_1[0x1d]) == 6)))))) &&
       ((int)(char)(param_1[0x21] ^ param_1[0x1d]) != (uint)(param_1[0x23] == 0x40))))))) {
    uVar1 = 1;
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}
```
So i just wrote a simple z3 python script to solve the question.

```py

#!/usr/bin/env python3

from z3 import *


flag = [BitVec(f"flag[{i}]",8) for i in range(0x26)]
s = Solver()
s.add(flag[37]==125)
s.add(flag[4] ^ flag[0] ^ flag[2] == 0x60 )
s.add(flag[8] ^ flag[4] ^ flag[6] == 0x36 )
s.add(flag[0xc] ^ flag[8] ^ flag[10] == 0x71 )
s.add(flag[0x10] ^ flag[0xc] ^ flag[0xe] == 0x32 )
s.add(flag[0x14] ^ flag[0x10] ^ flag[0x12] == 0x3f )
s.add(flag[0x18] ^ flag[0x14] ^ flag[0x16] == 1 )
s.add(flag[0x1c] ^ flag[0x18] ^ flag[0x1a] == 0x2a )
s.add(flag[0x20] ^ flag[0x1c] ^ flag[0x1e] == 0x3f )
s.add(flag[0x24] ^ flag[0x20] ^ flag[0x22] == 0x7a )
s.add(flag[5] ^ flag[1] ^ flag[3] == 100 )
s.add(flag[9] ^ flag[5] ^ flag[7] == 0x7e )
s.add(flag[0xd] ^ flag[9] ^ flag[0xb] == 0x74 )
s.add(flag[0xd] ^ flag[0xf] == flag[0x11] )
s.add(flag[0x15] ^ flag[0x11] ^ flag[0x13] == 0x58 )
s.add(flag[0x19] ^ flag[0x15] ^ flag[0x17] == 0x62 )
s.add(flag[0x1d] ^ flag[0x19] ^ flag[0x1b] == 0x5b )
s.add(flag[0x21] ^ flag[0x1d] ^ flag[0x1f] == 0x5c )
s.add(flag[0x25] ^ flag[0x21] ^ flag[0x23] == 0x62 )
s.add(flag[3] ^ flag[0] ^ flag[1] == 0x60 )
s.add(flag[6] ^ flag[3] ^ flag[4] == 0x70 )
s.add(flag[9] ^ flag[6] ^ flag[7] == 0x6c )
s.add(flag[0xc] ^ flag[9] ^ flag[10] == 0x33 )
s.add(flag[0xf] ^ flag[0xc] ^ flag[0xd] == 0x68 )
s.add(flag[0x12] ^ flag[0xf] ^ flag[0x10] == 0x3f )
s.add(flag[0x15] ^ flag[0x12] ^ flag[0x13] == 99 )
s.add(flag[0x18] ^ flag[0x15] ^ flag[0x16] == 0x58 )
s.add(flag[0x1b] ^ flag[0x18] ^ flag[0x19] == 0x34 )
s.add(flag[0x1e] ^ flag[0x1b] ^ flag[0x1c] == 0x75 )
s.add(flag[0x21] ^ flag[0x1e] ^ flag[0x1f] == 0x37 )
s.add(flag[0x24] ^ flag[0x21] ^ flag[0x22] == 0x6e )
s.add(flag[4] ^ flag[1] ^ flag[2] == 0x75 )
s.add(flag[7] ^ flag[4] ^ flag[5] == 0x6c )
s.add(flag[10] ^ flag[7] ^ flag[8] == 0x3d )
s.add(flag[0xd] ^ flag[10] ^ flag[0xb] == 0x70 )
s.add(flag[0x10] ^ flag[0xd] ^ flag[0xe] == 0x34 )
s.add(flag[0x13] ^ flag[0x10] ^ flag[0x11] == 0x5a )
s.add(flag[0x16] ^ flag[0x13] ^ flag[0x14] == 1 )
s.add(flag[0x19] ^ flag[0x16] ^ flag[0x17] == 10 )
s.add(flag[0x1c] ^ flag[0x19] ^ flag[0x1a] == 0x2d )
s.add(flag[0x1f] ^ flag[0x1c] ^ flag[0x1d] == 0x43 )
s.add(flag[0x22] ^ flag[0x1f] ^ flag[0x20] == 0x27 )
s.add(flag[0x25] ^ flag[0x22] ^ flag[0x23] == 0x3f )
s.add(flag[6] ^ flag[0] ^ flag[4] == 0x75 )
s.add(flag[10] ^ flag[4] ^ flag[8] == 0x25 )
s.add(flag[0xe] ^ flag[8] ^ flag[0xc] == 0x34 )
s.add(flag[0x12] ^ flag[0xc] ^ flag[0x10] == 0x66 )
s.add(flag[0x16] ^ flag[0x10] ^ flag[0x14] == 4 )
s.add(flag[0x1a] ^ flag[0x14] ^ flag[0x18] == 0x36 )
s.add(flag[0x1e] ^ flag[0x18] ^ flag[0x1c] == 0x76 )
s.add(flag[0x22] ^ flag[0x1c] ^ flag[0x20] == 0x3b )
s.add(flag[7] ^ flag[1] ^ flag[5] == 0x6a )
s.add(flag[0xb] ^ flag[5] ^ flag[9] == 0x31 )
s.add(flag[0xf] ^ flag[9] ^ flag[0xd] == 0x2e )
s.add(flag[0x13] ^ flag[0xd] ^ flag[0x11] == 0x5e )
s.add(flag[0x17] ^ flag[0x11] ^ flag[0x15] == 10 )
s.add(flag[0x1b] ^ flag[0x15] ^ flag[0x19] == 0x33 )
s.add(flag[0x1f] ^ flag[0x19] ^ flag[0x1d] == 6 )

print(s.check())
if(str(s.check()) == "sat"):
	l = [flag[0],flag[1],flag[2],flag[3],flag[4],flag[5],flag[6],flag[7],flag[8],flag[9],flag[10],flag[11],flag[12],flag[13],flag[14],flag[15],flag[16],flag[17],flag[18],flag[19],flag[20],flag[21],flag[22],flag[23],flag[24],flag[25],flag[26],flag[27],flag[28],flag[29],flag[30],flag[31],flag[32],flag[33],flag[34],flag[35],flag[36],flag[37]]
	f = ''.join([chr(s.model()[i].as_long()) for i in l ])
	print(f)
```

```bash
$ ./z3al.py 
sat
pesuctf{3qu4710n5_d0n7_b07h3r_4nym0r3}
```

> FLAG : pesuctf{3qu4710n5_d0n7_b07h3r_4nym0r3}