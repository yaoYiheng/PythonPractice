factindex = 0
while factindex < 10:
    n = int(input('Enter an interger >=0:'))
    fact = 1
    i = 2
    while i<= n:
        fact = fact*i
        i += 1
    print(str(n) + ' factorial is :'+ str(fact))
    factindex +=1
    
