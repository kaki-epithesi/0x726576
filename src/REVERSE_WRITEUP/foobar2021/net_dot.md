# NET DOT

[link to question](https://github.com/kaki-epithesi/0x726576/raw/master/rev_files/foobar2021/win.dll)
[link to c sharp file](https://github.com/kaki-epithesi/0x726576/raw/master/rev_files/foobar2021/Program.cs)

It was a .dll file, by name it was clear that it was a dot net file.

Solver Script

```py
#!/usr/bin/env python3

enc = [2410, 2404, 2430, 2408, 2391, 2381, 2333, 2396, 2369, 2332, 2398, 2422, 2332, 2397, 2416, 2370, 2393, 2304, 2393, 2333, 2416, 2376, 2371, 2305, 2377, 2391]

sum_all = ord('G') ^ 2410

flag = ''

for i in range(len(enc)):
    flag += chr((enc[i]^sum_all) + ((i%2)*2 + (i%3)*1))

print(flag)

```
> FLAG : GLUG{d0tn3t_1s_qu1t3_go0d}