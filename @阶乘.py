def factorial(n):
    result = n
    for i in range(1,n):
        result *= i

    return result

number = int(input('please enter an integer:'))
result = factorial(number)
print("%d factorial is %d12"%(number,result))
