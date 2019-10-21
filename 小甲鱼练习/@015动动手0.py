m = input('enter an integer or (Q to quit the program):')
sl = 0
ba = 0
er = 0
Q = "Q"
while m != Q:
    n = int(m)
    if n:
        sl = "%x" %n
        ba = "%o" %n
        er = bin(n)
        print('sjz'+'-->'+str(sl))
        print('sjz' +'-->' + str(ba))
        print('sjz'+'-->'+ str(er))
        print()
    
