n = int(input('how many scores do you want to input?'))
i = 1
while i<=n:
    result = int(input('enter score '+str(i)+':'))
    if result >= 90:
        print('A')
    elif result >= 80:
        print('B')
    elif result >=70:
        print('C')
    elif result >= 60:
        print('D')
    else:
        print('bujige')
    print('NEXT')
    print()
    i+=1
    
