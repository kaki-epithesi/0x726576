# comparinator

[link to file](https://github.com/kaki-epithesi/0x726576/raw/master/rev_files/pesuctf2021/comparinator)

C decompile using ghidra
```c

undefined8 main(uint param_1,long param_2)

{
  undefined8 uVar1;
  long in_FS_OFFSET;
  int local_7c;
  uint local_78 [4];
  uint local_68;
  uint local_64;
  uint local_60;
  uint local_5c;
  uint local_58;
  uint local_54;
  uint local_50;
  uint local_4c;
  uint local_48;
  uint local_44;
  uint local_40;
  uint local_3c;
  uint local_38;
  uint local_34;
  uint local_30;
  uint local_2c;
  uint local_28;
  uint local_24;
  uint local_20;
  uint local_1c;
  uint local_18;
  long local_10;
  
  local_10 = *(long *)(in_FS_OFFSET + 0x28);
  if (param_1 == 0x1a) {
    local_7c = 0;
    while (local_7c < 0x19) {
      __isoc99_sscanf(*(undefined8 *)(param_2 + ((long)local_7c + 1) * 8),&DAT_00102004,
                      local_78 + local_7c);
      local_7c = local_7c + 1;
    }
    if (local_78[0] != 0x72) {
      printf("%d invalid\n",(ulong)local_78[0]);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_78[1] != 0x31) {
      printf("%d invalid\n",(ulong)local_78[1]);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_78[2] != 0x67) {
      printf("%d invalid\n",(ulong)local_78[2]);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_78[3] != 0x68) {
      printf("%d invalid\n",(ulong)local_78[3]);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_68 != 0x74) {
      printf("%d invalid\n",(ulong)local_68);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_64 != 0x5f) {
      printf("%d invalid\n",(ulong)local_64);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_60 != 0x68) {
      printf("%d invalid\n",(ulong)local_60);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_5c != 0x33) {
      printf("%d invalid\n",(ulong)local_5c);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_58 != 0x72) {
      printf("%d invalid\n",(ulong)local_58);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_54 != 0x33) {
      printf("%d invalid\n",(ulong)local_54);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_50 != 0x5f) {
      printf("%d invalid\n",(ulong)local_50);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_4c != 0x74) {
      printf("%d invalid\n",(ulong)local_4c);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_48 != 0x68) {
      printf("%d invalid\n",(ulong)local_48);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_44 != 0x65) {
      printf("%d invalid\n",(ulong)local_44);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_40 != 0x5f) {
      printf("%d invalid\n",(ulong)local_40);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_3c != 0x77) {
      printf("%d invalid\n",(ulong)local_3c);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_38 != 0x68) {
      printf("%d invalid\n",(ulong)local_38);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_34 != 0x30) {
      printf("%d invalid\n",(ulong)local_34);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_30 != 0x6c) {
      printf("%d invalid\n",(ulong)local_30);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_2c != 0x65) {
      printf("%d invalid\n",(ulong)local_2c);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_28 != 0x5f) {
      printf("%d invalid\n",(ulong)local_28);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_24 != 0x74) {
      printf("%d invalid\n",(ulong)local_24);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_20 != 0x31) {
      printf("%d invalid\n",(ulong)local_20);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_1c != 0x6d) {
      printf("%d invalid\n",(ulong)local_1c);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    if (local_18 != 0x33) {
      printf("%d invalid\n",(ulong)local_18);
      uVar1 = 1;
      goto LAB_001015fd;
    }
    puts("valid");
  }
  else {
    printf("invalid %d\n",(ulong)param_1);
  }
  uVar1 = 0;
LAB_001015fd:
  if (local_10 != *(long *)(in_FS_OFFSET + 0x28)) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail();
  }
  return uVar1;
}
```


```bash
>>> s = [0x72,0x31,0x67,0x68,0x74,0x5f,0x68,0x33,0x72,0x33,0x5f,0x74,0x68,0x65,0x5f,0x77,0x68,0x30,0x6c,0x65,0x5f,0x74,0x31,0x6d,0x33]
>>> for i in s:
...     print(chr(i),end='')
... 
r1ght_h3r3_the_wh0le_t1m3>>> 
>>> 
```


```bash
$ ./comparinator r 1 g h t _ h 3 r 3 _ t h e _ w h 0 l e _ t 1 m 3
0 invalid
```

> FLAG : pesuctf{r1ght_h3r3_the_wh0le_t1m3}