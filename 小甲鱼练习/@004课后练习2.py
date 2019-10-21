n =  input('please enter an integer:')
temp = int(n)
while temp :
    s = temp - 1
    while  s :
        print(' ',end = '')
        s -=1
    j = temp
    while j :
        print("*",end = '')
        j -=1
    print()
    temp -=1
