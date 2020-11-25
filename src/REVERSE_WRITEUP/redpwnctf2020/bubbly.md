# BUBBLY

[link to file](https://github.com/kaki-epithesi/0x726576/raw/master/rev_files/redpwnctf2020/bubbly)

```bash
root@kali:~/ctf/redpwn/rev# file bubbly
bubbly: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=edb56d2d9355bcee01909f171d8a272a3e82d053, with debug_info, not stripped
root@kali:~/ctf/redpwn/rev# ./bubbly
I hate my data structures class! Why can't I just sort by hand?
1
2
1111
Try again!
root@kali:~/ctf/redpwn/rev#
```

There were 3 functions , `main`, `check`, `print_flag`.

```c
int main(void)

{
  uint32_t i;
  int unused;
  Bool pass;

  setbuf(stdout,(char *)0x0)
  setbuf(stdin,(char *)0x0);
  setbuf(stderr,(char *)0x0);
  puts("I hate my data structures class! Why can\'t I just sort by hand?");
  pass = false;
  while( true ) {
    __isoc99_scanf(&DAT_00102058);
    if (8 < i) break;
    nums[i] = nums[i] ^ nums[i + 1];
    nums[i + 1] = nums[i + 1] ^ nums[i];
    nums[i] = nums[i] ^ nums[i + 1];
    pass = check();
  }
  if (pass == false) {
    puts("Try again!");
  }
  else {
    puts("Well done!");
    print_flag();
  }
  return 0;
}

_Bool check(void)

{
  uint32_t i;
  _Bool pass;

  i = 0;
  while( true ) {
    if (8 < i) {
      return true;
    }
    if (nums[i + 1] < nums[i]) break;
    i = i + 1;
  }
  return false;
}
```
`print_flag` is just printing the flag

there is an predefined array `nums` of size 10.

```bash
gdb-peda$ x/24w nums
0x555555558060 <nums>:  0x00000001      0x0000000a      0x00000003      0x00000002
0x555555558070 <nums+16>:       0x00000005      0x00000009      0x00000008      0x00000007
0x555555558080 <nums+32>:       0x00000004      0x00000006      0x00000000      0x00000000
```
`nums = [1,10,3,2,5,9,8,7,4,6]`

whatever value we are giving it is swapping it with the next value, if we give an input greater than 8 it ends the while loop and checks the array `nums` is sorted or not , if it is sorted then it will print the flag.There are so many solutions for this question.

```bash
root@kali:~/ctf/redpwn/rev# nc 2020.redpwnc.tf 31039
I hate my data structures class! Why can't I just sort by hand?
1
2
3
4
5
6
7
8
1
4
5
6
7
4
5
6
4
3
5
10
Well done!
flag{4ft3r_y0u_put_u54c0_0n_y0ur_c011ege_4pp5_y0u_5t1ll_h4ve_t0_d0_th15_57uff}
root@kali:~/ctf/redpwn/rev#
```
