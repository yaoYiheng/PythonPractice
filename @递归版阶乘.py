def factorial(n):
    if n ==1:
        return 1
    else:
        return n * factorial(n-1)

number = int(input('please enter an integer:'))
result = factorial(number)
print("%d 's facotorial is :%d" % (number,result))
