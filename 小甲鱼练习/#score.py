n = int(input('how many scores do you want to input?'))
i = 1
while i<=n:
    result = int(input('enter score '+str(i)+':'))
    if result >= 90:
        print('A')
        print('Next')
    elif result >= 80:
        print('B')
        print('next')
    elif result >=70:
        print('C')
        print('next')
    elif result >= 60:
        print('D')
        print('next')
    else:
        print('bujige')
        print('next')
    print()
    i+=1
    
