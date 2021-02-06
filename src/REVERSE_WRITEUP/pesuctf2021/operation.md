# OPERATION

[link to file](https://github.com/kaki-epithesi/0x726576/raw/master/rev_files/pesuctf2021/Operation)

Question : What will be the input if output is `2svj153vum`
```c

undefined8 main(void)

{
  undefined local_1a [10];
  char *local_10;
  
  setbuf(stdout,(char *)0x0);
  setbuf(stdin,(char *)0x0);
  setbuf(stderr,(char *)0x0);
  local_10 = (char *)malloc(0xb);
  __isoc99_scanf("%[^\n]%*c",local_1a);
  local_10 = (char *)operation(local_1a);
  puts(local_10);
  return 0;
}


void * operation(char *param_1)

{
  size_t sVar1;
  ulong uVar2;
  char local_44 [11];
  char local_39;
  int local_38;
  char local_31;
  void *local_30;
  int local_24;
  int local_20;
  int local_1c;
  
  local_30 = malloc(0xb);
  local_1c = 0;
  while( true ) {
    uVar2 = SEXT48(local_1c);
    sVar1 = strlen(param_1);
    if (sVar1 <= uVar2) break;
    if ((param_1[local_1c] < 'a') || ('z' < param_1[local_1c])) {
      local_44[local_1c] = param_1[local_1c];
    }
    else {
      local_31 = param_1[local_1c] + '\x0f';
      if (local_31 < '{') {
        local_44[local_1c] = local_31;
      }
      else {
        local_38 = 0x7a - param_1[local_1c];
        local_39 = (char)local_38 + '_';
        local_44[local_1c] = local_39;
      }
    }
    local_1c = local_1c + 1;
  }
  local_20 = 0;
  sVar1 = strlen(local_44);
  local_24 = (int)sVar1 + -2;
  while (-1 < local_24) {
    *(char *)((long)local_24 + (long)local_30) = local_44[local_20];
    *(char *)((long)local_24 + 1 + (long)local_30) = local_44[local_20 + 1];
    local_20 = local_20 + 2;
    local_24 = local_24 + -2;
  }
  return local_30;
}

```

So i wrote a python script which completely reverses the code

```py
#!/usr/bin/env python3

out = '2svj153vum'
r1 = ''
for i in range(8,-1,-2):
	r1 += out[i]
	r1 += out[i+1]
# print(r1)

flag = 'pesuctf{'

for i in r1:
	if i in '0123456789':
		flag += i
	elif ord(i)-15 > ord('a') :
		flag += chr(ord(i)-15)
	else:
		flag += chr(122 - ord(i) + 95 )
flag += '}'
print(flag)
```

```bash
$ ./operation.py 
pesuctf{fl3g15go2d}
```
> FLAG : pesuctf{fl3g15go2d}