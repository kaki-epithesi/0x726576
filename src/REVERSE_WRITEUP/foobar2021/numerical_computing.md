# Numerical Computing

[link to question](https://github.com/kaki-epithesi/0x726576/raw/master/rev_files/foobar2021/try)

This was simple fortran program.

```py
program question

    implicit none

! Type declarations
    character(len=18) :: inp
    character(len=18) :: enc
    character :: c1,c2,c
    integer :: n,x,x1,x2,f
    integer, dimension (18) :: num, num1, num2
    f=0
    enc = "QWERTYUIOPASDFGHJK"
    num = (/352, 108, 256, 84, 752, 160, 1648, 480, 1968, 204, 592, 404, 1792, 456, 576, 168, 1968, 216/)
    print*,"Enter the flag : "
    read(*,*)inp
    do n = 1,18
        c1 = enc(n:n)
        c2 = inp(n:n)
        x1 = IACHAR(c1)
        x2 = IACHAR(c2)
        num2(n) = XOR(x1,x2)
    end do


    do n = 1, 18
        if(MOD(n-1,2) .eq. 1) then
            num1(n) = LSHIFT(num2(n), 2)
        else
            num1(n) = LSHIFT(num2(n), 4)
        end if
    end do

    do n=1,18
        if(num1(n) == num(n)) then
            f = f+1
        end if
    end do
    if(f == 18) then
        print*,"you got it"
    else
        print*,"Wrong"
    end if

end program question
```

**solver script**

```py
#!/usr/bin/env python3

enc = [352, 108, 256, 84, 752, 160, 1648, 480, 1968, 204, 592, 404, 1792, 456, 576, 168, 1968, 216]
enc1 = []

for i in range(len(enc)):
    if i&1:
        enc1.append(enc[i] >> 2)
    else:
        enc1.append(enc[i] >> 4)

enc_text = 'QWERTYUIOPASDFGHJK'

flag = ''

for i in range(len(enc1)):
    flag += chr(ord(enc_text[i]) ^ enc1[i])
print(flag)
```

> FLAG : GLUG{q214cd644cb1}