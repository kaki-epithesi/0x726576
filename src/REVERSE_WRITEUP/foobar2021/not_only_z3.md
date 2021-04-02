# NOT_ONLY_Z3

[link to question](https://github.com/kaki-epithesi/0x726576/raw/master/rev_files/foobar2021/not_only_z3)

simple graph

`input` -> `md5` -> `shuffling of md5` -> `checking 30 equations for validity.`

sol:

1.>cracking the solution of equation by z3.

2.>deshuffling the cracked solution.

3.>cracking the md5 to get the password.
(Note: the password doesnt exist in rockyou.txt)


Z3 Solve script

```py
#!/usr/bin/env python3

from z3 import *

flag_hash = ''
for it in range(6):
	a = Real('a')
	b = Real('b')
	c = Real('c')
	d = Real('d')
	e = Real('e')
	s = Solver()
	if it == 0:
		s.add(9*a + 3*b + 8*c + 4*d + 2*e == 1328,6*a + 7*b + 7*c + 6*d + 7*e == 1685,4*a + 5*b + 4*c + 4*d + 6*e == 1176,9*a + 3*b + 1*c + 4*d + 7*e == 1245,1*a + 1*b + 7*c + 1*d + 7*e == 862)
	elif it == 1:
		s.add(1*a + 2*b + 4*c + 2*d + 8*e == 1277,9*a + 9*b + 4*c + 3*d + 8*e == 2151,7*a + 3*b + 6*c + 6*d + 1*e == 1302,3*a + 6*b + 4*c + 1*d + 1*e == 852,9*a + 5*b + 9*c + 4*d + 4*e == 1871)
	elif it == 2:
		s.add(6*a + 7*b + 9*c + 2*d + 3*e == 1724,6*a + 9*b + 3*c + 2*d + 5*e == 1712,4*a + 6*b + 6*c + 9*d + 3*e == 1703,4*a + 6*b + 7*c + 7*d + 2*e == 1605,1*a + 6*b + 7*c + 9*d + 2*e == 1551)
	elif it == 3:
		s.add(6*a + 8*b + 4*c + 4*d + 2*e == 1822,5*a + 5*b + 4*c + 6*d + 3*e == 1784,5*a + 7*b + 4*c + 1*d + 5*e == 1800,6*a + 3*b + 9*c + 1*d + 7*e == 2399,3*a + 7*b + 5*c + 5*d + 2*e == 1622)
	elif it == 4:
		s.add(1*a + 6*b + 6*c + 9*d + 1*e == 1263,9*a + 1*b + 6*c + 1*d + 9*e == 1370,4*a + 7*b + 6*c + 9*d + 5*e == 1686,3*a + 6*b + 7*c + 5*d + 2*e == 1250,4*a + 8*b + 1*c + 5*d + 3*e == 1157)
	elif it == 5:
		s.add(1*a + 8*b + 5*c + 4*d + 9*e == 1400,1*a + 6*b + 3*c + 8*d + 1*e == 1012,5*a + 6*b + 1*c + 7*d + 8*e == 1427,1*a + 4*b + 5*c + 5*d + 2*e == 895,2*a + 3*b + 7*c + 7*d + 3*e == 1163)
	s.check()
	m = s.model()
	vs = [(str(v),chr(int(str(m[v])))) for v in m]
	arr = ['0']*5
	for i in vs:
		arr[ord(i[0])-ord('a')] = i[1]
	for i in arr:
		flag_hash += str(i)
flag_hash += '7'
flag_hash += '3'

print(flag_hash)

```
```bash
$ ./solver.py 
401749466c2b507f1c8c694836338373
```

reshuffle to get the actual md5 string

reshuffle script

```c
#include<stdio.h>

int main(int argc, char const *argv[])
{
	char inp[33];
	scanf("%s",inp);
	int ar[5][5];
	for(int i = 0;i < 25;i++)
		ar[(int)(i/5)][i%5] = (int)inp[i];
	printf("\nMATRIX : \n");
	for(int i = 0;i< 5; i++){
		for(int j = 0; j < 5; j++){
			printf("%d,",ar[i][j]);
		}
		printf("\n");
	}
	for(int i = 0;i< 5; i++){
		for(int j = 0; j < 2; j++){
			ar[i][j] ^= ar[i][3+j];
			ar[i][3+j] ^= ar[i][j];
			ar[i][j] ^= ar[i][3+j];
		}
	}
	printf("\nMATRIX : \n");
	for(int i = 0;i< 5; i++){
		for(int j = 0; j < 5; j++){
			printf("%d,",ar[i][j]);
		}
		printf("\n");
	}
	for(int i = 0;i < 25;i++)
		inp[i] = (char)ar[(int)(i/5)][i%5];
	printf("\nShuffled string : %s\n",inp);

	return 0;
}
```

```bash
$ ./test 
401749466c2b507f1c8c694836338373

MATRIX : 
52,48,49,55,52,
57,52,54,54,99,
50,98,53,48,55,
102,49,99,56,99,
54,57,52,56,51,

MATRIX : 
55,52,49,52,48,
54,99,54,57,52,
48,55,53,50,98,
56,99,99,102,49,
56,51,52,54,57,

Shuffled string : 741406c6940752b8ccf1834696338373

```
final output : 741406c6940752b8ccf1834696338373

If we crack this md5 hash we will get `p4ssw0rd!`    (it can be crackable in crackstation.net)


Getting the flag
```bash
$ ./not_only_z3 
Enter the string : p4ssw0rd!

Conratulations : GLUG{p4ssw0rd!_401749466c2b507f1c8c694836338373}

```

> FLAG : GLUG{p4ssw0rd!_401749466c2b507f1c8c694836338373}