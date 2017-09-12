n = int(input('how many numbers to sum?'))
total = 0
for i in range(n):
    s = input('enter number ' + str(i+1) + ': ')
    total = total + int(s)
print('the total is '+str(total))
