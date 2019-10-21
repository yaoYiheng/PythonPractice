result_1 = 0
result_1 = input('Enter your score or"done"')
while result_1 != "done":
    result = int(result_1)
    if result >= 90:
        result = 'A'
    elif result >= 80:
        result = 'B'
    elif result >=70:
        result = 'C'
    elif result >= 60:
        result = 'D'
    else:
        result ='bujige'
    print(result)
    result_1 = input('Enter your score or"done"')
print()

    
