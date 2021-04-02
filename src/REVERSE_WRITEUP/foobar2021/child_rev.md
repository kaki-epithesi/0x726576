# CHILD REV

[link to question](https://github.com/kaki-epithesi/0x726576/raw/master/rev_files/foobar2021/childrev)

Solver script

```py
#!/usr/bin/env python3

def key_gen():
    # adding ascii value of "G","L","U","G"
    key = ord('G') + ord('L') + ord('U') + ord('G')
    # logical shift left by 4 twice, basically lsl by 8
    key = key << 4
    key = key << 4
    return key


# ARRAY IS GIVEN
arr = [77688,77616,77682,77663,77665,77678,77668,77663,77676,77616,77671,77617,77667,77632,77676,77663,77683,77672,77617,77670,77684,77663,77669,77632,77683,77689,77663,77682,77617,77671,77672,77624,77631,77631]

key = key_gen()
print('GLUG{',end='')
for i in arr:
    print(chr(i ^ key),end='')
print('}')
```

> FLAG : GLUG{x0r_and_l0g1c@l_sh1ft_e@sy_r1gh8??}