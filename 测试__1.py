import random as r
i = 0
a = []

while True:
    b = r.randint(1,40)
    c = r.randint(1,10)
    if b not in a:
        a.append(b)
        print(b,'',end = '')
        if len(a) == 6:
            break


print()
print(a,c)

    
