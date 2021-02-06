# snake

[link to file](https://github.com/kaki-epithesi/0x726576/raw/master/rev_files/pesuctf2021/snake)

C decompile code using ghidra


**MAIN**
```c
undefined8 main(EVP_PKEY_CTX *param_1,int param_2)

{
  undefined8 uVar1;
  
  init(param_1);
  layout();
  play();
  uVar1 = stdscr;
  wgetch();
  kill((__pid_t)uVar1,param_2);
  return 0;
}
```

There were so many functions, basically it a snake which we play on nokia 3310.

layout2 function was interesting

```c

void layout2(void)

{
  int iVar1;
  size_t sVar2;
  
  iVar1 = centrex;
  sVar2 = strlen("_nOt_foUnd}");
  iVar1 = (iVar1 - (int)(sVar2 >> 1)) + 2;
  mvprintw(centrey,iVar1,"_nOt_foUnd}",iVar1);
  iVar1 = centrex;
  sVar2 = strlen("pesuctf{h0mE");
  iVar1 = (iVar1 - (int)sVar2) + 1;
  mvprintw(centrey,iVar1,"pesuctf{h0mE",iVar1);
  return;
}
```
`mvprintw` : this function takes 3 params , `x` and `y` coordinate of the screen , and the data to be printed.

`(int)(sVar2 >> 1)) + 2` evaluating came as `7`.
so from where i can easily guess the flag.

> FLAG : pesuctf{h0mE_foUnd}