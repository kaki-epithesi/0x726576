# WARGAMES

[link to file](https://github.com/kaki-epithesi/0x726576/raw/master/rev_files/foobar2021/wargames.cpython-38.pyc)

chall : nc chall.nitdgplug.org 30419

solver script

```py
t = [159, 218, 153, 214, 45, 206, 153, 374]

print("Launchcode : ",end='')
for i in range(0,len(t),2):
    print(chr((t[i]^69)>>1),end='')
    print(chr((t[i+1]^10)>>2),end='')

sol = [192, 18, 117, -32, 120, -16, 173, -2]
key = "PEACEOUT"
res = []
for i in range(len(sol)):
    if i & 1 == 1:
        res.append(chr((ord(key[i]) - sol[i])))
    else:
        res.append(chr(((sol[i]) - ord(key[i]))))

for i in res:
    print(i,end='')

KEY = "There's no way to win"
DICT = "abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%`+^&*(){}[]\";?'\/<>~=:-_.   |,"
I = 7
S = [123, 47, 86, 28, 74, 50, 32, 114]
KEYOUT = []
RESULT = []
for i in S:
    for X in DICT:
        DATA=(ord(X) + I ^ ord(KEY[I])) % 255
        if DATA==i:
            KEYOUT.append(DATA)
            I = (I + 1) % len(KEY)
            RESULT.append(X)
            break
for i in RESULT:
    print(i,end='')
print()
```

`Launchcode : m4n741n_p34c3_XVT9022GLD`

> FLAG : GLUG{15_7h15_r34l_0r_15_17_g4m3??}