# S3CRET

a .pyc file was given

[link to file]()

```bash
root@kali:~/ctf/phantomctf/rev# uncompyle6 s3cr3t.pyc
# uncompyle6 version 3.7.3
# Python bytecode 3.7 (3394)
# Decompiled from: Python 2.7.17 (default, Jan 19 2020, 19:54:54)
# [GCC 9.2.1 20200110]
# Warning: this version of Python has problems handling the Python 3 "byte" type in constants properly.

# Embedded file name: source.py
# Compiled at: 2020-08-18 14:40:36
# Size of source mod 2**32: 741 bytes


def kraitrot(input, d):
    Lf = input[0:d]
    Ls = input[d:]
    return Ls + Lf


def cobraverse(s):
    g = ''
    g += s[1::2]
    g += s[0::2]
    return g


def vipershift(s):
    g = ''
    for i in range(len(s)):
        a = hex(ord(s[i]) + 20)[2:]
        g += a

    return g


s3rc3t = input("Enter the secret to get access to python's cave : ")
if len(s3rc3t) < 28:
    print('Add little more weight :::\n')
else:
    if vipershift(cobraverse(kraitrot(s3rc3t, 15))) == '867387738d7c8284688f454745737c4488894784884491575a807a738787':
        print("\nWhy does Python live on land?\nBecause it's above C-level . XD!! \nCongrats for the flag anyways")
    else:
        print('Maybe a python bit you , better luck next time :((')
# okay decompiling s3cr3t.pyc
```

**SOLUTION**

```py
#!/usr/bin/env python3
# -*- coding : utf-8 -*-


# 867387738d7c8284688f454745737c4488894784884491575a807a738787
#l[0] = 0x86 - 20
l = [114, 95, 115, 95, 121, 104, 110, 112, 84, 123, 49, 51, 49, 95, 104, 48, 116, 117, 51, 112, 116, 48, 125, 67, 70, 108, 102, 95, 115, 115]

st = ''
for i in l:
    st += chr(i)

s1 = st[:15]
s2 = st[15:]


f1 = ''

for i in range(15):
    f1 += s2[i]
    f1 += s1[i]
flag = ''
flag = f1[15:] + f1[:15]

print(flag)
```

```bash
root@kali:~/ctf/phantomctf/rev# ./s3c_solve.py
pCTF{l1f3_1s_sh0rt_us3_pyth0n}
root@kali:~/ctf/phantomctf/rev# ./s3cr3t.pyc
Enter the secret to get access to python's cave : pCTF{l1f3_1s_sh0rt_us3_pyth0n}

Why does Python live on land?
Because it's above C-level . XD!!
Congrats for the flag anyways
root@kali:~/ctf/phantomctf/rev#
```
